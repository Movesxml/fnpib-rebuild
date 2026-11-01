import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;

/** Create function nodes only at verified instruction entry addresses. */
public class CreateFunctions extends GhidraScript {
    @Override
    protected void run() throws Exception {
        for (String arg : getScriptArgs()) {
            Address entry = toAddr(Long.parseLong(arg.replace("0x", ""), 16));
            if (currentProgram.getFunctionManager().getFunctionAt(entry) == null) {
                if (currentProgram.getListing().getInstructionAt(entry) == null) {
                    disassemble(entry);
                }
                String hex = arg.toLowerCase().replace("0x", "");
                createFunction(entry, String.format("FUN_%08x", Long.parseLong(hex, 16)));
            }
        }
    }
}
