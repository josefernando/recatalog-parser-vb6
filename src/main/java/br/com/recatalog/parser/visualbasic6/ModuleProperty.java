package br.com.recatalog.parser.visualbasic6;


import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ModuleProperty {
	
	private String filePath;
	
	private Properties properties;
	
	public ModuleProperty(String filePath) {
		this.filePath = filePath;
		properties = new Properties();
		properties.put("FILE_PATH", filePath);
		run();
	}
	
	public String getName(){
		return properties.getProperty("NAME");
	}
	
	public Boolean isClassModule() {
		String moduleType =  properties.getProperty("MODULE_TYPE");
		if(moduleType != null && moduleType.equalsIgnoreCase("CLASS")) return true;
		return false;
	}
	
	public Boolean isOptionExplicit() {
		String optionType =  properties.getProperty("OPTION_TYPE");
		if(optionType != null && optionType.equalsIgnoreCase("EXPLICIT")) return true;
		return false;
	}

	public void run()  {
		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath)));
	    String line = null;
	    Pattern p = Pattern.compile("(?:(?i)(?:^\\s*\\bAttribute\\b\\s*(?<vbname>\\bVB_Name\\b)\\s*=\\s*\\\"(?<name>[^\\\"]+))|(?:^\\s*\\bVERSION\\b\\s*\\S*\\s*(?<classType>\\bCLASS\\b))|(?:^\\s*\\bOPTION\\b\\s*(?<optionExplicit>\\bEXPLICIT\\b)))");
	    while ((line = reader.readLine()) != null) {
	        Matcher m = p.matcher(line);
	        while(m.find()) {
	        	if(m.start("name") > -1)
	        		properties.put("NAME", m.group("name"));
	        	if(m.start("classType") > -1)
	        		properties.put("MODULE_TYPE", m.group("classType"));
	        	if(m.start("optionExplicit") > -1) 
	        		properties.put("OPTION_TYPE", m.group("optionExplicit"));
	        }
	    }
		reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		ModuleProperty module = new ModuleProperty("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
		System.err.println("Name: " + module.getName());
		System.err.println("isClass: " + module.isClassModule());
	}
}