package br.com.recatalog.parser.visualbasic6;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.util.PropertyList;

public class VB6InventoryCompUnitTest {
	
	PropertyList properties;
	
	@BeforeEach
	public void init() {
		properties = new PropertyList();
		properties.addProperty("FILE_PATH", "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
		new VisualBasic6ParserCompUnit(properties);
	}
	
	@Test
	public void test() {
        VB6InventoryCompUnit visualBasic6InventoryCompUnit = new VB6InventoryCompUnit();
        ParseTreeWalker walker = new ParseTreeWalker();
        ParseTree tree = (ParseTree)properties.getProperty("ASTREE");
        walker.walk(visualBasic6InventoryCompUnit, tree);        // walk parse tree 
        assertTrue(visualBasic6InventoryCompUnit.getException().length() == 0);
        System.out.println(visualBasic6InventoryCompUnit.getInventory().getInventory().toString());
	}
}