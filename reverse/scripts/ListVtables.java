import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionManager;
import ghidra.program.model.symbol.Symbol;
import ghidra.program.model.symbol.SymbolType;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * ListVtables: 枚举符号表中疑似虚表/RTTI 的符号，导出前 N 槽的函数名。
 * 用法: -postScript ListVtables.java 输出.md 名字过滤子串 槽数
 */
public class ListVtables extends GhidraScript {

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        File outFile = new File(args[0]);
        String kw = args.length > 1 ? args[1] : "";
        int slots = args.length > 2 ? Integer.parseInt(args[2]) : 8;

        FunctionManager fm = currentProgram.getFunctionManager();
        try (PrintWriter pw = new PrintWriter(outFile, "UTF-8")) {
            pw.println("# 虚表符号枚举（过滤: " + kw + "）\n");
            int n = 0;
            for (Symbol s : currentProgram.getSymbolTable().getAllSymbols(true)) {
                if (s.getSymbolType() != SymbolType.LABEL && s.getSymbolType() != SymbolType.CLASS) continue;
                String name = s.getName();
                if (!kw.isEmpty() && !name.contains(kw)) continue;
                if (!name.contains("vftable") && !name.contains("VFTABLE")
                        && !name.contains("vbtable") && !name.contains("RTTI")) continue;
                long addr = s.getAddress().getOffset();
                pw.println("## " + name + " @ " + String.format("0x%08x", addr));
                for (int i = 0; i < slots; i++) {
                    int fp = currentProgram.getMemory().getInt(s.getAddress().add(i * 4));
                    Function f = fm.getFunctionAt(s.getAddress().add(i * 4).getNewAddress(fp & 0xFFFFFFFFL));
                    pw.println(String.format("- [%d] +0x%x -> 0x%08x%s", i, i * 4, fp & 0xFFFFFFFFL,
                            f != null ? "  " + f.getName() : ""));
                }
                pw.println();
                if (++n >= 60) break;
            }
            pw.println("共 " + n + " 个符号");
        }
        println("WROTE " + outFile.getAbsolutePath());
    }
}
