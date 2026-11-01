import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.mem.MemoryBlock;
import java.io.File;
import java.io.PrintWriter;

/** 在非执行段反查函数入口指针，并打印相邻槽位，用于闭合未知虚表回调。 */
public class FindFunctionPointers extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File out = new File(args[0]);
        try (PrintWriter pw = new PrintWriter(out, "UTF-8")) {
            pw.println("# 函数入口指针引用\n");
            for (int i = 1; i < args.length; i++) {
                long value = Long.parseLong(args[i].replace("0x", ""), 16);
                Function target = currentProgram.getFunctionManager().getFunctionAt(toAddr(value));
                pw.println("## " + args[i] + " -> " + (target == null ? "非函数入口" : target.getName()));
                int hits = 0;
                for (MemoryBlock block : currentProgram.getMemory().getBlocks()) {
                    if (!block.isInitialized() || block.isExecute() || block.getSize() > 64 * 1024 * 1024) continue;
                    byte[] bytes = new byte[(int) block.getSize()];
                    block.getBytes(block.getStart(), bytes);
                    for (int p = 0; p + 4 <= bytes.length; p++) {
                        long candidate = (bytes[p] & 0xffL) | ((bytes[p + 1] & 0xffL) << 8)
                                | ((bytes[p + 2] & 0xffL) << 16) | ((bytes[p + 3] & 0xffL) << 24);
                        if (candidate != value) continue;
                        Address at = block.getStart().add(p);
                        pw.println("- " + at + " (" + block.getName() + ")");
                        for (int slot = -4; slot <= 8; slot++) {
                            Address entry = at.add(slot * 4L);
                            if (!block.contains(entry)) continue;
                            int raw = currentProgram.getMemory().getInt(entry);
                            Function f = currentProgram.getFunctionManager().getFunctionAt(
                                    toAddr(raw & 0xffffffffL));
                            pw.println(String.format("  %+3d %s: 0x%08x %s", slot, entry,
                                    raw & 0xffffffffL, f == null ? "" : f.getName()));
                        }
                        hits++;
                        if (hits >= 40) break;
                    }
                    if (hits >= 40) break;
                }
                pw.println("命中: " + hits + "\n");
            }
        }
        println("WROTE " + out.getAbsolutePath());
    }
}
