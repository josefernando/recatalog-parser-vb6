package br.com.recatalog.parser.visualbasic6;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import br.com.recatalog.core.Language;
import br.com.recatalog.core.visualbasic6.LanguageVb6;

public class SymbolTableBuilderTest {
	
	List<String> files;
	Language language; 
	SymbolTableBuilder st; 
	
	@BeforeEach
	public void init() {
    	language = new LanguageVb6();
    	st = new SymbolTableBuilder(language);

    	files = new ArrayList<String>() {{
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB002.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB003.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB004.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB005.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB006.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB007.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB008.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB009.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB010.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB011.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB012.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB013.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB014.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB015.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB016.FRM");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GECOEX01.CLS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GECOMS01.CLS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMGVK01.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOAJU1.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOAMB1.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOCOR1.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOEX01.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOMB01.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOSY01.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOTXT1.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOVR01.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMVBAPI.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\PEGFNZ01.CLS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\RXGCMG01.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\WNGWN005.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB001.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB002.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB003.BAS");
		add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB004.BAS");
		}};
	}
	
	@Test
	public void testParsing() {
		st.parsing(files);
		st.defSymbol();
		st.refTypeSymbol();
		assertTrue(!st.hasUnResolvedSymbol());
		st.refSymbol();
		assertTrue(!st.hasUnResolvedSymbol());
	}
}