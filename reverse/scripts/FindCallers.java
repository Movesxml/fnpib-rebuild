import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import java.io.File;
import java.io.PrintWriter;
import java.util.Set;

/** FindCallers: 列出指定函数（含 thunk）的直接调用者。
 * 用法: -postScript FindCallers.java 输出.txt <hexaddr> [hexaddr...]
 */
public class FindCallers extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File out = new File(args[0]);
        try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
            for (int i = 1; i < args.length; i++) {
                String hex = args[i].toLowerCase().replace("0x", "");
                Function target = null;
                for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
                    if (f.getName().equalsIgnoreCase("FUN_" + hex)
                            || f.getName().equalsIgnoreCase("thunk_FUN_" + hex)) {
                        target = f;
                        break;
                    }
                }
                pw.println("TARGET " + hex + " -> " + (target == null ? "未找到" : target.getName()));
                if (target == null) continue;
                Set<Function> callers = target.getCallingFunctions(monitor);
                for (Function caller : callers) {
                    pw.println(caller.getName() + "\t" + caller.getEntryPoint()
                            + "\t" + caller.getBody().getNumAddresses());
                }
                pw.println();
            }
        }
        println("WROTE " + out.getAbsolutePath());
    }
}
