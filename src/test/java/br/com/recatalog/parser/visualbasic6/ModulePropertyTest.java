package br.com.recatalog.parser.visualbasic6;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.*;


public class ModulePropertyTest {
	
	@Test
	public void testHasModuleName() {
	ModuleProperty module = new ModuleProperty("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");

	String expected = "R1CAB016";
	String actual = module.getName();
	
	assertEquals(expected, actual, "OK OK");
	
	 Boolean bexpected = true;
	 Boolean bactual = module.isClassModule();
	
	assertEquals(bexpected, bactual, "OK OK");	
	
	//	System.err.println("Name: " + module.getName());
//	System.err.println("isClass: " + module.isClassModule());
	}
}