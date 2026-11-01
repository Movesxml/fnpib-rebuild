import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import java.math.BigInteger;

/** Recreate a verified entry after an earlier incomplete auto-analysis fragment. */
public class RepairFunction extends GhidraScript {
    @Override
    protected void run() throws Exception {
        for (String arg : getScriptArgs()) {
            Address entry = toAddr(Long.parseLong(arg.replace("0x", ""), 16));
            currentProgram.getFunctionManager().removeFunction(entry);
            clearListing(entry, entry.add(7));
            currentProgram.getProgramContext().setValue(
                currentProgram.getProgramContext().getRegister("TMode"),
                entry, entry.add(7), BigInteger.ONE);
            disassemble(entry);
            String hex = arg.toLowerCase().replace("0x", "");
            createFunction(entry, String.format("FUN_%08x", Long.parseLong(hex, 16)));
        }
    }
}
