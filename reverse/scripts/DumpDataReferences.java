import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.symbol.Reference;
import java.io.File;
import java.io.PrintWriter;

/** 导出指定绝对地址的全部直接引用，区分读取和写入。 */
public class DumpDataReferences extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        try (PrintWriter pw = new PrintWriter(new File(args[0]), "UTF-8")) {
            pw.println("# 全局地址直接引用\n");
            pw.println("- 程序: " + currentProgram.getName() + "\n");
            for (int i = 1; i < args.length; i++) {
                Address target = toAddr(Long.parseLong(args[i].replace("0x", ""), 16));
                pw.println("## " + target + "\n");
                int count = 0;
                for (Reference ref : currentProgram.getReferenceManager().getReferencesTo(target)) {
                    Address from = ref.getFromAddress();
                    Function function = currentProgram.getFunctionManager().getFunctionContaining(from);
                    Instruction instruction = currentProgram.getListing().getInstructionAt(from);
                    pw.println("- " + ref.getReferenceType() + " @ " + from
                            + " in " + (function == null ? "<no function>" : function.getName())
                            + ": " + (instruction == null ? "<no instruction>" : instruction.toString()));
                    count++;
                }
                pw.println("引用数: " + count + "\n");
            }
        }
    }
}
