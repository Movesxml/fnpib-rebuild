import ghidra.app.script.GhidraScript;
import java.io.File;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

/** Locate exact NUL-terminated strings in initialized, non-executable memory. */
public class SearchStrings extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        try (PrintWriter pw = new PrintWriter(new File(args[0]), "UTF-8")) {
            for (int i = 1; i < args.length; i++) {
                byte[] wanted = (args[i] + "\0").getBytes(StandardCharsets.UTF_8);
                pw.println("## " + args[i]);
                int found = 0;
                for (var block : currentProgram.getMemory().getBlocks()) {
                    if (!block.isInitialized() || block.isExecute()) continue;
                    for (var address = block.getStart(); address.compareTo(block.getEnd()) <= 0; address = address.next()) {
                        boolean match = true;
                        for (int j = 0; j < wanted.length; j++) {
                            if (currentProgram.getMemory().getByte(address.add(j)) != wanted[j]) {
                                match = false;
                                break;
                            }
                        }
                        if (match) {
                            pw.println(address);
                            if (++found >= 20) break;
                        }
                    }
                }
                pw.println("count=" + found);
            }
        }
    }
}
