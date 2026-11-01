import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionManager;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.ReferenceManager;
import java.io.File;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * LocateCore: 字符串定位器（分析无关的立即数扫描版）。
 *
 * 原理: 代码引用字符串地址时, 该地址(4字节LE)会出现在可执行块中。
 * 直接扫描 .text 中所有 4 字节值建立 值→位置 索引, 再反查字符串地址,
 * 不依赖 Ghidra 分析进度(部分分析也能用)。
 *
 * 参数: [0]=输出md [1]=反编译函数上限(默认40) [2]=逗号分隔关键词(默认玩法关键词)
 * [3]=每个字符串命中点的引用报告上限(默认12)
 */
public class LocateCore extends GhidraScript {

    static final String[] DEFAULT_KEYWORDS = {
        "combo", "critical", "wave", "highscore", "score",
        "fruit", "slash", "blade", "frenzy", "freeze", "bomb", "dojo", "bandito"
    };

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File outFile = new File(args.length > 0 ? args[0] : "located.md");
        int cap = args.length > 1 ? Integer.parseInt(args[1]) : 40;
        // 注意: Ghidra 会按逗号和空格同时切分脚本参数, 关键词需从 args[2:] 全部收集
        final String[] KW = args.length > 2
                ? java.util.Arrays.copyOfRange(args, 2, args.length)
                : DEFAULT_KEYWORDS;
        final int refCap = 12;

        FunctionManager fm = currentProgram.getFunctionManager();
        println("FUNCTION_COUNT=" + fm.getFunctionCount());

        // ---- 0) 计算地址修正量 delta ----
        // 某些 PE 被 Ghidra 以 imageBase=0 载入, 而 .text 中的绝对立即数仍带首选基址(如 0x400000)
        // delta = 首选基址 - Ghidra 基址; 反查字符串时用 strAddr + delta
        long ghidraBase = currentProgram.getImageBase().getOffset();
        long prefBase = ghidraBase;
        try {
            var mem = currentProgram.getMemory();
            var imgBase = currentProgram.getImageBase();
            long peOff = mem.getInt(imgBase.add(0x3c)) & 0xFFFFFFFFL;
            int sig = mem.getShort(imgBase.add(peOff)) & 0xFFFF;
            if (sig == 0x4550) { // 'PE'
                prefBase = mem.getInt(imgBase.add(peOff + 0x34)) & 0xFFFFFFFFL;
            }
        } catch (Exception ignored) { /* 非 PE, 保持 delta=0 */ }
        final long DELTA = prefBase - ghidraBase;
        println("GHIDRA_BASE=" + Long.toHexString(ghidraBase) + " PREF_BASE=" + Long.toHexString(prefBase)
                + " DELTA=" + Long.toHexString(DELTA));

        // ---- 1) 收集可执行块的 4 字节 LE 值索引: value -> 引用位置列表 ----
        Map<Integer, List<Address>> immIndex = new HashMap<>();
        List<MemoryBlock> execBlocks = new ArrayList<>();
        for (MemoryBlock b : currentProgram.getMemory().getBlocks()) {
            if (b.isExecute() && b.isInitialized()) execBlocks.add(b);
        }
        for (MemoryBlock b : execBlocks) {
            byte[] code = new byte[(int) b.getSize()];
            b.getBytes(b.getStart(), code);
            ByteBuffer bb = ByteBuffer.wrap(code).order(ByteOrder.LITTLE_ENDIAN);
            for (int i = 0; i + 4 <= code.length; i += 2) { // 2 步进: arm thumb/x86 混合对齐
                int v = bb.getInt(i);
                if (v != 0) {
                    immIndex.computeIfAbsent(v, k -> new ArrayList<>(2))
                            .add(b.getStart().add(i));
                }
            }
        }
        println("EXEC_BLOCKS=" + execBlocks.size() + " IMM_VALUES=" + immIndex.size());

        // ---- 调试: 列出所有块 ----
        if (System.getenv("LOCATE_DEBUG") != null) {
            for (MemoryBlock b : currentProgram.getMemory().getBlocks()) {
                println("BLOCK " + b.getName() + " size=" + b.getSize()
                        + " init=" + b.isInitialized() + " exec=" + b.isExecute()
                        + " start=" + b.getStart());
            }
        }

        // ---- 2) 扫描非执行块中的关键词 → 字符串地址 → 反查引用位置 ----
        ReferenceManager rm = currentProgram.getReferenceManager();
        Map<Function, List<String>> funcReasons = new LinkedHashMap<>();
        Map<Address, List<String>> orphanRefs = new LinkedHashMap<>(); // 无函数包含的裸引用点
        int stringHits = 0, immHits = 0;

        for (MemoryBlock block : currentProgram.getMemory().getBlocks()) {
            if (!block.isInitialized() || block.isExecute()) continue;
            if (block.getSize() <= 0 || block.getSize() > 16 * 1024 * 1024) continue;
            byte[] bytes = new byte[(int) block.getSize()];
            block.getBytes(block.getStart(), bytes);
            String lower = new String(bytes, StandardCharsets.ISO_8859_1).toLowerCase(Locale.ROOT);
            for (String k : KW) {
                String kl = k.toLowerCase(Locale.ROOT);
                int from = 0, n = 0;
                while (n < 8) {
                    int idx = lower.indexOf(kl, from);
                    if (idx < 0) break;
                    // 关键词常位于完整路径/句子内部，但代码引用的是 NUL 字符串起点。
                    // 向前找到起点，避免拿 "fruit.cpp" 的子串地址做无效 xref。
                    int strStart = idx;
                    while (strStart > 0 && bytes[strStart - 1] != 0) strStart--;
                    Address strAddr = block.getStart().add(strStart);
                    stringHits++;
                    n++;
                    // 2a) 分析引用
                    for (Reference r : rm.getReferencesTo(strAddr)) {
                        Function f = fm.getFunctionContaining(r.getFromAddress());
                        if (f != null) {
                            funcReasons.computeIfAbsent(f, x -> new ArrayList<>())
                                       .add(k + "@" + strAddr);
                        }
                    }
                    // 2b) 立即数反查（分析无关；加 delta 兼容 PE 基址不一致）
                    List<Address> refs = immIndex.get((int) (strAddr.getOffset() + DELTA));
                    if (refs != null) {
                        immHits += refs.size();
                        int shown = 0;
                        for (Address refAddr : refs) {
                            if (shown >= refCap) break;
                            Function f = fm.getFunctionContaining(refAddr);
                            if (f != null) {
                                funcReasons.computeIfAbsent(f, x -> new ArrayList<>())
                                           .add(k + "@" + strAddr + "(imm)");
                                shown++;
                            } else {
                                orphanRefs.computeIfAbsent(refAddr, x -> new ArrayList<>())
                                          .add(k + "@" + strAddr);
                            }
                        }
                    }
                    from = idx + kl.length();
                }
            }
        }
        println("STRING_HITS=" + stringHits + " IMM_HITS=" + immHits);
        println("HIT_FUNCTIONS=" + funcReasons.size() + " ORPHAN_REFS=" + orphanRefs.size());

        // ---- 3) 反编译 + 报告 ----
        DecompInterface decomp = new DecompInterface();
        decomp.openProgram(currentProgram);
        try (PrintWriter pw = new PrintWriter(outFile, "UTF-8")) {
            pw.println("# 字符串定位报告（立即数扫描）\n");
            pw.println("- 程序: " + currentProgram.getName());
            pw.println("- 已定义函数: " + fm.getFunctionCount());
            pw.println("- 命中函数: " + funcReasons.size() + "，裸引用点(未纳入函数): " + orphanRefs.size() + "\n");
            int n = 0;
            for (Map.Entry<Function, List<String>> e : funcReasons.entrySet()) {
                if (n >= cap) break;
                Function f = e.getKey();
                if (f.getBody().getNumAddresses() > 6000) continue;
                pw.println("## " + f.getName() + " — " + f.getEntryPoint());
                pw.println("命中: " + String.join(", ", e.getValue().stream().distinct().toList()) + "\n");
                DecompileResults res = decomp.decompileFunction(f, 8, monitor);
                if (res != null && res.decompileCompleted()) {
                    String c = res.getDecompiledFunction().getC();
                    pw.println("```c");
                    pw.println(c.length() > 4000 ? c.substring(0, 4000) + "\n/* ...截断... */" : c);
                    pw.println("```\n");
                } else {
                    pw.println("(反编译未完成)\n");
                }
                n++;
            }
        }
        decomp.dispose();
        println("WROTE " + outFile.getAbsolutePath());
    }
}
