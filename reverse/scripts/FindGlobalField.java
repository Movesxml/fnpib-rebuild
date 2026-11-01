import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.symbol.Reference;
import java.io.File;
import java.io.PrintWriter;
import java.util.LinkedHashSet;
import java.util.Set;

/** 导出引用指定全局指针、且反编译包含指定字段偏移的所有函数。 */
public class FindGlobalField extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File out = new File(args[0]);
        Address global = toAddr(Long.parseLong(args[1].replace("0x", ""), 16));
        String field = args[2].replace("0x", "").toLowerCase();

        Set<Function> functions = new LinkedHashSet<>();
        for (Reference ref : currentProgram.getReferenceManager().getReferencesTo(global)) {
            Function function = currentProgram.getFunctionManager()
                    .getFunctionContaining(ref.getFromAddress());
            if (function != null) functions.add(function);
        }

        DecompInterface decompiler = new DecompInterface();
        decompiler.openProgram(currentProgram);
        int hits = 0;
        try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
            pw.println("# 全局字段引用函数（完整反编译）\n");
            pw.println("- 全局地址: " + global);
            pw.println("- 字段偏移: 0x" + field);
            pw.println("- 直接引用函数数: " + functions.size() + "\n");
            for (Function function : functions) {
                DecompileResults result = decompiler.decompileFunction(function, 60, monitor);
                if (result == null || !result.decompileCompleted()) continue;
                String c = result.getDecompiledFunction().getC();
                if (!c.toLowerCase().contains("+ 0x" + field)) continue;
                hits++;
                pw.println("## " + function.getName() + " — " + function.getEntryPoint() + "\n");
                pw.println("```c");
                pw.println(c);
                pw.println("```\n");
            }
            pw.println("命中函数数: " + hits);
        } finally {
            decompiler.dispose();
        }
        println("WROTE " + out.getAbsolutePath() + " HITS=" + hits);
    }
}
