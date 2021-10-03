package br.com.recatalog.parser.visualbasic6;

import java.security.InvalidParameterException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.core.ContextTreeData;
import br.com.recatalog.core.ModifierMatrixVb6Variable;
import br.com.recatalog.core.Scope;
import br.com.recatalog.core.Symbol;
import br.com.recatalog.core.SymbolFactory;
import br.com.recatalog.core.SymbolType;
import br.com.recatalog.core.visualbasic6.LanguageVb6;
import br.com.recatalog.parser.util.UnResolvedSymbolList;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.AsTypeClauseContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.DeclarationContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.EnumDefStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.FormalParameterContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.LshAssignContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.MethodDefStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.ModifierContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.ModuleContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.ReDimStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.RealParameterContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.RshAssignContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.ScopeModifierContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.TypeContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.TypeDefStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.VariableDeclarationContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.VariableStmtContext;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.NodeExplorer;
import br.com.recatalog.util.PropertyList;

public class VisualBasic6DefSymCompUnit extends VisualBasic6CompUnitParserBaseListener {
	
	SymbolTableBuilder st;
	PropertyList properties;
	Deque<Scope> scopes;
	Scope moduleScope;
	Scope appScope;
	Scope globalScope;
	ParseTree compUnitTree;
	SymbolFactory symbolFactory;
	
	public static ParseTree tree;
	
	private ModuleProperty module;
	
	final String[] typeIndicators = {"!", "@", "#", "$", "%", "&"};
	
	Map<String,String> typeIndicatorMap = new HashMap<String,String>(){{
		put("!","Single");
		put("@!","Currency");
		put("#","Double");
		put("$","String");
		put("%","Integer");
		put("&","Long");
		}};
	
	public VisualBasic6DefSymCompUnit(PropertyList properties) {
		this.properties = properties;
		this.st = (SymbolTableBuilder) this.properties.mustProperty("SYMBOL_TABLE");
		this.compUnitTree = (ParseTree) this.properties.mustProperty("ASTREE");
		symbolFactory = (SymbolFactory) st.getProperties().mustProperty("SYMBOL_FACTORY");
		scopes = new ArrayDeque<Scope>();
		globalScope = st.getGlobalScope();
		pushScope(st.getGlobalScope());	
		
		module = new ModuleProperty((String)this.properties.mustProperty("FILE_PATH"));

//	    this.st.getUnResolvedSymbolList().put(module.getName().toUpperCase(), new UnResolvedSymbolList());
	}
	
/**	
	//matrix line: modifier
	public static final int mNULL = 0;
	public static final int mDIM = 1;
	public static final int mPRIVATE = 2;
	public static final int mPUBLIC = 3;
	public static final int mGLOBAL = 4;

	//matrix column: enclosing scope
	public static final int mFRM = 0;
	public static final int mBAS = 1;
	public static final int mCLS = 2;
	public static final int mFORMAL_PARAMETER = 3;
	public static final int mMETHOD_SUB_FUNCTION = 4;
	public static final int mTYPE = 5;
	public static final int mENUM = 6;
	*/
	
	private Scope modifierVariable(ParserRuleContext ctx) {
		ParserRuleContext ctxVariableDeclaration = NodeExplorer.getAncestorClass(ctx, VariableDeclarationContext.class.getSimpleName()); 

		ParserRuleContext ctxScopeModifier = null;
		if(ctxVariableDeclaration != null) {
			ctxScopeModifier = NodeExplorer.getChildClass(ctxVariableDeclaration, ScopeModifierContext.class.getSimpleName());
		}
		
		String modifier = ctxScopeModifier == null ? "NULL" : ctxScopeModifier.getText().toUpperCase();
		int MODIFIER = -1;
		if(modifier.equals("NULL")) MODIFIER = 0;
		if(modifier.equals("DIM")) MODIFIER = 1;
		if(modifier.equals("PRIVATE")) MODIFIER = 2;
		if(modifier.equals("PUBLIC")) MODIFIER = 3;
		if(modifier.equals("GLOBAL")) MODIFIER = 4;

		int LOCATION = -1;
		
		String moduleType = getModuleType(ctx);
		
		if(moduleType.equalsIgnoreCase("FRM"))
        	LOCATION = 0;
		if(moduleType.equalsIgnoreCase("BAS"))
        	LOCATION = 1;	
		if(moduleType.equalsIgnoreCase("CLS"))
        	LOCATION = 2;
        if(NodeExplorer.hasAncestorClass(ctx, FormalParameterContext.class.getSimpleName()))
        	LOCATION = 3;
        else if(NodeExplorer.hasAncestorClass(ctx, MethodDefStmtContext.class.getSimpleName()))
        	LOCATION = 4;
        else if(NodeExplorer.hasAncestorClass(ctx, TypeDefStmtContext.class.getSimpleName()))
        	LOCATION = 5;
        else if(NodeExplorer.hasAncestorClass(ctx, EnumDefStmtContext.class.getSimpleName()))
        	LOCATION = 6;        
		
		String scope = ModifierMatrixVb6Variable.resultScope[MODIFIER][LOCATION];
		
		if(scope.equalsIgnoreCase("PROJECT")) return globalScope;
		if(scope.equalsIgnoreCase("MODULE")) return getModuleScope();
		if(scope.equalsIgnoreCase("CURRENT")) return getCurrentScope();
		
		try {
		throw new InvalidParameterException();
		} catch (InvalidParameterException e) {
			BicamSystem.printLog("ERROR", String.format("Modifier Not Resolved of '%s' in line %d at position %dformat", ctx.getText(), ctx.start.getLine(), ctx.start.getCharPositionInLine()));
		}
		return null;
	}
	
	private Scope getModuleScope() {
		return moduleScope;
	}
	
	private Scope getCurrentScope() {
		return scopes.peek();
	}
	
	private void pushScope(Scope scope) {
		 scopes.push(scope);
	}
	
	private void popScope() {
		 scopes.pop();
	}
	
	private void setArrayGuiElemet(Scope scope, String index) {
			((Symbol)scope).addProperty("ARRAY_INDEX", index);
	}
	
	private void createVariable(VariableStmtContext ctx) {
		PropertyList varProp = new PropertyList();
		String name = ctx.Name.getText();
		
		String dataType = null;
		ParserRuleContext ctxType = (ParserRuleContext)NodeExplorer.getChildClass(ctx, TypeContext.class.getSimpleName());
        if(ctxType != null) dataType = ctxType.getText(); 
        if(dataType == null) {                         // Verifica typeindicator
			for(String tp : typeIndicators) {
				name = name.replace(tp, "");
				dataType = typeIndicatorMap.get(tp);
			}
        }
        
        if(dataType != null) varProp.addProperty("DATA_TYPE", dataType);

		if(NodeExplorer.hasAncestorClass(ctx, FormalParameterContext.class.getSimpleName())) {
				varProp.addProperty("SCOPE", getCurrentScope());
		}      
		else if(NodeExplorer.hasAncestorClass(ctx, TypeDefStmtContext.class.getSimpleName())) {
			varProp.addProperty("SCOPE", getCurrentScope());
		}
		else if(NodeExplorer.hasAncestorClass(ctx, EnumDefStmtContext.class.getSimpleName())) {
			varProp.addProperty("SCOPE", getCurrentScope());
		}
		else if(NodeExplorer.hasAncestorClass(ctx, VariableDeclarationContext.class.getSimpleName())) {
			ParserRuleContext ctxVar = NodeExplorer.getAncestorClass(ctx, VariableDeclarationContext.class.getSimpleName());
			ParserRuleContext ctxScopeModifier = NodeExplorer.getChildClass(ctxVar, ScopeModifierContext.class.getSimpleName());
			String modifier = null;
			if(ctxScopeModifier != null) {
				modifier = ctxScopeModifier.getText();
				if(modifier.equalsIgnoreCase("PUBLIC")
						|| modifier.equalsIgnoreCase("GLOBAL")) {
					varProp.addProperty("SCOPE", globalScope);
					varProp.addProperty("PARENT", getCurrentScope());

				}
				else if(modifier.equalsIgnoreCase("PRIVATE")
						|| modifier.equalsIgnoreCase("DIM"))
					varProp.addProperty("SCOPE", getCurrentScope());
			}
			else /* ctxScopeModifier == null */ {
				String moduleType = getModuleType(ctx);
				if(moduleType.equalsIgnoreCase("FRM")
						|| moduleType.equalsIgnoreCase("BAS")) {
					varProp.addProperty("SCOPE", globalScope);
					varProp.addProperty("PARENT", getCurrentScope());
				}
				else /* CLS */{
					varProp.addProperty("SCOPE", getCurrentScope());
				}
			}
		}		
      varProp.addProperty("NAME", name);
      varProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
      varProp.addProperty("CONTEXT", ctx);

      varProp.addProperty("SYMBOL_TYPE", SymbolType.VARIABLE);

      
      if(varProp.getProperty("SCOPE") == null) {
    	  BicamSystem.printLog("WARNING", "Invalid null Scope in " );
      }
      
      varProp.addProperty("MODULE", getModuleScope().getName());
      Symbol sym = symbolFactory.getSymbol(varProp);
      
      ContextTreeData ctd = st.addCTD(ctx);
      
      ctd.setScope(getCurrentScope());
      ctd.setSymbol(sym);
      ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

      addToWhereUsedCtd(sym,ctd);
      
      st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	private void addToWhereUsedCtd(Symbol sym, ContextTreeData ctd) {
		if(sym == null) {
			return;
		}
		ArrayList<ContextTreeData> whereUsedCdt = new ArrayList<>();
		whereUsedCdt = (ArrayList<ContextTreeData>)sym.getProperty("WHERE_USED_CTD");
		if(whereUsedCdt == null) {
            whereUsedCdt = new ArrayList<>();
			sym.addProperty("WHERE_USED_CTD", whereUsedCdt);
		}
		whereUsedCdt.add(ctd);
	}
	
	
	
	private void tryCreateVariableInPropertyGet(MethodDefStmtContext ctx) {
		if(ctx.methodType().getText().toUpperCase().contains("PROPERTY ")) {
			if(!(ctx.methodType().getText().toUpperCase().contains(" GET"))) return;
		}
		else return;

		PropertyList varGetProp = new PropertyList();
		String name = ctx.Name.getText();

		varGetProp.addProperty("SCOPE", getCurrentScope());
     
		varGetProp.addProperty("NAME", name);
		
		AsTypeClauseContext typeClause = ctx.asTypeClause();
		String dataType  = null;
		
		if(typeClause != null) dataType = typeClause.type().getText();
		else dataType = "Variant";
		
		varGetProp.addProperty("DATA_TYPE", dataType);

		varGetProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
		varGetProp.addProperty("CONTEXT", ctx);

		varGetProp.addProperty("SYMBOL_TYPE", SymbolType.VARIABLE);
		varGetProp.addProperty("MODULE", getModuleScope().getName());


        Symbol sym = symbolFactory.getSymbol(varGetProp);
      
       ContextTreeData ctd = st.getCTD(ctx); // ctd criado em enterMethod
       ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());
       ctd.setScope(getCurrentScope());
       ctd.setSymbol(sym);	
	}
	
	public void enterVariableStmt(VisualBasic6CompUnitParser.VariableStmtContext ctx) {
		if(NodeExplorer.hasAncestorClass(ctx, RealParameterContext.class.getSimpleName())) return;
		if(NodeExplorer.hasAncestorClass(ctx, ReDimStmtContext.class.getSimpleName())) return;

		createVariable(ctx);
	}
	
	@Override
	public void enterDeclareStmt(VisualBasic6CompUnitParser.DeclareStmtContext ctx) {
        PropertyList symDeclProp = new PropertyList();
        symDeclProp.addProperty("NAME", ctx.Name.getText());
        symDeclProp.addProperty("SCOPE", getCurrentScope());
        symDeclProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
        ModifierContext ctxModifier = getMethodModifier(ctx, DeclarationContext.class.getSimpleName());
        if(ctxModifier == null) {
        	symDeclProp.addProperty("SCOPE", st.getGlobalScope());
        }
        else {
            if(ctxModifier.getText().toUpperCase().equalsIgnoreCase("PUBLIC"))
            	symDeclProp.addProperty("SCOPE", st.getGlobalScope());
            else
            	symDeclProp.addProperty("SCOPE", getCurrentScope());
        }
        symDeclProp.addProperty("CONTEXT", ctx);
        symDeclProp.addProperty("SYMBOL_TYPE", SymbolType.FUNCTION);
        symDeclProp.addProperty("MODULE", getModuleScope().getName());

        Symbol sym = symbolFactory.getSymbol(symDeclProp);
        
        ContextTreeData ctd = st.addCTD(ctx);

        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

        addToWhereUsedCtd(sym,ctd);

        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
        
        pushScope((Scope)sym);		
	}
	
	@Override
	public void exitDeclareStmt(VisualBasic6CompUnitParser.DeclareStmtContext ctx) {
		popScope();
	}
	
	@Override 
	public void enterFormDefinitionBlock(VisualBasic6CompUnitParser.FormDefinitionBlockContext ctx) {
        PropertyList symFormProp = new PropertyList();
        
        symFormProp.addProperty("NAME", ctx.Name.getText());
        if(ctx.Type.getText().equalsIgnoreCase("VB.FORM")) {
            symFormProp.addProperty("SCOPE", moduleScope);
            symFormProp.addProperty("SCOPE", globalScope);
            symFormProp.addProperty("DATA_TYPE", "VB.FORM");

        } else {
            symFormProp.addProperty("SCOPE", moduleScope);
            symFormProp.addProperty("PARENT", getCurrentScope());        	
        }

        symFormProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));

        symFormProp.addProperty("CONTEXT", ctx);
        symFormProp.addProperty("SYMBOL_TYPE", SymbolType.GUI);
        symFormProp.addProperty("MODULE", getModuleScope().getName());


        Symbol sym = symbolFactory.getSymbol(symFormProp);

        
        ContextTreeData ctd = st.addCTD(ctx);
        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

        addToWhereUsedCtd(sym,ctd);

        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
        
        pushScope((Scope)sym);
	}
	
	public void exitFormDefinitionBlock(VisualBasic6CompUnitParser.FormDefinitionBlockContext ctx) {
		popScope();
	}
	
	@Override 
	public void enterLabel(VisualBasic6CompUnitParser.LabelContext ctx) {
        PropertyList symLabelProp = new PropertyList();
        
        symLabelProp.addProperty("NAME", ctx.getText().replace(":", ""));
        symLabelProp.addProperty("SCOPE", getCurrentScope());

        symLabelProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));

        symLabelProp.addProperty("CONTEXT", ctx);
        symLabelProp.addProperty("SYMBOL_TYPE", SymbolType.LABEL);
        symLabelProp.addProperty("MODULE", getModuleScope().getName() );


        Symbol sym = symbolFactory.getSymbol(symLabelProp);
        
        ContextTreeData ctd = st.addCTD(ctx);
        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

        addToWhereUsedCtd(sym,ctd);

        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	@Override 
	public void enterGuiProperty(VisualBasic6CompUnitParser.GuiPropertyContext ctx) {
        PropertyList symgGuiPropertyProp = new PropertyList();
        
        symgGuiPropertyProp.addProperty("NAME", ctx.Name.getText());
        symgGuiPropertyProp.addProperty("SCOPE", getCurrentScope());

        symgGuiPropertyProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));

        symgGuiPropertyProp.addProperty("CONTEXT", ctx);
        symgGuiPropertyProp.addProperty("SYMBOL_TYPE", SymbolType.GUI_PROPERTY);
        symgGuiPropertyProp.addProperty("MODULE", getModuleScope().getName());


        Symbol sym = symbolFactory.getSymbol(symgGuiPropertyProp);
        
        ContextTreeData ctd = st.addCTD(ctx);
        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

        addToWhereUsedCtd(sym,ctd);

        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
        
        pushScope((Scope)sym);
	}
	
	public void exitGuiProperty(VisualBasic6CompUnitParser.GuiPropertyContext ctx) {
		popScope();
	}	
	
	public void enterExpr(VisualBasic6CompUnitParser.ExprContext ctx) {
		st.addCTD(ctx);
		st.getCTDMap().get(ctx).setScope(getCurrentScope());

	    st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	public void enterExpression(VisualBasic6CompUnitParser.ExpressionContext ctx) {
		st.addCTD(ctx);
		st.getCTDMap().get(ctx).setScope(getCurrentScope());
	      st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	
	public void enterCondExpression(VisualBasic6CompUnitParser.CondExpressionContext ctx) {
		st.addCTD(ctx);
		st.getCTDMap().get(ctx).setScope(getCurrentScope());
	    st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	public void enterIdentifier(VisualBasic6CompUnitParser.IdentifierContext ctx) {
		st.addCTD(ctx);
		st.getCTDMap().get(ctx).setScope(getCurrentScope());	
	    st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	public void enterGuiAttribute(VisualBasic6CompUnitParser.GuiAttributeContext ctx) {
		PropertyList guiAttrProp = new PropertyList();
		ParserRuleContext ctxLsh = NodeExplorer.getChildClass(ctx, LshAssignContext.class.getSimpleName());
		ParserRuleContext ctxRsh = NodeExplorer.getChildClass(ctx, RshAssignContext.class.getSimpleName());
		
		String name = ctxLsh.getText();
		guiAttrProp.addProperty("SCOPE", getCurrentScope());
      
		guiAttrProp.addProperty("NAME", name);
		guiAttrProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
		guiAttrProp.addProperty("CONTEXT", ctx);

		guiAttrProp.addProperty("SYMBOL_TYPE", SymbolType.GUI_ATTRIBUTE);
		guiAttrProp.addProperty("MODULE", getModuleScope().getName());

        Symbol sym = symbolFactory.getSymbol(guiAttrProp);
        
        //Visual Basic 6 exemplo in Form definition : "Index           =   0"

        if(name.equalsIgnoreCase("Index")) setArrayGuiElemet(getCurrentScope(), ctxRsh.getText());
      
        ContextTreeData ctd = st.addCTD(ctx);
        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);	
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

	      addToWhereUsedCtd(sym,ctd);

        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	@Override 
	public void enterModule(VisualBasic6CompUnitParser.ModuleContext ctx) {
		String fileSimpleName = (String)properties.mustProperty("FILE_PATH");
		module = new ModuleProperty((String)properties.mustProperty("FILE_PATH"));
        String moduleName = module.getName();
//        st.getCompUnitDictionary().put(moduleName, new PropertyList());
//        st.getCompUnitDictionary().get(moduleName).addProperty("FILE_PATH", properties.mustProperty("FILE_PATH"));;
        
        if(moduleName == null) {
        	try {
        		throw new Exception();
        	} catch (Exception e) {
        		BicamSystem.printLog("WARNING", "NULL moduleName: " + (String)properties.mustProperty("FILE_PATH"), e);
        	}
        }

        PropertyList symCompUnitProp = new PropertyList();
        symCompUnitProp.addProperty("NAME", moduleName);

        symCompUnitProp.addProperty("CONTEXT", ctx);
        symCompUnitProp.addProperty("SCOPE", getCurrentScope());
        symCompUnitProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
//        if(module.isClassModule())
//        	symCompUnitProp.addProperty("SYMBOL_TYPE", SymbolType.COMPILATION_UNIT_CLASS);
//        else
//        	symCompUnitProp.addProperty("SYMBOL_TYPE", SymbolType.COMPILATION_UNIT);
        
    	if(fileSimpleName.toUpperCase().endsWith(".FRM")) {
    		symCompUnitProp.addProperty("SYMBOL_TYPE", SymbolType.MODULE_FRM);
    		symCompUnitProp.addProperty("DATA_TYPE", "VB.FORM");
    	} 
    	if(fileSimpleName.toUpperCase().endsWith(".BAS")) {
    		symCompUnitProp.addProperty("SYMBOL_TYPE", SymbolType.MODULE_BAS);} 
    	if(fileSimpleName.toUpperCase().endsWith(".CLS")) {
    		symCompUnitProp.addProperty("SYMBOL_TYPE", SymbolType.MODULE_CLS);} 
    	
//    	if(fileSimpleName.toUpperCase().endsWith(".FRM"))
//    		symCompUnitProp.addProperty("DATA_TYPE", "VB.FORM");
    	
    	symCompUnitProp.addProperty("FILE_PATH", properties.mustProperty("FILE_PATH"));
    	symCompUnitProp.addProperty("MODULE", module.getName());
        
        Symbol sym = symbolFactory.getSymbol(symCompUnitProp);
        
        ContextTreeData ctd = st.addCTD(ctx);
//        ctd.getProperties().addProperty("COMP_UNIT_NAME", moduleName);
      ctd.getProperties().addProperty("MODULE_NAME", moduleName);
      ctd.getProperties().addProperty("OPTION_EXPLICIT", module.isOptionExplicit());

        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

        ctd.setScope(getCurrentScope());
        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());

        moduleScope = (Scope)sym;
        pushScope((Scope)sym);
	}
	
	@Override
	public void exitModule(VisualBasic6CompUnitParser.ModuleContext ctx) {
		PropertyList prop = st.getDictionary().get(module.getName());
		prop.addProperty("DEFSYM", true);
	}
	
	/**
	 * marca scope para utilizar nos módulos de resolução (ref..)
	 */
	@Override 
	public void enterType(VisualBasic6CompUnitParser.TypeContext ctx) {
		st.addCTD(ctx).setScope(getCurrentScope());
	    st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
	}
	
	@Override 
	public void enterMethodDefStmt(VisualBasic6CompUnitParser.MethodDefStmtContext ctx) {
        PropertyList symMethodProp = new PropertyList();
        symMethodProp.addProperty("NAME", ctx.Name.getText());
        symMethodProp.addProperty("SCOPE", getCurrentScope());
        symMethodProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
        ModifierContext ctxModifier = getMethodModifier(ctx, DeclarationContext.class.getSimpleName());
        if(ctxModifier == null) {
        	String moduletype = getModuleType(ctx);
        	if(moduletype.equalsIgnoreCase("FRM") 
        			|| moduletype.equalsIgnoreCase("BAS")) {
        		symMethodProp.addProperty("SCOPE", st.getGlobalScope());
        		symMethodProp.addProperty("PARENT", getCurrentScope());
        	}
        	else {
        		symMethodProp.addProperty("SCOPE", getCurrentScope());
        	}
        }
        else {
            if(ctxModifier.getText().toUpperCase().equalsIgnoreCase("PUBLIC")) {
            	symMethodProp.addProperty("SCOPE", st.getGlobalScope());
        	    symMethodProp.addProperty("PARENT", getCurrentScope());
            }
            else
            	symMethodProp.addProperty("SCOPE", getCurrentScope());
        }
        symMethodProp.addProperty("CONTEXT", ctx);
        symMethodProp.addProperty("SYMBOL_TYPE", SymbolType.METHOD);
        
        symMethodProp.addProperty("MODULE", getModuleScope().getName());


        Symbol sym = symbolFactory.getSymbol(symMethodProp);
        
        ContextTreeData ctd = st.addCTD(ctx);
        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

	      addToWhereUsedCtd(sym,ctd);

        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
        
        pushScope((Scope)sym);
        
        /**
         *  cria variável se method é property get
         */
        tryCreateVariableInPropertyGet(ctx);
	}
	
	@Override 
	public void exitMethodDefStmt(VisualBasic6CompUnitParser.MethodDefStmtContext ctx) {
        popScope();
	}
	
	@Override 
	public void enterTypeDefStmt(VisualBasic6CompUnitParser.TypeDefStmtContext ctx) {
        PropertyList symTypeDefProp = new PropertyList();
        symTypeDefProp.addProperty("NAME", ctx.Name.getText());
        symTypeDefProp.addProperty("SCOPE", getCurrentScope());
        symTypeDefProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
        ModifierContext ctxModifier = getMethodModifier(ctx, DeclarationContext.class.getSimpleName());
        if(ctxModifier == null) {
        	String moduletype = getModuleType(ctx);
        	if(moduletype.equalsIgnoreCase("FRM") 
        			|| moduletype.equalsIgnoreCase("BAS")) {
	        	symTypeDefProp.addProperty("SCOPE", st.getGlobalScope());
	        	symTypeDefProp.addProperty("PARENT", getCurrentScope());
        	}
        	else {
        		symTypeDefProp.addProperty("SCOPE", getCurrentScope());
        	}
        }
        else {
            if(ctxModifier.getText().toUpperCase().equalsIgnoreCase("PUBLIC")) {
            	symTypeDefProp.addProperty("SCOPE", st.getGlobalScope());
	        	symTypeDefProp.addProperty("PARENT", getCurrentScope());
            }
            else
            	symTypeDefProp.addProperty("SCOPE", getCurrentScope());
        }
        symTypeDefProp.addProperty("CONTEXT", ctx);
        symTypeDefProp.addProperty("SYMBOL_TYPE", SymbolType.TYPE);
        
        symTypeDefProp.addProperty("MODULE", getModuleScope().getName());


        Symbol sym = symbolFactory.getSymbol(symTypeDefProp);
        
        ContextTreeData ctd = st.addCTD(ctx);
        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

	      addToWhereUsedCtd(sym,ctd);

        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());
        
        pushScope((Scope)sym);
	}
	
	@Override 
	public void exitTypeDefStmt(VisualBasic6CompUnitParser.TypeDefStmtContext ctx) {	
        popScope();
	}

	@Override 
	public void enterEnumDefStmt(VisualBasic6CompUnitParser.EnumDefStmtContext ctx) {
        PropertyList symTypeDefProp = new PropertyList();
        symTypeDefProp.addProperty("NAME", ctx.Name.getText());
        symTypeDefProp.addProperty("SCOPE", getCurrentScope());
        symTypeDefProp.addProperty("LANGUAGE", st.getProperties().mustProperty("LANGUAGE"));
        ModifierContext ctxModifier = getMethodModifier(ctx, DeclarationContext.class.getSimpleName());
        if(ctxModifier == null) {
        	String moduletype = getModuleType(ctx);
        	if(moduletype.equalsIgnoreCase("FRM") 
        			|| moduletype.equalsIgnoreCase("BAS")) {
	        	symTypeDefProp.addProperty("SCOPE", st.getGlobalScope());
	        	symTypeDefProp.addProperty("PARENT", getCurrentScope());
        	}
        	else {
        		symTypeDefProp.addProperty("SCOPE", getCurrentScope());
        	}
        }
        else {
            if(ctxModifier.getText().toUpperCase().equalsIgnoreCase("PUBLIC"))
            	symTypeDefProp.addProperty("SCOPE", st.getGlobalScope());
            else
            	symTypeDefProp.addProperty("SCOPE", getCurrentScope());
        }
        symTypeDefProp.addProperty("CONTEXT", ctx);
        symTypeDefProp.addProperty("SYMBOL_TYPE", SymbolType.ENUM);
        
        symTypeDefProp.addProperty("MODULE", getModuleScope().getName());


        Symbol sym = symbolFactory.getSymbol(symTypeDefProp);
        
        ContextTreeData ctd = st.addCTD(ctx);
        ctd.setScope(getCurrentScope());
        ctd.setSymbol(sym);
        ctd.getProperties().addProperty("DEFINITION_LINE", ctx.start.getLine());

	      addToWhereUsedCtd(sym,ctd);

        
        st.getCTDMap().get(ctx).getProperties().addProperty("MODULE_NAME",module.getName());

        pushScope((Scope)sym);
	}
	
	@Override 
	public void exitEnumDefStmt(VisualBasic6CompUnitParser.EnumDefStmtContext ctx) {	
        popScope();
	}
	
	private  ModifierContext getVariableModifier(ParserRuleContext ctx, String className) {
		ParserRuleContext context = NodeExplorer.getAncestorClass(ctx, className );
		if(context == null) return null;
		ModifierContext modifierContext = (ModifierContext) NodeExplorer.getChildClass(context, ModifierContext.class.getSimpleName());
		return modifierContext;
	}
	
	private  ModifierContext getMethodModifier(ParserRuleContext ctx, String className) {
		ParserRuleContext context = NodeExplorer.getAncestorClass(ctx, className );
		ModifierContext modifierContext = (ModifierContext) NodeExplorer.getSibling(context, ModifierContext.class.getSimpleName());
		return modifierContext;
	}
	
	private String getModuleType(ParserRuleContext ctx) {
		ParserRuleContext ctxModule = NodeExplorer.getAncestorClass(ctx, ModuleContext.class.getSimpleName());
		if(ctxModule == null) {
			try {
				throw new NullPointerException();
			}catch(NullPointerException e) {
				BicamSystem.printLog("ERROR", "Null context for module.");
			}
		}
		
		ContextTreeData ctd = st.getCTDMap().get(ctxModule);
		String compUnitName = (String)ctd.getProperties().getProperty("MODULE_NAME");
		
		String filePath = (String)st.getDictionary().get(compUnitName).getProperty("FILE_PATH");
		
		String extension = filePath.split("\\.")[filePath.split("\\.").length-1];
		
		return extension;
	}
	
	public static void runDefSymbol(PropertyList Properties) {
		ParseTree astree = (ParseTree)Properties.mustProperty("ASTREE");
		SymbolTableBuilder st = (SymbolTableBuilder)Properties.mustProperty("SYMBOL_TABLE");

		VisualBasic6DefSymCompUnit defVisualBasic6CompUnit = new VisualBasic6DefSymCompUnit(Properties);
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(defVisualBasic6CompUnit, astree);        // walk parse tree 
        
        System.err.println(st.getGlobalScope().toString());		
	}
	
	public  static void main(String[] args) {
		PropertyList props = new PropertyList();
		props.addProperty("FILE_PATH", "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
        System.err.println("Parsing: " + "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
		VisualBasic6ParserCompUnit parseVb6CompUnit = new VisualBasic6ParserCompUnit(props);
		
		SymbolTableBuilder st = new SymbolTableBuilder(new LanguageVb6());
		PropertyList defProp = new PropertyList();
		defProp.addProperty("FILE_PATH", parseVb6CompUnit.getFilePath());
		defProp.addProperty("SYMBOL_TABLE", st);
		defProp.addProperty("ASTREE", parseVb6CompUnit.getAstree());

		VisualBasic6DefSymCompUnit defVisualBasic6CompUnit = new VisualBasic6DefSymCompUnit(defProp);
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(defVisualBasic6CompUnit, parseVb6CompUnit.getAstree());        // walk parse tree 
        
        System.err.println(st.getGlobalScope().toString());	
	}
}