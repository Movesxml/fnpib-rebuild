import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Instruction;
import java.math.BigInteger;

/** Disassemble known Thumb case entries without splitting the owning function. */
public class DisassembleThumbCases extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        for (String arg : args) {
            long offset = Long.parseLong(arg.replace("0x", ""), 16);
            Address address = toAddr(offset);
            currentProgram.getProgramContext().setValue(
                currentProgram.getProgramContext().getRegister("TMode"),
                address, address, BigInteger.ONE);
            Instruction existing = currentProgram.getListing().getInstructionAt(address);
            if (existing == null) {
                boolean ok = disassemble(address);
                println("DISASSEMBLE " + address + " " + ok);
            } else {
                println("EXISTS " + address + " " + existing);
            }
        }
    }
}
