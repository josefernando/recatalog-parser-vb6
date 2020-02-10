package br.com.recatalog.parser.visualbasic6;

import java.io.File;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ParserRegexVB6Test {
	File file = null;
	
	@BeforeEach
	public void init() {
		 file = new File("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
	}
	
	@Test
	public void testParseRegex() {
 	     ParserRegexVisualBasic6 parseRegex = new ParserRegexVisualBasic6(file);
         parseRegex.getInventory().print();
	}
}