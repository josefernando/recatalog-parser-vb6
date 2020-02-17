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

public class VB6ParserProject {
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
	
	public VB6ParserProject(PropertyList properties) {
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

		VisualBasic6ProjectLexer lexer = new VisualBasic6ProjectLexer(cs);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		VisualBasic6ProjectParser parser = new VisualBasic6ProjectParser(tokens);

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
		
//		properties.addProperty("ELAPSED_TIME", parser.getTotalElapsedTime());

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
}