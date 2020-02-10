package br.com.recatalog.parser.visualbasic6;

import java.io.File;

import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.util.PropertyList;

public class InventoryTest {
	
	File file = null;
	String filePath = null;
	PropertyList properties;
	ParseTree tree;
	
	@BeforeEach
	public void init() {
		 filePath = "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS";
		
		 file = new File(filePath);
		 properties = new PropertyList();
		 properties.addProperty("FILE_PATH", filePath);
		 new VisualBasic6ParserCompUnit(properties);	
	     tree = (ParseTree)properties.getProperty("ASTREE");
	}
	
	@Test
	public void test() {
	     ParserRegexVisualBasic6 parseRegex = new ParserRegexVisualBasic6(file);
	     
	     VB6InventoryCompUnit vb6InventoryCompUnit = new VB6InventoryCompUnit();
	     ParseTreeWalker walker = new ParseTreeWalker();
	     walker.walk(vb6InventoryCompUnit, tree);        // walk parse tree 

	  	 boolean unitTest = vb6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory()); 
//	  	 System.err.println(String.format("Unit Test: %s%n", unitTest == true ? "Succeeded" : "Failed"));		
	  	 if(!unitTest) {
	  		 String msg = System.lineSeparator()+ vb6InventoryCompUnit.getInventory().getInventory().toString();
	  		 msg = msg + System.lineSeparator()+ parseRegex.getInventory().getInventory().toString();
	  	   }		
	}
}