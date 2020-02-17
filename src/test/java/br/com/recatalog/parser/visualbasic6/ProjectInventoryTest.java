package br.com.recatalog.parser.visualbasic6;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;

import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.util.PropertyList;

public class ProjectInventoryTest {
	
	File file = null;
	String filePath = null;
	PropertyList properties;
	ParseTree tree;
	
	@BeforeEach
	public void init() {
		 filePath = "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1PAB0.VBP";
		
		 file = new File(filePath);
		 properties = new PropertyList();
		 properties.addProperty("FILE_PATH", filePath);
		 new VB6ParserProject(properties);	
	     tree = (ParseTree)properties.getProperty("ASTREE");
	}
	
	@Test
	public void test() {
	     VB6InventoryProject vb6InventoryProject = new VB6InventoryProject();
	     ParseTreeWalker walker = new ParseTreeWalker();
	     walker.walk(vb6InventoryProject, tree);        // walk parse tree 
	     System.err.println(vb6InventoryProject.getInventory().getInventory());
	     boolean a = true;
	     assertTrue(a);
	}
}