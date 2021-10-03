package br.com.recatalog.parser.visualbasic6;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.regex.Pattern;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;

import br.com.recatalog.core.ContextTreeData;
import br.com.recatalog.core.Scope;
import br.com.recatalog.core.Symbol;
import br.com.recatalog.core.SymbolFactory;
import br.com.recatalog.parser.util.UnResolvedSymbolList;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.AtomContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.AttributeStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.CondExpressionContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.CondRealParameterListContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.ExpressionContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.FormDefinitionBlockContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.IdentifierContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.InstanceOpContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.LshAssignContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.MemberAccessOpContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.RealParameterListContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.TypeContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.VariableStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.WithStmtContext;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.NodeExplorer;
import br.com.recatalog.util.PropertyList;

public class VisualBasic6RefSymCompUnit extends VisualBasic6CompUnitParserBaseListener {
	SymbolTableBuilder st;
	PropertyList properties;
	ParseTree astree;
	SymbolFactory symbolFactory;
	String moduleName;
	Boolean optionExplicit;

	Deque<WithStmtContext> withStack; 
	
	UnResolvedSymbolList unResolvedSymbolList;
	
	public VisualBasic6RefSymCompUnit(PropertyList properties) {
		this.properties = properties;
		this.st = (SymbolTableBuilder) this.properties.mustProperty("SYMBOL_TABLE");
		this.moduleName = (String) this.properties.mustProperty("MODULE_NAME");
		this.optionExplicit = (Boolean) this.properties.mustProperty("OPTION_EXPLICIT");

		this.withStack = new ArrayDeque<WithStmtContext>();
		
		this.unResolvedSymbolList = this.st.getUnResolvedSymbolList().get(moduleName);

	}
	
	private String removeParenTypeIndicator(String id) {
		Pattern p = Pattern.compile("((?i)(?<paren>\\([^)]*\\))|(?<typeIndicator>[@!#$%&]))", Pattern.UNICODE_CHARACTER_CLASS);
		id = p.matcher(id).replaceAll(""); 
		if(id.startsWith("Me.")) id.replaceFirst("Me", moduleName );
		return id;
	}
	
	private String getIdentifierName(ParserRuleContext ctx) {
		String identifierName = ctx.getText();
		if(ctx.getText().startsWith(".")) identifierName = withIdentifier(ctx);
		
		identifierName = removeParenTypeIndicator(identifierName);
		
		if(identifierName.startsWith("Me.")) {
			identifierName = identifierName.replaceFirst("Me", moduleName);
		}
		
		return identifierName;
	}
	
	private String withIdentifier(ParserRuleContext ctx) {
		return withStack.peek().Name.getText() + ctx.getText();
	}	
	
	@Override 
	public void enterWithStmt(VisualBasic6CompUnitParser.WithStmtContext ctx) {
		withStack.push(ctx);
	}
	
	@Override 
	public void exitWithStmt(VisualBasic6CompUnitParser.WithStmtContext ctx) {
		withStack.pop();
	}
	
	@Override
	public void enterExpression(VisualBasic6CompUnitParser.ExpressionContext ctx) {
 /*
  * Desconsidera quando o identificador é para definição
  */
		if(NodeExplorer.getAncestorClass(ctx, AttributeStmtContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getAncestorClass(ctx, FormDefinitionBlockContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getAncestorClass(ctx, VariableStmtContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getAncestorClass(ctx, TypeContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getChildClass(ctx, InstanceOpContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getChildClass(ctx, IdentifierContext.class.getSimpleName()) == null) return;
		
		List<ParserRuleContext> lista  = NodeExplorer.getChildren(ctx);

		for(ParserRuleContext p : lista) {
			if(MemberAccessOpContext.class.isInstance(p) == false 
			&& RealParameterListContext.class.isInstance(p) == false
			&& AtomContext.class.isInstance(p) == false
			) return;
			// É parte de nome composto como em: A.B.C
			if(NodeExplorer.hasSibling(ctx, MemberAccessOpContext.class.getSimpleName())) return;
		
			
/*
 * Comentado Ze porque não mostrava referencias do identificado SqlInit			
 */
			
			if(NodeExplorer.hasSibling(ctx, CondRealParameterListContext.class.getSimpleName())) return;			
			if(NodeExplorer.hasSibling(ctx, RealParameterListContext.class.getSimpleName())) return;
			if(NodeExplorer.hasAncestorClass(ctx, ExpressionContext.class.getSimpleName())) {
				ParserRuleContext ctxParent = NodeExplorer.getAncestorClass(ctx, ExpressionContext.class.getSimpleName());
				if(ctxParent.getText().contains("(") && ctxParent.getText().contains(")")) return;
			}
		}
		
		enterIdentifierExpression(ctx);
	}
	
	@Override
	public void enterCondExpression(VisualBasic6CompUnitParser.CondExpressionContext ctx) {
		if(NodeExplorer.getAncestorClass(ctx, AttributeStmtContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getAncestorClass(ctx, FormDefinitionBlockContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getAncestorClass(ctx, VariableStmtContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getAncestorClass(ctx, TypeContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getChildClass(ctx, InstanceOpContext.class.getSimpleName()) != null) return;
		if(NodeExplorer.getChildClass(ctx, IdentifierContext.class.getSimpleName()) == null) return;
		
		List<ParserRuleContext> lista  = NodeExplorer.getChildren(ctx);

		for(ParserRuleContext p : lista) {
			if(MemberAccessOpContext.class.isInstance(p) == false 
			&& RealParameterListContext.class.isInstance(p) == false
			&& AtomContext.class.isInstance(p) == false
			) return;
			if(NodeExplorer.hasSibling(ctx, MemberAccessOpContext.class.getSimpleName())) return;
/*
 * Comentado Ze porque não mostrava referencias do identificado SqlInit			
 */
				
			if(NodeExplorer.hasSibling(ctx, CondRealParameterListContext.class.getSimpleName())) return;			
			if(NodeExplorer.hasSibling(ctx, RealParameterListContext.class.getSimpleName())) return;	
			if(NodeExplorer.hasAncestorClass(ctx, CondExpressionContext.class.getSimpleName())) {
				ParserRuleContext ctxParent = NodeExplorer.getAncestorClass(ctx, CondExpressionContext.class.getSimpleName());
				if(ctxParent.getText().contains("(") && ctxParent.getText().contains(")")) return;
			}
		}
		
		enterIdentifierExpression(ctx);
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

	private void enterIdentifierExpression(ParserRuleContext ctx) {
		String identifierName = getIdentifierName(ctx);
		
		ContextTreeData ctd = st.getCTD(ctx);
		Scope ctxScope = ctd.getScope();
		st.setWhereUsedCdt(ctd);
		
		PropertyList resolvProp = new PropertyList();
		resolvProp.addProperty("NAME_TO_RESOLVE", identifierName);
		resolvProp.addProperty("CONTEXT", ctx);
		resolvProp.addProperty("MODULE_NAME", moduleName);
		resolvProp.addProperty("OPTION_EXPLICIT", optionExplicit);
		resolvProp.addProperty("SCOPE_TO_RESOLVE", ctxScope);


		if(NodeExplorer.getAncestorClass(ctx, LshAssignContext.class.getSimpleName()) != null) {
			resolvProp.addProperty("INSTANCE_OF", "VARIABLE");
			}
		
		if(NodeExplorer.getSibling(ctx, InstanceOpContext.class.getSimpleName()) != null) {
			resolvProp.addProperty("INSTANCE_OF", "CLASS");
			}
		
		if(identifierName.startsWith("Me.")) {
			resolvProp.addProperty("INSTANCE_OF", "GUI");
			}
		
		Symbol sym = ctxScope.resolve(resolvProp);
		
		if(sym != null) {
			ctd.setSymbol(sym);
			st.setWhereUsedCdt(ctd);
		    addToWhereUsedCtd(sym,ctd);
		}
		else {
			if(unResolvedSymbolList == null) {
				st.getUnResolvedSymbolList()
				.put(moduleName.toUpperCase(), new UnResolvedSymbolList());
				unResolvedSymbolList = st.getUnResolvedSymbolList().get(moduleName.toUpperCase());
			}
			unResolvedSymbolList.addUnResolvedSymbolDetails(ctx.getText(), ctx.start.getLine(), ctx.start.getCharPositionInLine());

			BicamSystem.printLog("WARNING", String.format("Symbol: %s not resolved in line: %d at position: %d "
					, ctx.getText() , ctx.start.getLine(), ctx.start.getCharPositionInLine()));
			}
	}
}
//Execute o teste em SymbolTable.main()
