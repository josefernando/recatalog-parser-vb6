package br.com.recatalog.parser.visualbasic6;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.core.ContextTreeData;
import br.com.recatalog.core.Language;
import br.com.recatalog.core.Scope;
import br.com.recatalog.core.Symbol;
import br.com.recatalog.core.SymbolFactory;
import br.com.recatalog.core.visualbasic6.BuiltinScope;
import br.com.recatalog.core.visualbasic6.GlobalScope;
import br.com.recatalog.core.visualbasic6.LanguageVb6;
import br.com.recatalog.core.visualbasic6.SymbolFactoryVisualBasic6;
import br.com.recatalog.parser.util.UnResolvedSymbolList;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.PropertyList;

public class SymbolTableBuilder {             
	IdentityHashMap<ParserRuleContext, ContextTreeData> ctdMap;
	
	Map<String,PropertyList> dictionary;
	
	Scope builtinScope;
	Scope globalScope;
	Language language;
	PropertyList properties;

	SymbolFactory symbolFactory;
	
	IdentityHashMap<Symbol, ArrayList<ParserRuleContext>> whereUsed; 
	
	Map<String, UnResolvedSymbolList> unResolvedSymbolList;
	
	public SymbolTableBuilder(Language language){
		this.properties = new PropertyList();
		this.dictionary = new LinkedHashMap<String,PropertyList>();
		this.unResolvedSymbolList = new HashMap<>(); 
		
		this.language = language;
		symbolFactory = new SymbolFactoryVisualBasic6();
		properties.addProperty("LANGUAGE", this.language);
		properties.addProperty("SYMBOL_FACTORY", symbolFactory);

		ctdMap = new IdentityHashMap<ParserRuleContext, ContextTreeData>();
		whereUsed   = new IdentityHashMap<Symbol, ArrayList<ParserRuleContext>>();

		globalScope   = createGlobalScope();
		
		symbolFactory = new SymbolFactoryVisualBasic6();
		
		createPreDefinedSymbols();
	}
	
	public PropertyList getProperties() {
		return properties;
	}
	
	public IdentityHashMap<ParserRuleContext, ContextTreeData> getCTDMap() {
		return ctdMap;
	}
	
	public ContextTreeData addCTD(ParserRuleContext ctx) {
		if(getCTD(ctx) != null) {
			BicamSystem.printLog("ERROR", String.format("CTD already exists in line %d at position %d", ctx.start.getLine(), ctx.start.getCharPositionInLine()));
		}
        ctdMap.put(ctx, new ContextTreeData(ctx));
        return getCTD(ctx);
	}
	
	public ContextTreeData getCTD(ParserRuleContext ctx) {
		return ctdMap.get(ctx);
	}
	
    public String toString() {
    	return getGlobalScope().toString();
   	} 
    
    public Scope getGlobalScope(){
		return globalScope;
    }
    
    public Scope getBuiltinScope(){
		return builtinScope;
    }
    
    public Language getLanguage() {
    	return language;
    }
    
    public boolean isCaseSensitive() {
    	return globalScope.isCaseSensitive();
    }
    
    private Scope  createGlobalScope() {
		PropertyList propBuiltin = new PropertyList();
		propBuiltin.addProperty("NAME", "BUILTIN");
		Language language = new LanguageVb6();
		propBuiltin.addProperty("LANGUAGE", language);
		builtinScope  = new BuiltinScope(propBuiltin);
    	
    	PropertyList prop = new PropertyList();
    	prop.addProperty("NAME", "GLOBAL");
    	prop.addProperty("LANGUAGE", language);
    	prop.addProperty("SCOPE", builtinScope);

    	Scope globalScope = (Scope) new GlobalScope(prop);
    	return globalScope;
    }
    
    private void createPreDefinedSymbols() {
		Map<String,PropertyList> preDefSymbols = language.getPreDefinedSymbols();
		
		for(Entry<String, PropertyList> entry : preDefSymbols.entrySet()){
			define(entry);
		}
    }    
    
    public Map<String,PropertyList> getDictionary(){
    	return dictionary;
    }

    private void define(Entry<String, PropertyList> entry) {
    	PropertyList prop = entry.getValue();
    	PropertyList properties = prop.getCopy();

    	String scopeStr = (String) properties.getProperty("SCOPE");
    	String parentStr = (String) properties.getProperty("PARENT");

    	Scope scope = null;
    	Scope parent = null;

    	
    	if(scopeStr == "BUILTIN") scope = builtinScope;
    	else if(scopeStr == "GLOBAL") scope = globalScope;
    	else if(scopeStr != null ) {
	    		PropertyList resolv =  new PropertyList();
	    		resolv.addProperty("NAME_TO_RESOLVE", scopeStr);
	    		scope = (Scope)globalScope.resolve(resolv);
    	}
    	
    	if(parentStr != null ) {
    		PropertyList resolv =  new PropertyList();
    		resolv.addProperty("NAME_TO_RESOLVE", parentStr);
    		parent = (Scope) scope.resolve(resolv);
    	}

    	if(scope == null) {
    		try {
    			throw new NullPointerException();
    		}catch (NullPointerException e) {
    			BicamSystem.printLog("ERROR", "Null Scope");
    		}
    	}
    	
		properties.addProperty("NAME", entry.getKey());
		if(scope  != null) properties.addProperty("SCOPE", scope);
		if(parent  != null) properties.addProperty("PARENT", parent);

		properties.addProperty("LANGUAGE", language);
		
		symbolFactory.getSymbol(properties);
    }
	
	public void parsing(List<String> filesToParse) {
		for(String filePath : filesToParse ) {
			parsing(filePath);
		}
		
		/**
		 * Lambda não pega (catch) exception
		 */
//		filesToParse.forEach((filePath) -> parsing(filePath));
	}
	
	public void parsing(String filePath) {
		PropertyList props = new PropertyList();
		props.addProperty("FILE_PATH", filePath);

		VisualBasic6ParserCompUnit parseVb6CompUnit = new VisualBasic6ParserCompUnit(props);
 
		ModuleProperty module = new ModuleProperty(filePath);
		String moduleName = module.getName();
		getDictionary().put(moduleName, new PropertyList());
		PropertyList propDic = getDictionary().get(moduleName);
		propDic.addProperty("ASTREE", (ParseTree) props.mustProperty("ASTREE"));
		propDic.addProperty("FILE_PATH", filePath);
		propDic.addProperty("OPTION_EXPLICIT", module.isOptionExplicit());
		if(module.isClassModule()) {
			propDic.addProperty("IS_CLASS", true);
		}
		
        if(parseVb6CompUnit.getNumErrors() > 0 ) {
        	System.err.println(String.format("PARSING FAILED  with %d ERRORS", parseVb6CompUnit.getNumErrors()) );
        	System.err.println(parseVb6CompUnit.getProperties().mustProperty("EXCEPTION"));
    		propDic.addProperty("PARSING_ERRORS", parseVb6CompUnit.getNumErrors());
    		propDic.addProperty("EXCEPTION", parseVb6CompUnit.getProperties().mustProperty("EXCEPTION"));
        }
       	else {
        	System.err.print(String.format("SUCCESSFULLY PARSING  in %f seconds", parseVb6CompUnit.getElapsedTime()));
    		propDic.addProperty("PARSING_TIME", parseVb6CompUnit.getElapsedTime());
       	}
		
		parseUnitTest((ParseTree)propDic.getProperty("ASTREE"), new File(filePath));
	}	
	
	public void parseUnitTest(ParseTree tree, File file) {
        VisualBasic6CompUnitInventory visualBasic6InventoryCompUnit = new VisualBasic6CompUnitInventory();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(visualBasic6InventoryCompUnit, tree);        // walk parse tree 
        
        if(visualBasic6InventoryCompUnit.getException() != null) {
        	System.err.println(visualBasic6InventoryCompUnit.getException());
        }
        
  	     ParserRegexVisualBasic6 parseRegex = new ParserRegexVisualBasic6(file);
  	     boolean ok = visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory());
  	     if(!ok) {
             visualBasic6InventoryCompUnit.getInventory().print();
             parseRegex.getInventory().print();
  	     }
//  	   String unitTest = visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory())
//  			             == true ? "Succeed" : "Failed";
  	   boolean unitTest = visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory()); 
  	   System.err.println(String.format("Unit Test: %s%n", unitTest == true ? "Succeeded" : "Failed"));		
  	   if(!unitTest) {
  		   String msg = System.lineSeparator()+ visualBasic6InventoryCompUnit.getInventory().getInventory().toString();
  		   msg = msg + System.lineSeparator()+ parseRegex.getInventory().getInventory().toString();
  	   }
	}
	
	public void defSymbol() {
		getDictionary().forEach((moduleName,properties) -> defSymbol(moduleName,(ParseTree)properties.getProperty("ASTREE"),(String)properties.getProperty("FILE_PATH")));
	}
	
	public void defSymbol(String moduleName, ParseTree tree, String filePath) {
		PropertyList prop = new PropertyList();
		prop.addProperty("SYMBOL_TABLE", this);
		prop.addProperty("ASTREE", tree);
		prop.addProperty("FILE_PATH", filePath);

		System.err.println("DEFINING SYMBOLS: " + moduleName);
        VisualBasic6DefSymCompUnit defVisualBasic6CompUnit = new VisualBasic6DefSymCompUnit(prop);

        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(defVisualBasic6CompUnit, tree);        // walk parse tree 
	}

	public void refTypeSymbol() {
		getDictionary().forEach((moduleName,properties) -> refTypeSymbol(moduleName, (ParseTree)properties.getProperty("ASTREE")));
	}
	
	public void refTypeSymbol(String moduleName, ParseTree astree) {
		PropertyList prop = new PropertyList();
		prop.addProperty("SYMBOL_TABLE", this);
		prop.addProperty("MODULE_NAME", moduleName);

		System.err.println("REFTYPE SYMBOLS: " + moduleName);
        VisualBasic6RefTypeSymCompUnit refTypeSym = new VisualBasic6RefTypeSymCompUnit(prop);
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(refTypeSym, astree);        // walk parse tree 
	}
	
	public void refSymbol() {
		getDictionary().forEach((moduleName,properties) -> refSymbol(moduleName, properties));
	}
	
	public void refSymbol(String moduleName, PropertyList properties) {
		ParseTree astree = (ParseTree)properties.mustProperty("ASTREE");
		
		PropertyList prop = new PropertyList();
		prop.addProperty("SYMBOL_TABLE", this);
		prop.addProperty("MODULE_NAME", moduleName);
		prop.addProperty("OPTION_EXPLICIT", properties.mustProperty("OPTION_EXPLICIT"));

		System.err.println("REFSYMBOL SYMBOLS: " + moduleName);
        VisualBasic6RefSymCompUnit refSym = new VisualBasic6RefSymCompUnit(prop);
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(refSym, astree);        // walk parse tree 
	}	
	
	public ParseTree getAstree(String moduleName) {
		PropertyList dicProperties = dictionary.get(moduleName);
		return (ParseTree) dicProperties.mustProperty("ASTREE");
	}
	
	public Map<String, UnResolvedSymbolList> getUnResolvedSymbolList() {
		return unResolvedSymbolList;
	}
	
	
	public boolean hasUnResolvedSymbol() {
		for(Entry<String, UnResolvedSymbolList> ee: unResolvedSymbolList.entrySet()){
			return true;
		}
		return false;
	}
    
    public static void main(String[] args) throws Exception {
    	Language language = new LanguageVb6();
    	SymbolTableBuilder st = new SymbolTableBuilder(language);
    	System.err.println("----- Printing toString()");
//    	System.err.println(st.getBuiltinScope().toString());
//    	System.err.println(st.getGlobalScope().toString());
    	
		List<String> files = new ArrayList<String>() {{

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

//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqDetalhe.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqHeader.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqRetorno.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqTrailer.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqTrailerLote.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Detalhe.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_DetalheRetorno.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_GerArquivo.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Header.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_HeaderLote.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Ocorrencia.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_OcorrenciaDetalhe.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_SegmentoA.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_SegmentoB.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Trailler.cls");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmAlterAltVolAgdCco.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmCaminhoWs.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmConsDocTed.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmExclusaoAltVolAgdCco.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAcompFilaR1R2.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAjuda.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAlteraDataCorteOPCrp.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAlteraTipoCredito.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLCadParametrosMcliq.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlCancelaEmiAltoVolume.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlCargaDemandaJudicialExcel.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlCargaPagamentoExcel.frm");
////			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLCodigosMcLiq.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlComplementaPlanilha.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLConsAssociarOpe.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsDepositoJudicial.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsDevMais10Dias.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsIntegMLCCOper.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsLogRoboCredArq.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsMonitEnvRecFunc.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsNroCtrSPB.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsReversaoOPs.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsultaClientes.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlControlSdoLoja.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDepositoJudicial.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDesmembraDOCsAltoVolume.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDetalhamentoLiq.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDevolucoesPendCreArq.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlEstornoOPCrp.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlExtrativaDIMOF.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF000.bas");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF00001.BAS");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF002.BAS");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF003.BAS");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF005.BAS");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF008.BAS");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF010.BAS");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF012.BAS");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlf014.bas");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF016.bas");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF017.bas");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF018.bas");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF019.bas");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlGerArquivoCreditoBco.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlIntegraBoletoBMG.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutAgdCco.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLManutEmailNotifica.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutFinalidadesLiq.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutFinProOL.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutOpEspec.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlMotCancelOper.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlMotivosDevolucao.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlOLAgendamentos.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLParametrosSistema.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlParmCredPorArquivo.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlSolicAutomReenviosOP.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlSolicCreditoArq.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv000.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv001.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV002.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0031.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV004.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0041.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV005.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV006.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV008.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV009.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV010.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV011.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV012.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV013.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV014.FRM");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV015.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0151.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0152.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV016.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV017.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV018.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV019.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV020.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv021.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV022.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv023.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv024.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV025.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv026.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv027.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv028.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV029.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV030.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV031.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV032.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV033.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV034.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV035.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv036.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV037.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV038.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv039.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv040.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv041.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv042.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv043.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv044.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv045.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv046.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv047.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv048.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv049.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv050.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv051.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv052.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv053.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv053a.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv054.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv055.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv056.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv057.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv058.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv059.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv060.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv061.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv062.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv063.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv064.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv065.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv066.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv067.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv068.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv069.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv070.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv071.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv072.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv073.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv074.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv075.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv076.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv077.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv078.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv079.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv080.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv081.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv082.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv083.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv084.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv085.frm");
//			add("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv086.frm");
			
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/changeuserprofile.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/deposit.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/Form1.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/Form2.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmAbout.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmbankprofile.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmcustinfo.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmcust_master.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmdeposit.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmprocess.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmsetting.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmtransaction.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/frmwithdrawal.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/login.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/MDIForm1.frm");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/Module1.bas");
//			add("C:/Download/Fontes/VB/input/bank_vb_project/bank/user_info.frm");
		}};
		
		st.parsing(files);
		st.defSymbol();
//		System.err.println(st.getGlobalScope().toString());
		st.refTypeSymbol();
		if(st.hasUnResolvedSymbol())
			System.err.println("RefTypeSymbols Not Resolved: " + st.hasUnResolvedSymbol());
		st.refSymbol();
		if(st.hasUnResolvedSymbol())
			System.err.println("RefSymbols Not Resolved: " + st.hasUnResolvedSymbol());
		System.err.println(st.getGlobalScope().toString());
		
//		System.err.println(st.getGlobalScope().toString());
    }
}