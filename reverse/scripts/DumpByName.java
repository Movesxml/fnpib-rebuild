import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionManager;
import java.io.File;
import java.io.PrintWriter;

/**
 * DumpByName: 按地址导出指定函数的【完整未截断】反编译。
 * 用法: -postScript DumpByName.java 输出.md <hexaddr> [hexaddr...]
 * 地址为函数入口（十六进制，不带 0x），如 00bda510 或 00016214。
 */
public class DumpByName extends GhidraScript {

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File outFile = new File(args[0]);
        FunctionManager fm = currentProgram.getFunctionManager();

        DecompInterface decomp = new DecompInterface();
        decomp.openProgram(currentProgram);

        try (PrintWriter pw = new PrintWriter(outFile, "UTF-8")) {
            pw.println("# 完整反编译导出（无截断）\n");
            pw.println("- 程序: " + currentProgram.getName() + "\n");
            for (int i = 1; i < args.length; i++) {
                String hex = args[i].trim();
                if (hex.isEmpty()) continue;
                // 优先按 Ghidra 函数名匹配（FUN_<hex>），与载入基址无关
                final String want = "FUN_" + hex.toLowerCase();
                Function f = null;
                for (Function cand : fm.getFunctions(true)) {
                    if (cand.getName().equalsIgnoreCase(want)) { f = cand; break; }
                }
                if (f == null) {  // 兜底：按地址（含 imageBase）找
                    long off = Long.parseLong(hex, 16);
                    Address addr = currentProgram.getImageBase().add(off);
                    f = fm.getFunctionAt(addr);
                    if (f == null) f = fm.getFunctionContaining(addr);
                }
                pw.println("## FUN_" + hex + " — " + (f != null ? f.getEntryPoint() : "未找到") + "\n");
                if (f == null) {
                    pw.println("(函数未找到)\n");
                    continue;
                }
                pw.println("- 函数名: " + f.getName());
                pw.println("- 函数体: " + f.getBody().getNumAddresses() + " 字节");
                pw.println("- 调用者数: " + f.getCallingFunctions(monitor).size()
                        + " / 被调用者数: " + f.getCalledFunctions(monitor).size() + "\n");
                DecompileResults res = decomp.decompileFunction(f, 60, monitor);
                if (res != null && res.decompileCompleted()) {
                    pw.println("```c");
                    pw.println(res.getDecompiledFunction().getC());  // 完整输出，不截断
                    pw.println("```\n");
                } else {
                    pw.println("(反编译超时或失败)\n");
                }
            }
        }
        decomp.dispose();
        println("WROTE " + outFile.getAbsolutePath());
    }
}
