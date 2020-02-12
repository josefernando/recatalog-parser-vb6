package br.com.recatalog.parser.visualbasic6;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;

import br.com.recatalog.core.ContextTreeData;
import br.com.recatalog.core.Scope;
import br.com.recatalog.core.Symbol;
import br.com.recatalog.core.SymbolFactory;
import br.com.recatalog.core.Type;
import br.com.recatalog.parser.util.UnResolvedSymbolList;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.MethodDefStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.VariableStmtContext;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.NodeExplorer;
import br.com.recatalog.util.PropertyList;

public class VisualBasic6RefTypeSymCompUnit extends VisualBasic6CompUnitParserBaseListener {
	SymbolTableBuilder st;
	PropertyList properties;
	ParseTree astree;
	SymbolFactory symbolFactory;
	String moduleName;
	
	UnResolvedSymbolList unResolvedSymbolList;
	
	public VisualBasic6RefTypeSymCompUnit(PropertyList properties) {
		this.properties = properties;
		this.st = (SymbolTableBuilder) this.properties.mustProperty("SYMBOL_TABLE");
		this.moduleName = (String) this.properties.mustProperty("MODULE_NAME");
//		this.unResolvedSymbolList = this.st.getUnResolvedSymbolList().get(moduleName);
	}
	
	private void setTypeToVariableSymbol(Symbol symType, ParserRuleContext ctx) {
		ParserRuleContext ctxPrc = NodeExplorer.getAncestorClass(ctx, VariableStmtContext.class.getSimpleName());
		if(ctxPrc == null) {
			ctxPrc = NodeExplorer.getAncestorClass(ctx, MethodDefStmtContext.class.getSimpleName());
			return;
		}
		ContextTreeData ctd = st.getCTD(ctxPrc);
		if(ctd == null) {
//			if(symType.getProperties().hasProperty("DEF_MODE", "BUILTIN")) return;
//			try {
//				throw new Exception();
//			}catch(Exception e) {
//				BicamSystem.printLog("WARNING", String.format("NULL ContextTreeData Variable in line: %d", ctx.start.getLine()), e);
//				return;
//			}
			return;
		}
		Symbol symVar = ctd.getSymbol();
		if(symVar == null) {
			try {
				throw new Exception();
			}catch(Exception e) {
				
				if(unResolvedSymbolList == null) {
					st.getUnResolvedSymbolList()
					.put(moduleName.toUpperCase(), new UnResolvedSymbolList());
					unResolvedSymbolList = st.getUnResolvedSymbolList().get(moduleName.toUpperCase());
				}
				unResolvedSymbolList.addUnResolvedSymbolDetails(ctx.getText(), ctx.start.getLine(), ctx.start.getCharPositionInLine());

				BicamSystem.printLog("WARNING"
						, String.format("Null symbol in ctd in line: %s", ctx.start.getLine()));
				return;
			}
		}
		symVar.setType((Type)symType);
	}
	
	@Override
	public void enterModule(VisualBasic6CompUnitParser.ModuleContext ctx) {
		ContextTreeData ctd = st.getCTD(ctx);
		Scope ctxScope = ctd.getScope();
		Symbol ctxSym =  ctd.getSymbol();
		String dataType = (String)ctxSym.getProperty("DATA_TYPE");

		if(dataType != null) {
			PropertyList resolvProp = new PropertyList();
			resolvProp.addProperty("NAME_TO_RESOLVE", dataType);
			resolvProp.addProperty("CONTEXT", ctx);
			
			Symbol symType = ctxScope.resolve(resolvProp);
			if(symType != null) {
				ctd.setSymbol(symType);
				ctxSym.setType((Type)symType);
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

	@Override 
	public void enterFormDefinitionBlock(VisualBasic6CompUnitParser.FormDefinitionBlockContext ctx) {
		ContextTreeData ctd = st.getCTD(ctx);
		Scope ctxScope = ctd.getScope();
		Symbol ctxSym =  ctd.getSymbol();
		String dataType = (String)ctxSym.getProperty("DATA_TYPE");
		if(dataType != null) {
			PropertyList resolvProp = new PropertyList();
			resolvProp.addProperty("NAME_TO_RESOLVE", dataType);
			resolvProp.addProperty("CONTEXT", ctx);
			
			Symbol symType = ctxScope.resolve(resolvProp);
			if(symType != null) {
				ctd.setSymbol(symType);
				ctxSym.setType((Type)symType);
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
	
	@Override 
	public void enterType(VisualBasic6CompUnitParser.TypeContext ctx) {
		ContextTreeData ctd = st.getCTD(ctx);
		Scope ctxScope = ctd.getScope();
		
		String debugName = ctx.getText(); // debug only
		
		PropertyList resolvProp = new PropertyList();
		resolvProp.addProperty("NAME_TO_RESOLVE", ctx.getText());
		resolvProp.addProperty("INSTANCE_OF", "TYPE");
		resolvProp.addProperty("CONTEXT", ctx);
		
		Symbol symType = ctxScope.resolve(resolvProp);
		if(symType != null) {
			ctd.setSymbol(symType);
			setTypeToVariableSymbol(symType,ctx);
		}
		else {
//			sts.addResolvedDetails(ctx.getText(), ctx.start.getLine(), ctx.start.getCharPositionInLine());
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

// Execute o teste em SymbolTable.main()





