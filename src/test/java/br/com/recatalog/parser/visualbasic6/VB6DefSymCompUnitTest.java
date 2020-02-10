package br.com.recatalog.parser.visualbasic6;

import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.core.visualbasic6.LanguageVb6;
import br.com.recatalog.util.PropertyList;

public class VB6DefSymCompUnitTest {
	
	PropertyList props;
	
	@BeforeEach
	public void init() {
		props = new PropertyList();
		props.addProperty("FILE_PATH", "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
        System.err.println("Parsing: " + "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
		VisualBasic6ParserCompUnit parseVb6CompUnit = new VisualBasic6ParserCompUnit(props);
		
		SymbolTableBuilder st = new SymbolTableBuilder(new LanguageVb6());
		PropertyList defProp = new PropertyList();
		defProp.addProperty("FILE_PATH", parseVb6CompUnit.getFilePath());
		defProp.addProperty("SYMBOL_TABLE", st);
		defProp.addProperty("ASTREE", parseVb6CompUnit.getAstree());

		VisualBasic6DefSymCompUnit defVisualBasic6CompUnit = new VisualBasic6DefSymCompUnit(defProp);
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(defVisualBasic6CompUnit, parseVb6CompUnit.getAstree());        // walk parse tree 
        System.err.println(st.getGlobalScope().toString());			
	}
	
	@Test
	public void test() {
		
	}
}