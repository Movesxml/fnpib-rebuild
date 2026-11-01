import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.symbol.Reference;
import java.io.File;
import java.io.PrintWriter;

/** 导出指定函数的完整反汇编及指令引用，供反编译失败时核实调用顺序。 */
public class DumpAssembly extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File out = new File(args[0]);
        try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
            for (int i = 1; i < args.length; i++) {
                String hex = args[i].replace("0x", "").toLowerCase();
                Function target = null;
                for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
                    if (f.getName().equalsIgnoreCase("FUN_" + hex)) { target = f; break; }
                }
                pw.println("## " + hex + " -> " + (target == null ? "未找到" : target.getName()));
                if (target == null) continue;
                for (Instruction instruction : currentProgram.getListing().getInstructions(target.getBody(), true)) {
                    pw.print(instruction.getAddress() + "  " + instruction);
                    for (Reference ref : instruction.getReferencesFrom()) {
                        Function called = currentProgram.getFunctionManager().getFunctionAt(ref.getToAddress());
                        pw.print("  ; " + ref.getReferenceType() + " -> " + ref.getToAddress()
                                + (called == null ? "" : " " + called.getName()));
                    }
                    pw.println();
                }
                pw.println();
            }
        }
        println("WROTE " + out.getAbsolutePath());
    }
}
