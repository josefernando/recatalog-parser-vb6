package br.com.recatalog.parser.visualbasic6;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.util.PropertyList;

public class VB6ParserCompUnitTest {

	PropertyList properties;
	
	@BeforeEach
	public void init() {
		properties = new PropertyList();
		properties.addProperty("FILE_PATH", "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
	}
	
	@Test
	public void testCompUnit() {
		VisualBasic6ParserCompUnit parser = new VisualBasic6ParserCompUnit(properties);
		assertTrue(parser.getNumErrors() == 0);
	}
}