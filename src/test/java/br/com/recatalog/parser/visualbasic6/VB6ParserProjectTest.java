package br.com.recatalog.parser.visualbasic6;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.util.PropertyList;

public class VB6ParserProjectTest {

	PropertyList properties;
	
	@BeforeEach
	public void init() {
		properties = new PropertyList();
		properties.addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1PAB0.VBP");
	}
	
	@Test
	public void testCompUnit() {
		VB6ParserProject parser = new VB6ParserProject(properties);
		assertTrue(parser.getNumErrors() == 0);
	}
}