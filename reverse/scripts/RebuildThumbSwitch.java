import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.address.AddressSet;
import ghidra.program.model.listing.Instruction;
import java.math.BigInteger;

/**
 * Repair only a known Thumb switch's overlapping instruction listing.
 * Usage: output-independent arguments are clearStart:clearEnd, then case entries.
 * The owning function is deliberately not removed or recreated.
 */
public class RebuildThumbSwitch extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        String[] range = args[0].split(":");
        Address clearStart = toAddr(Long.parseLong(range[0].replace("0x", ""), 16));
        Address clearEnd = toAddr(Long.parseLong(range[1].replace("0x", ""), 16));
        currentProgram.getListing().clearCodeUnits(clearStart, clearEnd, false);
        var context = currentProgram.getProgramContext();
        var tmode = context.getRegister("TMode");
        context.setValue(tmode, clearStart, clearEnd, BigInteger.ONE);
        for (int i = 1; i < args.length; i++) {
            Address address = toAddr(Long.parseLong(args[i].replace("0x", ""), 16));
            Instruction existing = currentProgram.getListing().getInstructionAt(address);
            if (existing == null) {
                println("DISASSEMBLE " + address + " " + disassemble(address));
            } else {
                println("EXISTS " + address + " " + existing);
            }
        }
    }
}
