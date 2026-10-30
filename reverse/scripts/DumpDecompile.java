import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionManager;
import java.io.File;
import java.io.PrintWriter;

/** DumpDecompile: 导出已定义函数的反编译伪代码到目录。用法见 reverse/README.md */
public class DumpDecompile extends GhidraScript {

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File outDir = new File(args.length > 0 ? args[0] : "decompiled");
        int cap = args.length > 1 ? Integer.parseInt(args[1]) : 200;
        outDir.mkdirs();

        DecompInterface decomp = new DecompInterface();
        decomp.openProgram(currentProgram);
        FunctionManager fm = currentProgram.getFunctionManager();

        int n = 0;
        for (Function f : fm.getFunctions(true)) {
            if (n >= cap) break;
            if (f.isThunk()) continue;
            if (f.getBody().getNumAddresses() > 4000) continue;  // 跳过巨型函数，防单点超时
            String safe = f.getName().replaceAll("[^A-Za-z0-9_.-]", "_");
            DecompileResults res = decomp.decompileFunction(f, 12, monitor);
            if (res == null || !res.decompileCompleted()) continue;
            File out = new File(outDir, String.format("%04d_%s.c", n, safe));
            try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
                pw.println("// function: " + f.getName());
                pw.println("// entry:    " + f.getEntryPoint());
                pw.println("// body:     " + f.getBody().getNumAddresses() + " bytes");
                pw.println(res.getDecompiledFunction().getC());
            }
            n++;
        }
        decomp.dispose();
        println("DECOMPILED_COUNT=" + n);
    }
}
