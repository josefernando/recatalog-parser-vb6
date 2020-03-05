package br.com.recatalog.parser.visualbasic6;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.util.List;

import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.core.visualbasic6.LoadProjectCatalogVb6;
import br.com.recatalog.data.CatalogDAO;
import br.com.recatalog.data.CatalogDAOHibernate;
import br.com.recatalog.model.CatalogItem;
import br.com.recatalog.util.PropertyList;

public class ProjectInventoryTest {
	
	File file = null;
	String filePath = null;
	PropertyList properties;
	ParseTree tree;
	
	CatalogDAO catalogDAO;
	
	@BeforeEach
	public void init() {
	 properties = new PropertyList();
		 
     /*  READING FILE FROM RESOURCE 	 
     ClassLoader classLoader = getClass().getClassLoader();
     File file = new File(classLoader.getResource("R1PAB0.VBP").getFile());
	 properties.addProperty("FILE_PATH", file.getAbsolutePath());
	 ==============================================*/
		 
		 filePath = "src/test/resources/R1PAB001/R1PAB0.VBP";
		 properties.addProperty("FILE_PATH", filePath);
		 
		 new VB6ParserProject(properties);	
	     tree = (ParseTree)properties.getProperty("ASTREE");
	     
			properties = new PropertyList();
			catalogDAO = new CatalogDAOHibernate();
	}
	
	@Test
	public void test() {
	     VB6InventoryProject vb6InventoryProject = new VB6InventoryProject();
	     ParseTreeWalker walker = new ParseTreeWalker();
	     walker.walk(vb6InventoryProject, tree);        // walk parse tree 
	     System.out.println(vb6InventoryProject.getInventory().getInventory());
	     boolean a = true;
	     assertTrue(a);
	}
	
	@Test
	public void testLoadProject() {
	     VB6InventoryProject vb6InventoryProject = new VB6InventoryProject();
	     ParseTreeWalker walker = new ParseTreeWalker();
	     walker.walk(vb6InventoryProject, tree);        // walk parse tree 
	     
	     System.out.println(vb6InventoryProject.getInventory().getInventory());
	     
	     LoadProjectCatalogVb6 loadProject = new LoadProjectCatalogVb6(vb6InventoryProject.getInventory().getInventory());
	     
//	     loadProject.load();
	     
	     System.out.println("name: " + loadProject.getProjet().getName());
	     
//==========================================================================
			CatalogItem ci = new CatalogItem();
			ci.setId("FINANCEIRO");

			CatalogItem catalog  = loadProject.getProjet();
			catalog.setParent(ci);

			properties.clear();
			properties.addProperty("ENTITY", catalog);
			catalogDAO.addCatalogItem(properties);
			
			List<CatalogItem> itens = loadProject.getItens();
			System.out.println("# ITENS: " + itens.size());
			for(CatalogItem cat : itens) {
				properties.clear();
				properties.addProperty("ENTITY", cat);
				catalogDAO.addCatalogItem(properties);				
			}
//==========================================================================	     
	     
	     boolean a = true;
	     assertTrue(a);
	}
}