import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import java.io.File;
import java.io.PrintWriter;

/** Find and fully decompile virtual calls at a chosen vtable byte offset in an address range. */
public class FindVirtualCalls extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File out = new File(args[0]);
        long start = Long.parseLong(args[1].replace("0x", ""), 16);
        long end = Long.parseLong(args[2].replace("0x", ""), 16);
        String offset = args[3].replace("0x", "").toLowerCase();
        DecompInterface decompiler = new DecompInterface();
        decompiler.openProgram(currentProgram);
        int hits = 0;
        try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
            pw.println("# 指定虚表偏移调用（完整反编译）\n");
            for (Function function : currentProgram.getFunctionManager().getFunctions(true)) {
                Address entry = function.getEntryPoint();
                long value = entry.getOffset();
                if (value < start || value >= end) continue;
                DecompileResults result = decompiler.decompileFunction(function, 60, monitor);
                if (result == null || !result.decompileCompleted()) continue;
                String c = result.getDecompiledFunction().getC();
                String lower = c.toLowerCase();
                if (!lower.contains("code **") || !lower.contains("+ 0x" + offset + "))")) continue;
                hits++;
                pw.println("## " + function.getName() + " — " + entry + "\n");
                pw.println("```c\n" + c + "\n```\n");
            }
            pw.println("命中函数数: " + hits);
        } finally {
            decompiler.dispose();
        }
        println("WROTE " + out.getAbsolutePath() + " HITS=" + hits);
    }
}
