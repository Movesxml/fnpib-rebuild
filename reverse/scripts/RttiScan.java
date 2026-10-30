import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionManager;
import ghidra.program.model.mem.Memory;
import ghidra.program.model.mem.MemoryBlock;
import java.io.File;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

/**
 * RttiScan: 从 RTTI 类名字符串（.?AVxxx@@）反查虚表并导出前 N 个虚函数。
 * 用法: -postScript RttiScan.java 输出.md 类名子串 [类名子串...] [槽位数]
 * 原理: TypeDescriptor = 名字串地址-8；COL 在 +8 处存 TypeDescriptor 指针；
 *       vftable[-1] = COL 地址，故 vftable = 指向 COL 的指针地址 +4。
 */
public class RttiScan extends GhidraScript {

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File outFile = new File(args[0]);
        List<String> kws = new ArrayList<>();
        int slots = 8;
        for (int i = 1; i < args.length; i++) {
            try { slots = Integer.parseInt(args[i]); }
            catch (NumberFormatException e) { kws.add(args[i]); }
        }
        if (kw_isempty(kws)) kws.add("Fruit");

        Memory mem = currentProgram.getMemory();
        FunctionManager fm = currentProgram.getFunctionManager();
        // 收集全部非执行块的字节与起始地址，用于指针反查
        List<MemoryBlock> dataBlocks = new ArrayList<>();
        for (MemoryBlock b : mem.getBlocks()) {
            if (b.isInitialized() && !b.isExecute() && b.getSize() > 0 && b.getSize() <= 64 * 1024 * 1024)
                dataBlocks.add(b);
        }

        try (PrintWriter pw = new PrintWriter(outFile, "UTF-8")) {
            pw.println("# RTTI 虚表扫描\n");
            for (String kw : kws) {
                pw.println("## 关键字: " + kw + "\n");
                boolean any = false;
                for (MemoryBlock b : mem.getBlocks()) {
                    if (!b.isInitialized() || b.isExecute()) continue;
                    if (b.getSize() <= 0 || b.getSize() > 64 * 1024 * 1024) continue;
                    byte[] bytes = new byte[(int) b.getSize()];
                    b.getBytes(b.getStart(), bytes);
                    // 找类名串（形如 .?AVFruit@@）
                    int from = 0;
                    while (true) {
                        int idx = indexOfAscii(bytes, ".?AV", from);
                        if (idx < 0) break;
                        int end = idx;
                        while (end < bytes.length && bytes[end] != 0 && end - idx < 200) end++;
                        String name = new String(bytes, idx, end - idx, "UTF-8");
                        from = end + 1;
                        if (!name.contains(kw)) continue;
                        any = true;
                        long nameAddr = b.getStart().getOffset() + idx;
                        pw.println("### " + name + "（字符串 @ " + toHex(nameAddr) + "）");
                        long typeDesc = nameAddr - 8;
                        // 反查指向 TypeDescriptor 的指针 → COL
                        List<Long> colPtrs = findPtrTo(dataBlocks, mem, typeDesc);
                        for (long colPtr : colPtrs) {
                            long col = colPtr - 8;  // 指针位于 COL+8
                            pw.println("- COL @ " + toHex(col) + "（pTypeDescriptor 指针 @ " + toHex(colPtr) + "）");
                            // 反查指向 COL 的指针 → vftable[-1]
                            List<Long> vfs = findPtrTo(dataBlocks, mem, col);
                            for (long vf : vfs) {
                                long vftable = vf + 4;
                                pw.println("  - vftable @ " + toHex(vftable) + ":");
                                for (int s = 0; s < slots; s++) {
                                    int fp = mem.getInt(toAddr(vftable + s * 4));
                                    Address fa = toAddr(fp & 0xFFFFFFFFL);
                                    Function f = fm.getFunctionAt(fa);
                                    pw.println("    - [" + s + "] +0x" + Integer.toHexString(s * 4)
                                            + " -> " + toHex(fp & 0xFFFFFFFFL)
                                            + (f != null ? "  " + f.getName() : "  (无函数)"));
                                }
                            }
                        }
                        pw.println();
                    }
                }
                if (!any) pw.println("(未找到匹配 .?AV 串)\n");
            }
        }
        println("WROTE " + outFile.getAbsolutePath());
    }

    private static boolean kw_isempty(List<String> l) { return l.isEmpty(); }

    private static String toHex(long v) { return String.format("0x%08x", v); }

    private int indexOfAscii(byte[] hay, String needle, int from) {
        byte[] n = needle.getBytes();
        outer: for (int i = from; i + n.length <= hay.length; i++) {
            for (int j = 0; j < n.length; j++) if (hay[i + j] != n[j]) continue outer;
            return i;
        }
        return -1;
    }

    /** 在所有数据块中反查 4 字节 LE 指针值，返回持有者地址列表（上限 16） */
    private List<Long> findPtrTo(List<MemoryBlock> blocks, Memory mem, long target) throws Exception {
        List<Long> out = new ArrayList<>();
        int cap = 16;
        for (MemoryBlock b : blocks) {
            if (out.size() >= cap) break;
            byte[] bytes = new byte[(int) b.getSize()];
            b.getBytes(b.getStart(), bytes);
            ByteBuffer bb = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
            for (int i = 0; i + 4 <= bytes.length && out.size() < cap; i += 4) {
                if ((bb.getInt(i) & 0xFFFFFFFFL) == target)
                    out.add(b.getStart().getOffset() + i);
            }
        }
        return out;
    }
}
