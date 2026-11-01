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

/** 导出直接引用指定函数、且反编译包含指定字段偏移的所有函数。 */
public class FindCallField extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File out = new File(args[0]);
        Address callee = toAddr(Long.parseLong(args[1].replace("0x", ""), 16));
        String field = args[2].replace("0x", "").toLowerCase();
        Set<Function> functions = new LinkedHashSet<>();
        for (Reference ref : currentProgram.getReferenceManager().getReferencesTo(callee)) {
            Function function = currentProgram.getFunctionManager().getFunctionContaining(ref.getFromAddress());
            if (function != null) functions.add(function);
        }
        DecompInterface decompiler = new DecompInterface();
        decompiler.openProgram(currentProgram);
        int hits = 0;
        try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
            pw.println("# 调用目标并访问字段的函数（完整反编译）\n");
            pw.println("- 目标: " + callee + "\n- 字段: 0x" + field);
            pw.println("- 直接引用函数数: " + functions.size() + "\n");
            for (Function function : functions) {
                DecompileResults result = decompiler.decompileFunction(function, 60, monitor);
                if (result == null || !result.decompileCompleted()) continue;
                String c = result.getDecompiledFunction().getC();
                if (!c.toLowerCase().contains("+ 0x" + field)) continue;
                hits++;
                pw.println("## " + function.getName() + " — " + function.getEntryPoint() + "\n");
                pw.println("```c\n" + c + "\n```\n");
            }
            pw.println("命中函数数: " + hits);
        } finally {
            decompiler.dispose();
        }
        println("WROTE " + out.getAbsolutePath() + " HITS=" + hits);
    }
}
