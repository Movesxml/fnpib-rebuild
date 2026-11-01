import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.symbol.Reference;
import java.io.File;
import java.io.PrintWriter;

/** 导出指定线性地址范围内的指令，包含没有 Function 节点的导入跳转桩。 */
public class DumpInstructions extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        try (PrintWriter pw = new PrintWriter(new File(args[0]), "UTF-8")) {
            for (int i = 1; i < args.length; i++) {
                Address start = toAddr(Long.parseLong(args[i].replace("0x", ""), 16));
                Address end = start.add(24);
                pw.println("## " + start);
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
