import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import java.io.File;
import java.io.PrintWriter;

/** DumpFunctions: 导出全部函数 名称/入口/大小 到文本。参数1: 输出路径 */
public class DumpFunctions extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File out = new File(args.length > 0 ? args[0] : "functions.txt");
        int n = 0;
        try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
            for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
                pw.printf("%s\t%s\t%d%n", f.getName(), f.getEntryPoint(),
                          f.getBody().getNumAddresses());
                n++;
                if ((n & 0x3FFF) == 0) monitor.checkCanceled();
            }
        }
        println("DUMPED " + n + " -> " + out.getAbsolutePath());
    }
}
