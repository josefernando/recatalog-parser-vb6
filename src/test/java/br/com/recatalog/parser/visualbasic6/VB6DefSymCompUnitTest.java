package br.com.recatalog.parser.visualbasic6;

import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.core.visualbasic6.LanguageVb6;
import br.com.recatalog.util.PropertyList;

public class VB6DefSymCompUnitTest {
	
	PropertyList properties;
	String filePath;
	ParseTree tree;
	SymbolTableBuilder st;
	
	@BeforeEach
	public void init() {
		filePath = "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS";
		
		properties = new PropertyList();
		properties.addProperty("FILE_PATH", filePath);

		VisualBasic6ParserCompUnit parseVb6CompUnit = new VisualBasic6ParserCompUnit(properties);
		
		st = new SymbolTableBuilder(new LanguageVb6());
		properties.addProperty("SYMBOL_TABLE", st);
		
		tree = parseVb6CompUnit.getAstree();

 		ModuleProperty module = new ModuleProperty(filePath);
		String moduleName = module.getName();
		st.getDictionary().put(moduleName, new PropertyList());
		
		PropertyList propModule;
		propModule = st.getDictionary().get(moduleName);
		propModule.addProperty("ASTREE", tree);
		propModule.addProperty("FILE_PATH", filePath);
		propModule.addProperty("OPTION_EXPLICIT", module.isOptionExplicit());
		if(module.isClassModule()) {
			propModule.addProperty("IS_CLASS", true);
		}
	}
	
	@Test
	public void test() {
		System.out.println(properties.toString());
		VisualBasic6DefSymCompUnit defVisualBasic6CompUnit = new VisualBasic6DefSymCompUnit(properties);
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(defVisualBasic6CompUnit, tree);        // walk parse tree 
        System.err.println(st.getGlobalScope().toString());
	}
}