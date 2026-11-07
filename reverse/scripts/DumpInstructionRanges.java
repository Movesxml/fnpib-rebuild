import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.symbol.Reference;
import java.io.File;
import java.io.PrintWriter;

/** Dump a linear instruction range; arguments are start:end hex addresses. */
public class DumpInstructionRanges extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        try (PrintWriter pw = new PrintWriter(new File(args[0]), "UTF-8")) {
            for (int i = 1; i < args.length; i++) {
                String[] range = args[i].split(":");
                Address start = toAddr(Long.parseLong(range[0].replace("0x", ""), 16));
                Address end = toAddr(Long.parseLong(range[1].replace("0x", ""), 16));
                pw.println("## " + start + ".." + end);
                Instruction instruction = currentProgram.getListing().getInstructionAt(start);
                while (instruction != null && instruction.getAddress().compareTo(end) < 0) {
                    pw.print(instruction.getAddress() + "  " + instruction);
                    for (Reference ref : instruction.getReferencesFrom()) {
                        pw.print("  ; " + ref.getReferenceType() + " -> " + ref.getToAddress());
                    }
                    pw.println();
                    instruction = instruction.getNext();
                }
            }
        }
    }
}
