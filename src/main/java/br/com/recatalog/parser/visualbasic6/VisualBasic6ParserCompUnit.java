package br.com.recatalog.parser.visualbasic6;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.file.Files;
import java.nio.file.Path;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import br.com.recatalog.core.VerboseListener;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.PropertyList;

public class VisualBasic6ParserCompUnit {
	PropertyList properties;

	public String getFilePath(){
		return (String)properties.getProperty("FILE_PATH");
	}

	public ParseTree getAstree(){
		return (ParseTree)properties.getProperty("ASTREE");
	}	

	public int getNumErrors(){
		return (Integer)properties.getProperty("NUM_SYNTAX_ERRORS");
	}

	public Double getElapsedTime(){
		return (Double)properties.getProperty("ELAPSED_TIME");
	}

	public PropertyList getProperties(){
		return properties;
	}
	
	public VisualBasic6ParserCompUnit(PropertyList properties) {
		this.properties = properties;
		run();
	}
	
	public void run() {
		String filePath = (String) properties.mustProperty("FILE_PATH");
		ModuleProperty moduleProperties = new ModuleProperty(filePath);
		BicamSystem.printLog("INFO", String.format("Parsing module: %s, file: %s", moduleProperties.getName(), filePath));

		InputStream is = null;
		try {
			is = BicamSystem.toInputStreamUTF8(filePath);
		} catch (IOException e3) {
			e3.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			e3.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}
		
		CharStream cs = null;
		try {
			cs = CharStreams.fromStream(is);
		} catch (IOException e1) {
			e1.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			e1.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}

		VisualBasic6CompUnitLexer lexer = new VisualBasic6CompUnitLexer(cs);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		VisualBasic6CompUnitParser parser = new VisualBasic6CompUnitParser(tokens);

		parser.removeErrorListeners();
		parser.addErrorListener(new VerboseListener());

		Path pathFile = null;
		File tempFile = null;
//		PrintStream err = null;

		try {
			pathFile = Files.createTempFile("tempfile", ".tmp");
			tempFile = pathFile.toFile();
//			err = new PrintStream(tempFile);

//			System.setErr(err);
		} catch (Exception e) {
//			System.setErr(err);
			e.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			e.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}

//		parser.getInterpreter().setPredictionMode(PredictionMode.SLL);
		try {
			ParseTree astree = parser.startRule();
			
			properties.addProperty("ASTREE", astree);
			BufferedReader in = new BufferedReader(new FileReader(tempFile));
			String line = in.readLine();
			while(line != null)
			{
			  System.out.println(line);
			  line = in.readLine();
			}
			in.close();

		} catch (Exception ex) {
			ex.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			ex.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}

		int numSyntaxErrors = parser.getNumberOfSyntaxErrors();
		
		properties.addProperty("NUM_SYNTAX_ERRORS",numSyntaxErrors);

		if (parser.getNumberOfSyntaxErrors() > 0) {
			try {
				throw new Exception();
			} catch (Exception e) {
				e.printStackTrace();

				StringWriter exceptionStackError = new StringWriter();
				e.printStackTrace(new PrintWriter(exceptionStackError));
				properties.addProperty("EXCEPTION", exceptionStackError.toString());
				StringBuilder sb = new StringBuilder();

				try {
					FileInputStream fis = new FileInputStream(tempFile);
					byte[] buffer = new byte[10];
					while (fis.read(buffer) != -1) {
						sb.append(new String(buffer));
						buffer = new byte[10];
					}
					fis.close();
					properties.addProperty("EXCEPTION",
							sb.toString() + System.lineSeparator() + exceptionStackError.toString());
				} catch (Exception e2) {
					e2.printStackTrace();
					StringWriter exceptionStackError2 = new StringWriter();
					e2.printStackTrace(new PrintWriter(exceptionStackError2));
					properties.addProperty("EXCEPTION", exceptionStackError2.toString());
					return ;
				}
			}
		}
		
		properties.addProperty("ELAPSED_TIME", parser.getTotalElapsedTime());

		StringBuilder sb = new StringBuilder();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(tempFile);

		byte[] buffer = new byte[10];
		while (fis.read(buffer) != -1) {
			sb.append(new String(buffer));
			buffer = new byte[10];
		}
		fis.close();
		System.err.println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	public static void main(String args[]) {
//    	Language language = new LanguageVb6();
//    	SymbolTableBuilder st = new SymbolTableBuilder(language);
//    	System.err.println("----- Printing toString()");
//    	System.err.println(st.getBuiltinScope().toString());
//    	System.err.println(st.getGlobalScope().toString());
//    	
//		List<String> files = new ArrayList<String>() {{
//			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
//		}};
//		
//		st.parsing(files);
//		st.defSymbol();
////		System.err.println(st.getGlobalScope().toString());
////		st.refTypeSymbol();
////		st.refSymbol();		
//	}
	
	/*
	public static void main(String args[]) {
		File f = null;
		try {
			f = BicamSystem.toFileUTF8("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		System.err.println(f.getAbsolutePath());
		
//		URI uri = f.toURI();
//		URL url = null;
//		try {
//			url = uri.toURL();
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		}

		PropertyList props = new PropertyList();
//		props.addProperty("URL", url);
		props.addProperty("FILE_PATH", f.getAbsolutePath());
		
		
		VisualBasic6ParserCompUnit parseVb6CompUnit = new VisualBasic6ParserCompUnit(props);
        
        if(parseVb6CompUnit.getNumErrors() > 0 ) {
        	System.err.println(String.format("PARSING FAILED  with %d ERRORS", parseVb6CompUnit.getNumErrors()) );
        	System.err.println(parseVb6CompUnit.getProperties().mustProperty("EXCEPTION"));
        }
       	else {
        	System.err.println(String.format("SUCCESSFULLY PARSING  in %f seconds", parseVb6CompUnit.getElapsedTime()));
       	}
        
		ParseTree tree = (ParseTree) parseVb6CompUnit.getProperties().mustProperty("ASTREE");
        ParseTreeWalker walker = new ParseTreeWalker();
        
        VisualBasic6InventoryCompUnit visualBasic6InventoryCompUnit = new VisualBasic6InventoryCompUnit();
        walker.walk(visualBasic6InventoryCompUnit, tree);        // walk parse tree 
        
        if(visualBasic6InventoryCompUnit.getException() != null) {
        	System.err.println(visualBasic6InventoryCompUnit.getException());
        }
	}
	*/
}