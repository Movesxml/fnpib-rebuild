import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.mem.Memory;
import java.io.File;
import java.io.PrintWriter;

/**
 * DumpData: 读取数据段常量并输出换算值。
 * 用法: -postScript DumpData.java 输出.md <条目> [条目...]
 * 条目格式:
 *   0xADDR:f32|i32|u32     直接读取（冒号分隔，勿用逗号——Ghidra 会切分逗号）
 *   ptr:0xADDR:0xOFF:f32|i32|u32   先读 ADDR 处的指针，再读 ptr+OFF
 *   bytes:0xADDR:0xLEN     按字节 hex dump
 *   ptrbytes:0xADDR:0xOFF:0xLEN  读 ADDR 处指针，dump ptr+OFF 起 LEN 字节
 *   findf:0xPATTERN        在非执行块中反查 4 字节 LE 值（如 float 位模式），报前 20 个地址
 */
public class DumpData extends GhidraScript {

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File outFile = new File(args[0]);
        Memory mem = currentProgram.getMemory();
        // 注意：不使用 imageBase——PE 项目 imageBase=0x400000 但列表空间从 0 开始，
        // 函数/符号地址(如 FUN_00bda510 / _DAT_016f2018)就是列表空间绝对地址
        long base = 0;

        try (PrintWriter pw = new PrintWriter(outFile, "UTF-8")) {
            pw.println("# 数据段常量读取\n");
            pw.println("- 程序: " + currentProgram.getName() + "\n");
            for (int i = 1; i < args.length; i++) {
                String[] tok = args[i].split(":");
                try {
                    if (tok[0].equals("findf") && tok.length >= 2) {
                        long pat = Long.parseLong(tok[1].replace("0x", ""), 16) & 0xFFFFFFFFL;
                        pw.println("- `findf " + tok[1] + "` (4字节LE):");
                        int found = 0;
                        for (var blk : mem.getBlocks()) {
                            if (!blk.isInitialized() || blk.isExecute()) continue;
                            if (blk.getSize() <= 0 || blk.getSize() > 64 * 1024 * 1024) continue;
                            byte[] b = new byte[(int) blk.getSize()];
                            blk.getBytes(blk.getStart(), b);
                            for (int x = 0; x + 4 <= b.length && found < 20; x++) {
                                long v = (b[x] & 0xffL) | ((b[x+1] & 0xffL) << 8)
                                       | ((b[x+2] & 0xffL) << 16) | ((b[x+3] & 0xffL) << 24);
                                if (v == pat) {
                                    pw.println("  - " + blk.getStart().add(x));
                                    found++;
                                }
                            }
                        }
                        if (found == 0) pw.println("  - (未找到)");
                        pw.println();
                    } else if (tok[0].equals("ptrbytes") && tok.length >= 4) {
                        long a = Long.parseLong(tok[1].replace("0x", ""), 16);
                        long off = Long.parseLong(tok[2].replace("0x", ""), 16);
                        int len = Integer.parseInt(tok[3].replace("0x", ""), 16);
                        int p = mem.getInt(toAddr(base + a));
                        byte[] b = new byte[len];
                        mem.getBytes(toAddr((p & 0xFFFFFFFFL) + off), b);
                        StringBuilder sb = new StringBuilder();
                        for (int x = 0; x < len; x++) {
                            sb.append(String.format("%02x ", b[x] & 0xff));
                            if (x % 16 == 15) sb.append("\n    ");
                        }
                        pw.println("- `ptr[" + tok[1] + "]="+ String.format("0x%08x", p & 0xFFFFFFFFL)
                                + " + " + tok[2] + "` +" + len + "B:\n    " + sb.toString().trim() + "\n");
                    } else if (tok[0].equals("bytes") && tok.length >= 3) {
                        long a = Long.parseLong(tok[1].replace("0x", ""), 16);
                        int len = Integer.parseInt(tok[2].replace("0x", ""), 16);
                        byte[] b = new byte[len];
                        mem.getBytes(toAddr(base + a), b);
                        StringBuilder sb = new StringBuilder();
                        for (byte x : b) sb.append(String.format("%02x ", x & 0xff));
                        pw.println("- `" + tok[1] + "` +" + len + "B: " + sb.toString().trim() + "\n");
                    } else if (tok[0].equals("ptr") && tok.length >= 4) {
                        long a = Long.parseLong(tok[1].replace("0x", ""), 16);
                        long off = Long.parseLong(tok[2].replace("0x", ""), 16);
                        int p = mem.getInt(toAddr(base + a));
                        String v = fmt(mem, (p & 0xFFFFFFFFL) + off, tok[3]);
                        pw.println("- `ptr[" + tok[1] + "]="+ String.format("0x%08x", p & 0xFFFFFFFFL)
                                + " + " + tok[2] + "` (" + tok[3] + "): " + v + "\n");
                    } else {
                        long a = Long.parseLong(tok[0].replace("0x", ""), 16);
                        pw.println("- `" + tok[0] + "` (" + tok[1] + "): " + fmt(mem, a, tok[1]) + "\n");
                    }
                } catch (Exception e) {
                    pw.println("- `" + args[i] + "`: 读取失败 " + e.getMessage() + "\n");
                }
            }
        }
        println("WROTE " + outFile.getAbsolutePath());
    }

    private String fmt(Memory mem, long addr, String type) throws Exception {
        Address a = toAddr(addr);
        switch (type) {
            case "f32":
                float f = Float.intBitsToFloat(mem.getInt(a));
                return String.format("0x%08x = %s (float %s)", mem.getInt(a) & 0xFFFFFFFFL,
                        Float.toString(f), Float.toString(f));
            case "f64": {
                long bits = mem.getLong(a);
                double d = Double.longBitsToDouble(bits);
                return String.format("0x%016x = %s (double %s)", bits, Double.toString(d), Double.toString(d));
            }
            case "i32":
                return String.format("%d (0x%08x)", mem.getInt(a), mem.getInt(a) & 0xFFFFFFFFL);
            case "u32":
                return String.format("%d (0x%08x)", mem.getInt(a) & 0xFFFFFFFFL, mem.getInt(a) & 0xFFFFFFFFL);
            default:
                return "未知类型 " + type;
        }
    }
}
