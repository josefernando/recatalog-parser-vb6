package br.com.recatalog.parser.visualbasic6;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Path;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.ParserInventory;

public class ParserRegexVisualBasic6 {
	ParserInventory inventory;
	Path path;                                // file name     
	URL url;
    URLConnection urlConnection;
	Map<Integer,String> namedGroups; 
	
	Set<String> commands;

	
	boolean insideMethod;
	boolean insideType;
	boolean insideEnum;
	String formalParameters;

	int insideBeginBlock;
	
	BufferedReaderforRegex br;
    
	Map<String,List<String>> elementsRegex;    // DEFVAR, DEFMETHDOC, STMT, etc...
	
	
	/**Exemplos: Attribute objEvento.VB_VarHelpID = -1
		         Attribute VB_VarHelpID = -1
	*/

	final String ATTRIBUTE_REGEX = "(?:(?i)^ATTRIBUTE\\s*(?<attribute>\\S+)\\s*=\\s*[^$]+)";
	final String   ATTRIBUTE = "ATTRIBUTE";
	
	final String FORM_REGEX = "(?:(?i)(?:^\\s*BEGIN\\s*VB\\.FORM\\s*(?<formName>\\w+)\\s*$))";
	final String   FORM = "FORM";
	
	
	// (?:.(?!\\s*$))* => qualquer caracter nÃ£o seguido de espaÃ§o e final de linha"\s*$" 
    // Syntax: Procedure "Sub" nÃ£o retorna valor
	final String DEFMETHOD_SUB_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*PUBLIC\\s*|\\s*GLOBAL\\s*|\\s*STATIC\\s*)*\\s*SUB\\s*(?<subName>\\w+)\\s*\\((?<formalParameters>(?:.(?!\\s*$))*)\\)\\s*$)";
	final String DEFMETHOD_SUB = "DEFMETHOD_SUB";
	
	final String DEFMETHOD_FUNCTION_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*FRIEND\\s*|\\s*PUBLIC\\s*|\\s*GLOBAL\\s*|\\s*STATIC\\s*)*\\s*FUNCTION\\s*(?<functionName>\\w+)\\s*\\((?<formalParameters>(?:.(?!\\s*$))*)\\)\\s*(?:AS\\s*(?<returnType>[\\w+.]+))*)";
	final String DEFMETHOD_FUNCTION = "DEFMETHOD_FUNCTION";
	
	final String   DEFMETHOD_PROPERTY_GET_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*FRIEND\\s*|\\s*PUBLIC\\s*|\\s*GLOBAL\\s*|\\s*STATIC\\\\s*)*\\s*PROPERTY\\s*GET\\s*(?<propertyName>\\w+)\\s*\\((?<formalParameters>(?:.(?!\\s*$))*)\\)\\s*(?:AS\\s*(?<returnType>\\w+))?)";
	final String   DEFMETHOD_PROPERTY_GET = "DEFMETHOD_PROPERTY_GET";
	
	final String   DEFMETHOD_PROPERTY_LET_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*FRIEND\\s*|\\s*PUBLIC\\s*|\\s*GLOBAL\\s*|\\s*STATIC\\s*)*\\s*PROPERTY\\s*LET\\s*(?<propertyName>\\w+)\\s*\\((?<formalParameters>(?:.(?!\\s*$))*)\\)\\s*$)";
	final String   DEFMETHOD_PROPERTY_LET = "DEFMETHOD_PROPERTY_LET";	
	
	final String   DEFMETHOD_PROPERTY_SET_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*FRIEND\\s*|\\s*PUBLIC\\s*|\\s*GLOBAL\\s*|\\s*STATIC\\s*)*\\s*PROPERTY\\s*SET\\s*(?<propertyName>\\w+)\\s*\\((?<formalParameters>(?:.(?!\\s*$))*)\\)\\s*$)";
	final String   DEFMETHOD_PROPERTY_SET = "DEFMETHOD_PROPERTY_SET";
	
	final String   RUNTIME_DEPENDENCY_OBJECT_REGEX = "((?i)^\\s*OBJECT[^;]+;\\s*\"(?<name>[^\"]+)\")";
	final String   RUNTIME_DEPENDENCY_OBJECT = "RUNTIME_DEPENDENCY_OBJECT";
	
	final String END_OF_METHOD_REGEX = "((?i)^\\s*\\bEND\\b\\s*(?<methodType>\\s*SUB\\s*|\\s*FUNCTION\\s*|\\s*PROPERTY\\s*))";
	final String END_OF_METHOD = "END_OF_METHOD";
	
	final String   DEFCONST_DECLARATION_SECTION_REGEX = "(?:(?i)(?:\\s*\\bGLOBAL\\b\\s*|\\s*\\bPUBLIC\\b\\s*|\\s*\\bPRIVATE\\b\\s*|\\s*\\bDIM\\b\\s*)*\\s*\\bCONST\\b\\s*(?<constName>[a-zA-Z]\\w*)(?:(?:\\!|\\@\\#|$|\\%|\\&)|(?:\\s*\\bAS\\b\\s*\\w+\\s*))?\\s*=\\s*.*?$)";
	
//	final String   DEFVAR_DECLARATION_SECTION_REGEX = "(?:(?i)^(?:\\s*\\bGLOBAL\\b\\s*|\\s*\\bPUBLIC\\b\\s*|\\s*\\bPRIVATE\\b\\s*|\\s*\\bDIM\\b\\s*)*\\s*(?:\\bWITHEVENTS\\b)*\\s*(?<varName>[a-zA-Z]\\w*)\\s*(?<array>\\((?<formalParameters>(?:.(?!\\s*$))*)\\))*\\s*((?:\\!|\\@|\\#|\\$|\\%|\\&)\\s*|(?:\\bAS\\b\\s*\\b\\w+\\b\\s*)|(\\s*?$)))";
//	final String   DEFVAR_DECLARATION_SECTION_NEXT_REGEX = "(?:(?i),(?:\\s*\\bGLOBAL\\b\\s*|\\s*\\bPUBLIC\\b\\s*|\\s*\\bPRIVATE\\b\\s*|\\s*\\bDIM\\b\\s*)*\\s*(?:\\bWITHEVENTS\\b)*\\s*(?<varName>[a-zA-Z]\\w*)\\s*(?<array>\\((?<formalParameters>(?:.(?!\\s*$))*)\\))*\\s*((?:\\!|\\@|\\#|\\$|\\%|\\&)\\s*|(?:\\bAS\\b\\s*\\b\\w+\\b\\s*)|(\\s*?$)))";
	final String   DEFVAR_DECLARATION_SECTION2_REGEX = "((?i)^(?<modifier>\\s*\\bdim\\b\\s*|\\s*\\bprivate\\b\\s*|\\s*\\bpublic\\b\\s*|\\s*\\bglobal\\b\\s*|\\s*\\bstatic\\b\\s*)+\\s*(\\bWithEvents\\b)?\\s*(?<name>[a-zA-Z]\\w*)(?<typeIndicator>[!@#$%&])?\\s*(?<arrayDef>\\([^)]*\\))?\\s*(?<type>\\bAS\\b\\s*(NEW)?\\s*[\\S.]*)?\\s*(?<length>\\*\\s*\\w+)?\\s*(?<initValue>=\\s*[\\S]+)?\\s*(?<next>,[^\r\n]*?)?$)";	
	final String   DEFVAR_NEXT_REGEX = "((?i),\\s*(?<name>[a-zA-Z]\\w*)(?<typeIndicator>[!@#$%&])?\\s*(?<arrayDef>\\((.(?![)]))*\\))?\\s*(?<type>AS\\s*[\\S]*)?\\s*(?<length>\\*\\s*\\w+)?\\s*(?<initValue>=\\s*[\\S]+)?\\s*(?<next>,[^$]*?)?$)";	
	
	final String   DEFVAR_INSIDE_METHOD_REGEX = "(?:(?i)^\\s*(?:\\s*DIM\\s*|\\s*PRIVATE\\s*|\\s*STATIC\\s*|\\s*CONST\\s*)\\s*(?<name>\\w+)(?<array>\\((?<formalParameters>(?:.(?!\\s*$))*)\\))*)";
	final String   DEFVAR_INSIDE_METHOD_NEXT_REGEX = "(?:(?i),\\s*(?:\\s*DIM\\s*|\\s*PRIVATE\\s*|\\s*STATIC\\s*)*\\s*(?<name>[a-zA-Z]\\w*))";

	final String   DEFVAR_INSIDE_METHOD = "DEFVAR_INSIDE_METHOD";
	final String   DEFVAR = "DEFVAR";
	
	final String TYPE_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*GLOBAL\\s*|\\s*PUBLIC\\s*)*\\s*TYPE\\s*(?<name>[a-zA-Z]\\w*)\\s*$)";
	final String TYPE = "TYPE";
	
	final String END_OF_TYPE_REGEX = "((?i)^\\s*END\\s*(?<type>\\s*TYPE\\s*))";
	final String END_OF_TYPE = "END_OF_TYPE";
	
	final String TYPE_FIELD_REGEX = "(?:(?i)\\s*(?<name>\\w+)\\s*(?<array>\\((?<formalParameters>(?:.(?!\\s*$))*)\\))*\\s*AS\\s*\\w+\\s*(?:[*]\\s*\\w+)?\\s*$)";
	final String TYPE_FIELD = "TYPE_FIELD";
	
	final String ENUM_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*GLOBAL\\s*|\\s*PUBLIC\\s*)*\\s*ENUM\\s*(?<name>\\w+)\\s*$)";
	final String ENUM = "ENUM";
	
	final String END_OF_ENUM_REGEX = "((?i)^\\s*END\\s*(?<enum>\\s*ENUM\\s*))";
	final String END_OF_ENUM = "END_OF_ENUM";
	
	final String ENUM_VALUE_REGEX = "(?:(?i)^\\s*(?<enumValue>\\w+)\\s*=\\s*\\S+\\s*$)";
	final String ENUM_VALUE = "ENUM_VALUE";
	
	final String DECLARE_REGEX = "(?:(?i)^(?:\\s*PRIVATE\\s*|\\s*PUBLIC\\s*|\\s*GLOBAL\\s*|\\s*STATIC\\s*)*DECLARE(?<declareType>\\s*FUNCTION\\s*|\\s*SUB\\s*)(?<name>\\w*)\\s*(?<lib>(?:LIB\\s*(?<libName>\\S*)))?\\s*(?<alias>ALIAS\\s*(?<aliasName>\\S*))?\\s*(?:\\((?<formalParameters>(?:.*))\\))\\s*(?<returnType>AS\\s*\\w+)?$)";
	final String DECLARE = "DECLARE";
	
//	final String DEFVAR_FORMAL_PARAMETERS_REGEX = "(?:(?i)(?:\\s*\\bBYREF\\b\\s*|\\s*\\bBYVAL\\b\\s*|\\s*\\bOPTIONAL\\b\\s*)*(?<formalParameterName>[a-zA-Z]\\w*)\\s*[^,]+)";
//	final String DEFVAR_FORMAL_PARAMETERS_REGEX = "(?:(?i)(?:\\s*\\bBYREF\\b\\s*|\\s*\\bBYVAL\\b\\s*|\\s*\\bOPTIONAL\\b\\s*)*(?:(?:(?<formalParameterName>[a-zA-Z]\\w*)\\s*AS\\s*[^,]+,?)|(?:(?<formalParameterNameNoType>[a-zA-Z]\\w*),?)))";
	
	final String COMMAND = "COMMAND";
	
	/**(?:(?i)^\s*?EVENT\s*?(?<eventName>\w+)\s*?\((?<parameters>.*(?=\)))\)\s*$)
	 * ----------------------------------------------------------xx-----
	 * utilizei o greedy ".*", para buscar o mÃ¡ximo de caracteres para finalizar com ")"
	 * mais, veja em:
	 * https://mariusschulz.com/blog/why-using-the-greedy-in-regular-expressions-is-almost-never-what-you-actually-want#targetText=The%20Dot%3A%20Matching%20(Almost)%20Arbitrary%20Characters&targetText=Outside%20of%20a%20character%20class,and%20matches%20the%20dot%20character.
	 * */
	
	final String EVENT_REGEX = "(?:(?i)^\\s*?EVENT\\s*?(?<eventName>\\w+)\\s*?\\((?<parameters>.*(?=\\)))\\)\\s*$)";
	final String EVENT = "EVENT";
	
	final String OPTION_REGEX = "(?:(?i)\\s*OPTION\\s*(?<optionClause>(?:EXPLICIT|COMPARE|BASE|PRIVATE)).*$)";
	final String OPTION = "OPTION";
	
//	final String FORMAL_PARAMETERS_REGEX = "(?:(?i)(?:\\s*\\bBYREF\\b\\s*|\\s*\\bBYVAL\\b\\s*|\\s*\\bOPTIONAL\\b\\s*)*(?:(?:(?<formalParameterName>[a-zA-Z]\\w*)\\s*(?:\\(\\))?\\s*\\bAS\\b\\s*[^,]+,?)|(?:(?<formalParameterNameNoType>[a-zA-Z]\\w*)\\s*(?:\\(\\))?,?)))";
	final String FORMAL_PARAMETERS_REGEX = "(?:(?i)(^|,)(?<formalParameterOption>\\s*\\bOPTIONAL\\b\\s*|\\s*\\bBYVAL\\b\\s*|\\s*\\bBYREF\\b\\s*|\\s*\\bPARAMARRAY\\b\\s*)*\\s*(?<formalParameterName>[a-zA-Z]\\w*)\\s*(?<array>\\(\\))?\\s*(?<type>(?:\\bAS\\b\\s*[^,=]+)|(?<typeindicator>[\\!\\@\\#\\$\\%\\&]))?\\s*(?<initValue>=\\s*[^, ]+)?)";

	final String FORMAL_PARAMETER = "FORMAL_PARAMETER";
	
	final String START_BEGIN_BLOCK_REGEX = "(?:(?i)^\\s*\\bBEGIN\\b)";
	final String END_BEGIN_BLOCK_REGEX = "(?:(?i)^\\s*\\bEND\\b\\s*?$)";

	
	public ParserRegexVisualBasic6(File file) {
		File utfFile = null;
		try {
			utfFile = BicamSystem.toFileUTF8(file.getCanonicalPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
		this.inventory     = new ParserInventory();
		this.br = new BufferedReaderforRegex(utfFile);
		loadCommands();
		run();
	}
	
	public ParserInventory getInventory(){
		return inventory;
	}
	
	public boolean insideDeclarationSection() {
		if(insideEnum || insideMethod || insideType || isInsideBeginBlock()) return false;
		return true;
	}
	
	public boolean isInsideBeginBlock() {
		if(insideBeginBlock < 0) {
			BicamSystem.printLog("ERROR", "insideBeginBlock out of index" + insideBeginBlock);
		}
		return insideBeginBlock > 0 ? true : false;
	}
	
	//(?:(?i)(?:^\s*ATTRIBUTE\s*(?<attribute>\w+)\s*=\s*\S+\s*$)) 
	public void run() {
		String line = br.nextLine();
		while(line != null) {
			
			
			if(command(line)) {
//				if(line.toUpperCase().contains("IF "))
//					System.err.println(br.getCurrentLine() + " IF  "  + line);
				line = br.nextLine();
				continue;				
			}
			
			if(type(line)) {
//				System.err.println(br.getCurrentLine() + " TYPE  "  + line);

				insideType = true;  // Entrando dentro de type
				line = br.nextLine();
				continue;
			}
			if(enumeration(line)) {
//				System.err.println(br.getCurrentLine() + " INSIDE "  + line);

				insideEnum = true;  // Entrando dentro de type
				line = br.nextLine();
				continue;
			}			
			if(attribute(line)) {
				
//				System.err.println(br.getCurrentLine() + " ATTRIBUTE "  + line);

				line = br.nextLine();
				continue;
			}
			if(event(line)) {
//				System.err.println(br.getCurrentLine() + "  EVENT  "  + line);

				line = br.nextLine();
				continue;
			}
			if(option(line)) {
//				System.err.println(br.getCurrentLine() + " OPTION "  + line);

				line = br.nextLine();
				continue;
			}
			if(declare(line)) {
//				if(formalParameters != null) varFormalParameters();
				line = br.nextLine();
				continue;
			}
			if(form(line)) {
//				System.err.println(br.getCurrentLine() + " FORM "  + line);

				insideBeginBlock++;
//				System.err.println(insideBeginBlock + "+ " + br.getCurrentLine() + " " + line);

				line = br.nextLine();
				continue;
			}
			if(sub(line)) {
//				System.err.println(br.getCurrentLine() + " SUB "  + line);

				line = br.nextLine();
				insideMethod = true;  // Entrando dentro de procedure
				continue;
			}	
			if(function(line)) {
//				System.err.println(br.getCurrentLine() + " FUN "  + line);
				line = br.nextLine();
				insideMethod = true;  // Entrando dentro de procedure
				continue;
			}
			if(propertyGet(line)) {
//				System.err.println(br.getCurrentLine() + "PROPERTY GET  "  + line);

				line = br.nextLine();
				insideMethod = true;  // Entrando dentro de procedure
				continue;
			}
			if(propertyLet(line)) {
//				System.err.println(br.getCurrentLine() + " PROPERTY LET "  + line);

				line = br.nextLine();
				insideMethod = true;  // Entrando dentro de procedure
				continue;
			}
			if(propertySet(line)) {
//				System.err.println(br.getCurrentLine() + " PROPERTY SET  "  + line);

				line = br.nextLine();
				insideMethod = true;  // Entrando dentro de procedure
				continue;
			}
			
			if(runTimeDependencyObject(line)) {
//				System.err.println(br.getCurrentLine() + "  RUN TIME"  + line);

				line = br.nextLine();
				continue;
			}
			
			if(typeField(line)) {
//				System.err.println(br.getCurrentLine() + "  TYPE FIELD "  + line);

				line = br.nextLine();
				continue;
			}
			
			if(enumValue(line)) {
//				System.err.println(br.getCurrentLine() + " ENUM  VALUE "  + line);

				line = br.nextLine();
				continue;
			}	
			
			if(startBeginBlock(line)) {
//				System.err.println(br.getCurrentLine() + " BEGIN BLOCK "  + line);

				 insideBeginBlock++;
//					System.err.println(insideBeginBlock + "+ " + br.getCurrentLine()+ " " + line);

				line = br.nextLine();
				continue;
			}
			
			if(endBeginBlock(line)) {
//				System.err.println(br.getCurrentLine() + " END BLOCK  "  + line);

//				System.err.println(insideBeginBlock + "- " + br.getCurrentLine()+ " " + line);

				 insideBeginBlock--;

				 Integer x = insideBeginBlock;
				 if(insideBeginBlock < 0 ) {
						System.err.println(insideBeginBlock + "***** " + br.getCurrentLine()+ " " + line);
					 BicamSystem.printLog("ERROR", x.toString());
				 }
				line = br.nextLine();
				continue;
			}
			
			if(endOfMethod(line)) {
//				System.err.println(br.getCurrentLine() + " END METHOD "  + line);

				if(insideMethod) insideMethod = false;
				else {
					BicamSystem.printLog("ERROR", "SaÃ­da de Method invÃ¡lida");
				}
				line = br.nextLine();
				continue;
			}
			
			if(endOfType(line)) {
//				System.err.println(br.getCurrentLine() + " END TYPE "  + line);

				if(insideType) {
//					System.err.println(br.getCurrentLine() + "  INSIDE TYPE "  + line);

					insideType = false;
				}
				else {
					BicamSystem.printLog("ERROR", "SaÃ­da de Type invÃ¡lida");
				}
				line = br.nextLine();
				continue;
			}
			
			if(endOfEnum(line)) {
//				System.err.println(br.getCurrentLine() + " INSIDE ENUM "  + line);

				if(insideEnum) {
					insideEnum = false;
				}
				else {
					BicamSystem.printLog("ERROR", "SaÃ­da de Enum invÃ¡lida");
				}
				line = br.nextLine();
				continue;
			}
			

			
			if(defVarInsideMethod(line)) {
//				System.err.println(br.getCurrentLine() + " DEF VAR INSIDE "  + line);

				line = br.nextLine();
				continue;
			}
			
			if(defConstDeclarationSection(line)) {
//				System.err.println(br.getCurrentLine() + " CONST METHOD "  + line);

				line = br.nextLine();
				continue;
			}

			// DEVEm SER O ÃšLTIMOs IFs, VAR pode nao ter palavra chave
			if(defVarDeclarationSection(line)) {
//				System.err.println(br.getCurrentLine() + " DEF VAR DECLARATION "  + line);

				line = br.nextLine();
				continue;
			}
			line = br.nextLine();
		}
	}
	
	private boolean attribute(String line) {
		 Pattern p = Pattern.compile(ATTRIBUTE_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("attribute") > 0) {
				 inventory.add(m.group("attribute"), ATTRIBUTE);
			 }
		 }
		 return true;
	}
	
	private boolean option(String line) {
		 Pattern p = Pattern.compile(OPTION_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("optionClause") > 0) {
				 inventory.add(m.group("optionClause"), OPTION);
			 }
		 }
		 return true;
	}
	
	private boolean form(String line) {
		 Pattern p = Pattern.compile(FORM_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("formName") > 0) {
				 inventory.add(m.group("formName"), FORM);
			 }
		 }
		 return true;
	}
	
	private boolean varFormalParameters() {
		 String fp = formalParameters;
		 if(fp.length() == 0) {
			 formalParameters = null;
			 return false;
		 }
//		 Pattern p = Pattern.compile(DEFVAR_FORMAL_PARAMETERS_REGEX);
		 Pattern p = Pattern.compile(FORMAL_PARAMETERS_REGEX);
		 Matcher m = p.matcher(fp);
		 while(m.find()) {
			 if(m.start("formalParameterName") > -1) {
				 inventory.add(m.group("formalParameterName"), FORMAL_PARAMETER);
				 formalParameters = null;
			 }
//			 if(m.start("formalParameterNameNoType") > -1) {
//				 inventory.add(m.group("formalParameterNameNoType"), FORMAL_PARAMETER);
//				 formalParameters = null;
//			 }
		 }
		 if(formalParameters != null) {
			 BicamSystem.printLog("ERROR", "Invalid formal parameters in line " + br.getCurrentLine());
		 }
		 
		 return true;
	}
	
	private boolean event(String line) {
		 Pattern p = Pattern.compile(EVENT_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("eventName") > -1) {
				 inventory.add(m.group("eventName"), EVENT);
			 }
		 }
		 return true;
	}
	
	private boolean command(String line) {
		 if(!insideMethod) return false;
		 
		 line = line.trim();
		 
		 for(String command : commands) {
//			 String cmdRegex = String.format("(?:(?i)^\\s*\\b%s\\b\\s*)",command);
			 String cmdRegex = String.format("(?:(?i)^\\s*\\b%s\\b\\s*(?!\\s*=))",command);

			 Pattern p = Pattern.compile(cmdRegex);
			 Matcher m = p.matcher(line);
			 try {
				 if(m.find()) {
					 if(m.start() > -1) {
						 String c = m.group().trim();
						 inventory.add(m.group().trim(), COMMAND);
						 
//						 if(m.group().trim().equalsIgnoreCase("SET")) {
//							 System.err.println(m.group().trim() + " "  + br.getCurrentLine());
//						 }
						 return true;
					 }
				 }
			 }catch (Exception e) {
				 e.printStackTrace();
				 System.err.println();
			 }
		 }
		 return false;
	}	
	
//	private void inventoryIfInLine(String cmd, String line) {
//		if(!cmd.equalsIgnoreCase("IF")) return;
//		 String cmdRegex = String.format("(?:(?i)(?<then>\\bthen\\b))|(?:(?i)(?<else>\\belse\\b))",cmd);
//		 Pattern p = Pattern.compile(cmdRegex);
//		 Matcher m = p.matcher(line);
//		 if(m.find()) {
//			 int ix = m.start();
//			 line = line.substring(ix+4);
//			 if(line.length() > 0) {
//				 line = line.trim();
//				 cmd = line.split(" ")[0];
//				 for(String command : commands) {
//					 if(cmd.equalsIgnoreCase(command)) {
//					 inventory.add(cmd, COMMAND);
//					 }
//				 }
//			 }
//		 }
//	}
	
	private boolean declare(String line) {
		 if(insideMethod) return false;
		 Pattern p = Pattern.compile(DECLARE_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("name") > 0) {
				 inventory.add(m.group("name"), DECLARE);
			 }
			 if(m.start("formalParameters") > 0) {
//				 formalParameters = m.group("formalParameters");
				 formalParameters(m.group("formalParameters"));
			 }
		 }
		 return true;
	}
	
	private boolean sub(String line) {
		if(insideMethod) return false;
		 Pattern p = Pattern.compile(DEFMETHOD_SUB_REGEX, Pattern.UNICODE_CHARACTER_CLASS);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("subName") > -1) {
				 inventory.add(m.group("subName"), DEFMETHOD_SUB);
			 }
			 if(m.start("formalParameters") > -1) {
				 formalParameters(m.group("formalParameters"));
			 }
		 }
		 return true;
	}
	
	private boolean function(String line) {
		 if(insideMethod) return false;
		 Pattern p = Pattern.compile(DEFMETHOD_FUNCTION_REGEX, Pattern.UNICODE_CHARACTER_CLASS);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("functionName") > -1) {
				 inventory.add(m.group("functionName"), DEFMETHOD_FUNCTION);
			 }
			 if(m.start("formalParameters") > -1) {
				 formalParameters(m.group("formalParameters"));
			 }
		 }
		 return true;
	}
	
	private boolean propertyGet(String line) {
		 if(insideMethod) return false;
		 Pattern p = Pattern.compile(DEFMETHOD_PROPERTY_GET_REGEX, Pattern.UNICODE_CHARACTER_CLASS);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("propertyName") > -1) {
				 inventory.add(m.group("propertyName"), DEFMETHOD_PROPERTY_GET);
			 }
			 if(m.start("formalParameters") > -1) {
				 formalParameters(m.group("formalParameters"));
			 }
		 }
		 return true;
	}
	
	private boolean propertySet(String line) {
		 if(insideMethod) return false;
		 Pattern p = Pattern.compile(DEFMETHOD_PROPERTY_SET_REGEX, Pattern.UNICODE_CHARACTER_CLASS);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("propertyName") > -1) {
				 inventory.add(m.group("propertyName"), DEFMETHOD_PROPERTY_SET);
			 }
			 if(m.start("formalParameters") > -1) {
				 formalParameters(m.group("formalParameters"));
			 }
		 }
		 return true;
	}
	
	private boolean propertyLet(String line) {
    	 if(insideMethod) return false;
		 Pattern p = Pattern.compile(DEFMETHOD_PROPERTY_LET_REGEX, Pattern.UNICODE_CHARACTER_CLASS);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("propertyName") > -1) {
				 inventory.add(m.group("propertyName"), DEFMETHOD_PROPERTY_LET);
			 }
			 if(m.start("formalParameters") > -1) {
				 formalParameters(m.group("formalParameters"));
			 }
		 }
		 return true;
	}
	
	private boolean endOfMethod(String line) {
		 Pattern p = Pattern.compile(END_OF_METHOD_REGEX);
		 Matcher m = p.matcher(line);
		 if(m.matches()) return true;
		 return false;
	}

	private boolean startBeginBlock(String line) {
		 Pattern p = Pattern.compile(START_BEGIN_BLOCK_REGEX);
		 Matcher m = p.matcher(line);
		 if(m.find()) {
			 return true;
		 }
		 return false;
	}
	
	private boolean endBeginBlock(String line) {
		if(insideMethod) return false;
		 Pattern p = Pattern.compile(END_BEGIN_BLOCK_REGEX);
		 Matcher m = p.matcher(line);
		 if(m.find()) {
			 return true;
		 }
		 return false;
	}
	
	private boolean endOfType(String line) {
		 Pattern p = Pattern.compile(END_OF_TYPE_REGEX);
		 Matcher m = p.matcher(line);
		 if(m.matches()) {
			 return true;
		 }
		 return false;
	}
	
	private boolean endOfEnum(String line) {
		 Pattern p = Pattern.compile(END_OF_ENUM_REGEX);
		 Matcher m = p.matcher(line);
		 if(m.matches()) {
			 return true;
		 }
		 return false;
	}
	
	private boolean defVarInsideMethod(String line) {
		boolean ok = false;
		if(!insideMethod) return false;
		 Pattern p = Pattern.compile(DEFVAR_INSIDE_METHOD_REGEX);
		 Matcher m = p.matcher(line);
		 while(m.find()) {
			 if(m.start("name") > -1) {
				 inventory.add(m.group("name"), DEFVAR);
				 ok = true;
			 }
		 }
		 
		 if(!ok) return false;
		 
		 p = Pattern.compile(DEFVAR_INSIDE_METHOD_NEXT_REGEX);
		 m = p.matcher(line);
		 while(m.find()) {
			 if(m.start("name") > -1) {
				 inventory.add(m.group("name"), DEFVAR);

			 }
		 }		 
		 
		 if(ok) return true;
		 return false;
	}
	
//	private boolean defVarDeclarationSection(String line) {
//		if(!insideDeclarationSection()) return false;
//		 Pattern p = Pattern.compile(DEFVAR_DECLARATION_SECTION2_REGEX);
//		 Matcher m = p.matcher(line);
//		 boolean ok = false;
//		 while(m.find()) {
//			 if(m.start("varName") > -1) {
//				 inventory.add(m.group("varName"), DEFVAR);
//				 ok = true;
//			 }
//		 }
//		 
//		 if(!ok) return false;
//		 
//		 p = Pattern.compile(DEFVAR_DECLARATION_SECTION2_REGEX);
//		 m = p.matcher(line);
//		 while(m.find()) {
//			 if(m.start("varName") > -1) {
//				 inventory.add(m.group("varName"), DEFVAR);
//			 }
//		 }
//		 
//		 return true;
//	}

	private boolean defVarDeclarationSection(String line) {
		if(!insideDeclarationSection()) return false;
		 Pattern p = Pattern.compile(DEFVAR_DECLARATION_SECTION2_REGEX);
		 Matcher m = p.matcher(line);
		 if(m.find()) {
			 if(m.start("name") > -1) inventory.add(m.group("name"), DEFVAR);
			 if(m.start("next") > -1) defNextVar(m.group("next"));
		 }
		 return true;
	}
	
	private boolean defNextVar(String line) {
		if(!insideDeclarationSection()) return false;
		 Pattern p = Pattern.compile(DEFVAR_NEXT_REGEX);
		 Matcher m = p.matcher(line);
		 if(m.find()) {
			 if(m.start("name") > -1) inventory.add(m.group("name"), DEFVAR);
			 if(m.start("next") > -1) defNextVar(m.group("next"));
		 }
		 return true;
	}
	
	private boolean defConstDeclarationSection(String line) {
		if(!insideDeclarationSection()) return false;
		 Pattern p = Pattern.compile(DEFCONST_DECLARATION_SECTION_REGEX);
		 Matcher m = p.matcher(line);
		 while(m.find()) {
			 if(m.start("constName") > -1) {
				 inventory.add(m.group("constName"), DEFVAR);
				 return true;
			 }
		 }
		 return false;
	}
	
	private boolean typeField(String line) {
		if(!insideType) return false;
		 Pattern p = Pattern.compile(TYPE_FIELD_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("name") > -1) {
				 inventory.add(m.group("name"), TYPE_FIELD);
				 return true;
			 }
		 }
		 return false;
	}
	
	private boolean runTimeDependencyObject(String line) {
		 Pattern p = Pattern.compile(RUNTIME_DEPENDENCY_OBJECT_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("name") > -1) {
				 inventory.add(m.group("name"), RUNTIME_DEPENDENCY_OBJECT);
			 }
		 }
		 return true;
	}
	
	private boolean type(String line) {
		 if(insideMethod) return false; // Type sÃ³ pode ser definindo fora do method
		 Pattern p = Pattern.compile(TYPE_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("name") > -1) {
				 inventory.add(m.group("name"), TYPE);
			 }
		 }
		 return true;
	}
	
	private boolean enumeration(String line) {
		 if(insideMethod) return false; // Type sÃ³ pode ser definindo fora do method
		 Pattern p = Pattern.compile(ENUM_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("name") > -1) {
				 inventory.add(m.group("name"), ENUM);
			 }
		 }
		 return true;
	}
	
	private boolean enumValue(String line) {
		if(!insideEnum) return false;
		 Pattern p = Pattern.compile(ENUM_VALUE_REGEX);
		 Matcher m = p.matcher(line);
		 if(!m.matches()) return false;
		 m.reset();
		 while(m.find()) {
			 if(m.start("enumValue") > -1) {
				 inventory.add(m.group("enumValue"), ENUM_VALUE);
				 return true;
			 }
		 }
		 return false;
	}	
	
	private boolean formalParameters(String line) {
		 Pattern p = Pattern.compile(FORMAL_PARAMETERS_REGEX);
		 Matcher m = p.matcher(line);
		 while(m.find()) {
			 if(m.start("formalParameterName") > -1) {
				 inventory.add(m.group("formalParameterName"), FORMAL_PARAMETER);
			 }
//			 if(m.start("formalParameterNameNoType") > -1) {
//				 inventory.add(m.group("formalParameterNameNoType"), FORMAL_PARAMETER);
//			 }			 
		 }
		 return true;
	}

	public void print() {
		System.out.println(getInventory().getInventory());
		System.out.println(getInventory().sumByelementClass());
	}
	
	public void loadCommands() {
		commands = new HashSet<String>();
		   commands.add("APPACTIVATE");
		   commands.add("BEEP");
		   commands.add("CALL");
		   commands.add("CHDIR");
		   commands.add("CHDRIVE");
		   commands.add("CLOSE");
		   commands.add("DATE");
		   commands.add("DELETESETTING");
//		   commands.add("DO");
		   commands.add("ERASE");
		   commands.add("ERROR");
		   commands.add("EXIT");
		   commands.add("FILECOPY");
		   commands.add("FOR");
		   commands.add("GOSUB");
		   commands.add("GOTO");
		   commands.add("IF");
		   commands.add("INPUT");
		   commands.add("KILL");
		   commands.add("LET");
		   commands.add("LINE");
		   commands.add("LOAD");
		   commands.add("LOCK");
		   commands.add("UNLOCK");
		   commands.add("LSET");
//		   commands.add("MID"); Ã‰ FUNÃ‡ÃƒO  alÃ©m de ser E NÃƒO COMMAND
		   commands.add("MKDIR");
		   commands.add("NAME");
		   commands.add("ON");
		   commands.add("OPEN");
//		   commands.add("OPTION"); tratado como comando especial
		   commands.add("PRINT");
		   commands.add("PUT");
		   commands.add("RAISEEVENTEVENTNAME");
		   commands.add("RANDOMIZE");
		   commands.add("REDIM");
		   commands.add("RESET");
		   commands.add("RESUME");
		   commands.add("RMDIR");
		   commands.add("RSET");
		   commands.add("SAVESETTING");
		   commands.add("SEEK");
		   commands.add("SELECT");
		   commands.add("SENDKEYS");
		   commands.add("SET");
		   commands.add("SETATTR");
		   commands.add("STOP");
		   commands.add("TIME");
		   commands.add("UNLOAD");
		   commands.add("WHILE");
		   commands.add("WIDTH");
		   commands.add("WITH");
		   commands.add("WRITE");
	}
	  
  public static void main(String args[]) {
	  File f = null;
	  try {
		f = BicamSystem.toFileUTF8("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv001.frm");
	} catch (IOException e) {
		e.printStackTrace();
	}
	  ParserRegexVisualBasic6 parse = new ParserRegexVisualBasic6(f );
	  parse.print();
  }
}

  class BufferedReaderforRegex {
	BufferedReader br;
	final String LINE_SEPARATOR = System.lineSeparator();
	List<String> lines;
	int linesRead;
	String lineToContinue;
	
	public BufferedReaderforRegex(Object source) {
		lines = new ArrayList<String>();

		if(source instanceof URI) open((URI)source);
		else if(source instanceof File) open((File)source);
		else if(source instanceof String) open((String)source);
		else try {
			throw new InvalidParameterException("Must be 'URL' or 'File' ");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Integer getCurrentLine() {
		return linesRead;
	}
	
	public String nextLine() {
		String line = null;
		try {
			if(lines.size() > 0) {
				line = lines.get(0);
				lines.remove(0);				
			}
			else {
				line = br.readLine();
				linesRead++;
			}
			
			if(line == null) {
			  close();
			  return null;
			}
	 /**
	 * (?:(?i)(?<stringliteral>\\\"[^\"]*\"))|(?:(?i)(?<comment>\\s*'.*$))|(?:(?i)(?<label>^\\w+:))|(?:(?i)(?<newCmdInLine>: ))
	 * 
	 * https://regex101.com
	 * (?:(?i)(?<stringliteral>"[^"]*"))|(?:(?i)(?<comment>\s*'.*$))|(?:(?i)(?<label>^\w+:))|(?:(?i)(?<newCmdInLine>: ))
	 * 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456
	 * 1. (?:....) - mandadório para comando "find()"
	 * 4. (?i) flag modifier para case insensitive
	 * 8. (?<groupName> identifica group name
	 * 32. ) fecha "group name"
	 * 33. ) fecha paren que abriu em 1.
	 * 
	 * 34. indica outra opção para busca do find
	 * 
	 * Pattern p = Pattern.compile(newCmdInLine);
	 * Matcher m = p.matcher(line);
	 * m.find(), se true m.start()
	 */			
		if(lineToContinue != null) {
			line = lineToContinue + line;
			lineToContinue = null;
		}
			
		 String newCmdInLine = "(?:(?i)(?:\"[^\"]*\"))|(?:(?i)(?<comment>\\s*'.*$))|(?:(?i)(?<label>^\\w+:))|(?:(?i)(?<newCmdInLine>: ))|(?:(?i)(?<lineContinuation> _$))|(?:(?i)^(?<lineNumber>\\d+))|(?:(?i)then(?<thenInLine>(?=\\s+[a-zA-Z]\\w*)(?:.(?!ELSE))+))|(?:(?i)else(?<elseInLine>(?=\\s+[a-zA-Z]\\w*)(?:.(?!$))+))";
		 Pattern p = Pattern.compile(newCmdInLine);
		 Matcher m = p.matcher(line);
		 line = splitCmdInLine(line,m);
		 if(line == null) line = nextLine();		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return line;
	}
	
	private String splitCmdInLine(String line, Matcher m) {
		try {
			while(m.find()) {
				if(m.start("comment") > -1) {
					lines.add(line.substring(0,m.start("comment")));
					line = null;
					 break;
				}
				if(m.start("label") > -1) {
					lines.add(line.substring(m.group("label").length()));
					line =  null;
					break; 
				}
				if(m.start("lineNumber") > -1) {
					lines.add(line.substring(m.group("lineNumber").length()));
					line =  null;
					break; 
				}
				if(m.start("newCmdInLine") > -1) {
					 lines.add(line.substring(0,m.start("newCmdInLine")));
					 lines.add(line.substring(m.start("newCmdInLine")+1));
					 line = null;
					 break;
				 }
				if(m.start("lineContinuation") > -1) {
					lineToContinue = line.substring(0,m.start("lineContinuation"));
					line = null;
					 break;
				}
	/**
	 * linha: 'If Digits = 1 then exit  Else MyString = "More than one"' 

	 * linha1 = 'If Digits = 1'
	 * linha2 = 'exit'
	 * linha3 = 'MyString = "More than one"'
	 * 
	 * */
				
				
	/**
	 * cria uma nova linha a partir do "then" do "if" in line
	 * */
				boolean hasThenInLine = false;
				if(m.start("thenInLine") > -1) {
					 lines.add(line.substring(0,m.start("thenInLine")));
					 lines.add(line.substring(m.start("thenInLine")));
					 hasThenInLine = true;
				}
				if(m.start("elseInLine") > -1) {
					if(hasThenInLine) lines.add(line.substring(0,m.start("elseInLine")));
					 lines.add(line.substring(m.start("elseInLine")));
					 line = null;
					 break;
				}
				if(hasThenInLine) {
                    line = null;
					break;
				}
			 }
		} catch(StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			int i = 0;
			int c = 2;
			i = 0 + c;
			
		}
			return line;
	}
	
	private void open(URI uri) {
	  try {
		  br = new BufferedReader(new InputStreamReader(uri.toURL().openConnection().getInputStream()));
	  } catch(Exception e) {
		e.printStackTrace();
	  }
	}
    
	private void open(File file) {
		  try {
			  br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
		  } catch(Exception e) {
			e.printStackTrace();
		  }
	}
	
	private void open(String pathFile) {
		  try {
			  open(new File(pathFile));
		  } catch(Exception e) {
			e.printStackTrace();
		  }
	}
	
	private void close() {
		  try {
			  br.close();
		  } catch(Exception e) {
			e.printStackTrace();
		  }
	}
	
	public static void main(String[] args) {
		File f = null;
		try {
			f = BicamSystem.toFileUTF8("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GECOEX01.CLS");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BufferedReaderforRegex bfr = new BufferedReaderforRegex(f);

		String line = bfr.nextLine();
		while(line != null) {
			System.err.println(line);
			line = bfr.nextLine();
		}
	}	
}