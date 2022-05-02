import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

public class RomLoader {
    public static final String START_ID = "// start program";
    public static final String END_ID = "// end program";
    public static final String REG_NAME = "reg_wb_rom_";
    public static void main(String[] args) throws IOException {
	    String pathC = args[0], pathBin = args[1];
	    int lineNum = 1, addr = 0x0;
        List<String> lines = Files.readAllLines(Paths.get(pathC), StandardCharsets.UTF_8);
        while(!lines.get(lineNum).toLowerCase().contains(START_ID)) { // Locate where to write the program
            checkEOF(lines, ++lineNum, START_ID);
        }
        lineNum++;
        while(!lines.get(lineNum).toLowerCase().contains(END_ID)) { // Remove old program
            lines.remove(lineNum);
            checkEOF(lines, lineNum, END_ID);
        }
        byte[] data = Files.readAllBytes(Paths.get(pathBin)); // Load binary to store in rom
        int instrCnt = data.length/4;
        for(int i = 0; i <= instrCnt + 4; i++) {
            if(i != 0 && (i % 2 == 0)){addr++;}
            int instr = 0x0; // To prevent XXX's we initialize a little more of the boot memory than needed
            if(i < instrCnt){
                instr = (0x000000FF & data[4 * i + 3]) | ((0x000000FF & data[4 * i + 2]) << 8) | ((0x000000FF & data[4 * i + 1]) << 16) | ((0x000000FF & data[4 * i]) << 24);
            }
            writeCmd(lines, lineNum++,"data" + (i % 2 == 0 ? "Even" : "Odd"), instr);
            writeCmd(lines, lineNum++,"addr" + (i % 2 == 0 ? "Even" : "Odd"), addr);
            writeCmd(lines, lineNum++,"en" + (i % 2 == 0 ? "Even" : "Odd"), 0x1);
            writeCmd(lines, lineNum++,"en" + (i % 2 == 0 ? "Even" : "Odd"), 0x0);
        }
        Files.write(Paths.get(pathC), lines, StandardCharsets.UTF_8);
    }
    public static void checkEOF(List<String> lines, int lineNum, String key){
        if(lineNum == lines.size()) {
            System.out.println("\nWARNING: Couldn't find line starting with \"" + key +  "\"\n Perhaps this is intentional?");
            System.exit(0); // Just exit if you don't indicate where to write wishbone commands. 
        }
    }
    public static void writeCmd(List<String> lines, int lineNum, String reg, int val){
        lines.add(lineNum,"    " + REG_NAME + reg + " = 0x" + Integer.toHexString(val) + ";");
    }
}
