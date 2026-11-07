import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import java.io.File;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

/** Dump NUL-terminated UTF-8/ASCII strings at explicit Mach-O addresses. */
public class DumpStrings extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        try (PrintWriter pw = new PrintWriter(new File(args[0]), "UTF-8")) {
            for (int i = 1; i < args.length; i++) {
                Address address = toAddr(Long.parseLong(args[i].replace("0x", ""), 16));
                byte[] bytes = new byte[512];
                int length = 0;
                while (length < bytes.length) {
                    byte value = currentProgram.getMemory().getByte(address.add(length));
                    if (value == 0) break;
                    bytes[length++] = value;
                }
                pw.println(address + "\t" + new String(bytes, 0, length, StandardCharsets.UTF_8));
            }
        }
    }
}
