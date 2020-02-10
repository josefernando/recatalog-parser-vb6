package br.com.recatalog.parser.visualbasic6;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashSet;
import java.util.Set;

import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.EnumDefStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.FormalParameterContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.ReDimStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.RealParameterContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.TypeDefStmtContext;
import br.com.recatalog.parser.visualbasic6.VisualBasic6CompUnitParser.VariableStmtContext;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.NodeExplorer;
import br.com.recatalog.util.ParserInventory;

public class VB6InventoryCompUnit extends VisualBasic6CompUnitParserBaseListener {
	ParserInventory inventory;
	StringBuffer exception;
	final String   ASSIGNMENT = "ASSIGNMENT";

	final String   DEFMETHOD_SUB = "DEFMETHOD_SUB";
	final String   DEFMETHOD_FUNCTION = "DEFMETHOD_FUNCTION";
	final String   DEFMETHOD_PROPERTY_GET = "DEFMETHOD_PROPERTY_GET";
	final String   DEFMETHOD_PROPERTY_SET = "DEFMETHOD_PROPERTY_SET";
	final String   DEFMETHOD_PROPERTY_LET = "DEFMETHOD_PROPERTY_LET";


	final String   RUNTIME_DEPENDENCY_OBJECT = "RUNTIME_DEPENDENCY_OBJECT";
	final String   FORM = "FORM";
	final String   FORMAL_PARAMETER = "FORMAL_PARAMETER";
	
	final String   OPTION = "OPTION";
	final String   DECLARE = "DECLARE";
	final String   TYPE = "TYPE";
	final String   ENUM = "ENUM";
	final String   EVENT = "EVENT";
	
	final String   TYPE_FIELD = "TYPE_FIELD";
	final String   ENUM_VALUE = "ENUM_VALUE";

	final String   DEFVAR = "DEFVAR";
	final String   ATTRIBUTE = "ATTRIBUTE";

//	final String   IMPLICIT_CALL = "IMPLICIT_CALL"; // cuidado com method call de forms
	final String   COMMAND = "COMMAND";
	
	Set<String> commands;
	
	final String[] typeIndicators = {"!", "@", "#", "$", "%", "&"};

	public VB6InventoryCompUnit() {
		exception = new StringBuffer();
		inventory = new ParserInventory();
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
//		   commands.add("MID"); É FUNÇÃO E NÃO COMMAND
		   commands.add("MKDIR");
		   commands.add("NAME");
		   commands.add("ON");
		   commands.add("OPEN");
//		   commands.add("OPTION");
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
	
	public ParserInventory getInventory() {
		return inventory;
	}
	
	public StringBuffer getException() {
		return exception;
	}
	
	public void enterRunTimeDependencyName(VisualBasic6CompUnitParser.RunTimeDependencyNameContext ctx) {
		inventory.add(ctx.getText().replace("\"",""), RUNTIME_DEPENDENCY_OBJECT);
	}
	
	public void enterFormDefinitionBlock(VisualBasic6CompUnitParser.FormDefinitionBlockContext ctx) {
		if(!(ctx.Type.getText().toUpperCase().contains(".FORM"))) return;
		inventory.add(ctx.Name.getText(), FORM);
	}
	
	public void enterDeclareStmt(VisualBasic6CompUnitParser.DeclareStmtContext ctx) {
		inventory.add(ctx.Name.start.getText(), DECLARE);
	}
	
	
	public void enterTypeDefStmt(VisualBasic6CompUnitParser.TypeDefStmtContext ctx) {
		inventory.add(ctx.Name.start.getText(), TYPE);
	}
	
	public void enterEnumDefStmt(VisualBasic6CompUnitParser.EnumDefStmtContext ctx) {
		inventory.add(ctx.Name.start.getText(), ENUM);
	}
	
	public void enterEventDefStmt(VisualBasic6CompUnitParser.EventDefStmtContext ctx) {
		inventory.add(ctx.Name.start.getText(), EVENT);
	}
	
	public void enterOptionStmt(VisualBasic6CompUnitParser.OptionStmtContext ctx) {
		inventory.add(ctx.optionClause().start.getText(), OPTION);
	}
	
	public void enterMethodDefStmt(VisualBasic6CompUnitParser.MethodDefStmtContext ctx) {
		if(ctx.Type.start.getText().equalsIgnoreCase("SUB")) {
			inventory.add(ctx.Name.getText(), DEFMETHOD_SUB);
		}
		else 
		if(ctx.Type.start.getText().equalsIgnoreCase("FUNCTION")) {
			inventory.add(ctx.Name.getText(), DEFMETHOD_FUNCTION);
		}
		else
			if(ctx.Type.start.getText().split(" ")[0].equalsIgnoreCase("PROPERTY")) {
				if(ctx.Type.start.getText().split(" ")[1].equalsIgnoreCase("GET")) {
					inventory.add(ctx.Name.getText(), DEFMETHOD_PROPERTY_GET);
				}
				if(ctx.Type.start.getText().split(" ")[1].equalsIgnoreCase("LET")) {
					inventory.add(ctx.Name.getText(), DEFMETHOD_PROPERTY_LET);
				}
				if(ctx.Type.start.getText().split(" ")[1].equalsIgnoreCase("SET")) {
					inventory.add(ctx.Name.getText(), DEFMETHOD_PROPERTY_SET);
				}
		}
		else {
			BicamSystem.printLog("WARNING", ctx.Type.start.getText());
		}
	}
	
	private void enterTypeField(VisualBasic6CompUnitParser.VariableStmtContext ctx) {
		String name = ctx.Name.getText();
		
		inventory.add(name, TYPE_FIELD);		
	}
	
	private void enterEnumValue(VisualBasic6CompUnitParser.VariableStmtContext ctx) {
		String name = ctx.Name.getText();
		
		inventory.add(name, ENUM_VALUE);		
	}
	
	public void enterVariableStmt(VisualBasic6CompUnitParser.VariableStmtContext ctx) {
		if(NodeExplorer.hasAncestorClass(ctx, FormalParameterContext.class.getSimpleName())) return;
		if(NodeExplorer.hasAncestorClass(ctx, RealParameterContext.class.getSimpleName())) return;
		if(NodeExplorer.hasAncestorClass(ctx, ReDimStmtContext.class.getSimpleName())) return;
		if(NodeExplorer.hasAncestorClass(ctx, TypeDefStmtContext.class.getSimpleName())) {
			enterTypeField(ctx);
			return;
		}
		if(NodeExplorer.hasAncestorClass(ctx, EnumDefStmtContext.class.getSimpleName())) {
			enterEnumValue(ctx);
			return;
		}

		String name = ctx.Name.getText();
		
		for(String tp : typeIndicators) {
			if(name.endsWith(tp)) name= name.replace(tp,"");
		}
		
		inventory.add(name, DEFVAR);
	}
	
	public void enterFormalParameter(VisualBasic6CompUnitParser.FormalParameterContext ctx) {
		try {
		VariableStmtContext varCtx = (VariableStmtContext) NodeExplorer.getChildClass(ctx, VariableStmtContext.class.getSimpleName());
		String name = varCtx.Name.getText();
		name = name.replaceAll("[!@#$%&]", "");
		inventory.add(name, FORMAL_PARAMETER);
		} catch(Exception e) {
			StringWriter exceptionStackError = new StringWriter();
			e.printStackTrace(new PrintWriter(exceptionStackError));
			exception.append(exceptionStackError.toString());

		}
	}
	
	/**
	 * ctx.start.getText().split(" ")[0]
	 * 
	 * Trata casos como "Exit Sub" onde lexer é "EXIT_SUB", 
	 * então ctx.start.getText() = "Exit Sub" e não "Exit". 
	 * Neste caso
	 */
	public void enterCommandStmt(VisualBasic6CompUnitParser.CommandStmtContext ctx) {
		for(String command : commands) {
			String cmd = ctx.start.getText().split(" ")[0];
			if(cmd.equalsIgnoreCase(command)) {
//				if(cmd.equalsIgnoreCase("SET")) 
//					System.err.println(ctx.start.getLine());
				inventory.add(cmd, COMMAND);
			}
		}
//		inventory.add(ctx.start.getText(), COMMAND);
	}
	
//	public void enterAssignmentStmt(VisualBasic6CompUnitParser.AssignmentStmtContext ctx) {
//		if(!(NodeExplorer.hasAncestorClass(ctx, AttributeStmtContext.class.getSimpleName()))) return;
//		ParserRuleContext att = (ParserRuleContext) NodeExplorer.getFirstChildClass(ctx, LshAssignContext.class.getSimpleName());
//		
//		inventory.add(att.getText(), ATTRIBUTE);
//	}
	
	public void enterAttributeStmt(VisualBasic6CompUnitParser.AttributeStmtContext ctx) {
//		if(!(NodeExplorer.hasAncestorClass(ctx, AttributeStmtContext.class.getSimpleName()))) return;
//		ParserRuleContext att = (ParserRuleContext) NodeExplorer.getFirstChildClass(ctx, LshAssignContext.class.getSimpleName());
		
		inventory.add(ctx.Name.getText(), ATTRIBUTE);
	}
	
//	public static void unitTest(String filePath) {
//		File f = null;
//		try {
//			f = BicamSystem.toFileUTF8(filePath);
//		} catch (IOException e1) {
//			e1.printStackTrace();
//		}
//		
//		System.err.println(f.getAbsolutePath());
//		
//		URI uri = f.toURI();
//		URL url = null;
//		try {
//			url = uri.toURL();
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		}
//
//		PropertyList props = new PropertyList();
//		props.addProperty("URL", url);
//		props.addProperty("FILE_NAME", f.getAbsolutePath());
//
//		props = RunVisualBasic6CompUnitParser.parse(props);	
//		
//		ParseTree tree = (ParseTree) props.getProperty("TREE");
//        ParseTreeWalker walker = new ParseTreeWalker();
//        
//        VisualBasic6InventoryCompUnit visualBasic6InventoryCompUnit = new VisualBasic6InventoryCompUnit();
//        walker.walk(visualBasic6InventoryCompUnit, tree);        // walk parse tree 
//        
//        
//        if(visualBasic6InventoryCompUnit.getException() != null) {
//        	System.err.println(visualBasic6InventoryCompUnit.getException());
//        }
//        
//  	     ParserRegexVisualBasic6 parseRegex = new ParserRegexVisualBasic6(f );
//  	     boolean ok = visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory());
//  	     if(!ok) {
//             visualBasic6InventoryCompUnit.getInventory().print();
//             parseRegex.getInventory().print();
//  	     }
//  	     
//  	     System.err.println(visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory()));		
//	}
	
	
	public static void main(String[] args) {
		System.err.println("---------------------------------------------------------");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB002.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB003.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB004.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB005.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB006.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB007.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB008.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB009.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB010.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB011.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB012.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB013.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB014.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB015.FRM");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB016.FRM");
//		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GECOEX01.CLS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GECOMS01.CLS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMGVK01.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOAJU1.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOAMB1.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOCOR1.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOEX01.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOMB01.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOSY01.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOTXT1.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOVR01.BAS");
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMVBAPI.BAS");	
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\PEGFNZ01.CLS");		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\RXGCMG01.BAS");		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\WNGWN005.BAS");		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB001.BAS");		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB002.BAS");		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB003.BAS");		
//		unitTest("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB004.BAS");
//
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqDetalhe.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqHeader.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqRetorno.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqTrailer.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_ArqTrailerLote.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Detalhe.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_DetalheRetorno.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_GerArquivo.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Header.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_HeaderLote.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Ocorrencia.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_OcorrenciaDetalhe.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_SegmentoA.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_SegmentoB.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/Class_Trailler.cls");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmAlterAltVolAgdCco.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmCaminhoWs.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmConsDocTed.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/frmExclusaoAltVolAgdCco.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAcompFilaR1R2.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAjuda.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAlteraDataCorteOPCrp.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlAlteraTipoCredito.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLCadParametrosMcliq.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlCancelaEmiAltoVolume.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlCargaDemandaJudicialExcel.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlCargaPagamentoExcel.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLCodigosMcLiq.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlComplementaPlanilha.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLConsAssociarOpe.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsDepositoJudicial.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsDevMais10Dias.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsIntegMLCCOper.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsLogRoboCredArq.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsMonitEnvRecFunc.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsNroCtrSPB.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsReversaoOPs.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlConsultaClientes.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlControlSdoLoja.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDepositoJudicial.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDesmembraDOCsAltoVolume.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDetalhamentoLiq.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlDevolucoesPendCreArq.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlEstornoOPCrp.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlExtrativaDIMOF.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF000.bas");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF00001.BAS");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF002.BAS");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF003.BAS");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF005.BAS");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF008.BAS");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF010.BAS");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF012.BAS");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlf014.bas");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF016.bas");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF017.bas");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF018.bas");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLF019.bas");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlGerArquivoCreditoBco.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlIntegraBoletoBMG.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutAgdCco.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLManutEmailNotifica.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutFinalidadesLiq.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutFinProOL.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlManutOpEspec.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlMotCancelOper.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlMotivosDevolucao.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlOLAgendamentos.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLParametrosSistema.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlParmCredPorArquivo.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlSolicAutomReenviosOP.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlSolicCreditoArq.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv000.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv001.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV002.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0031.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV004.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0041.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV005.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV006.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV008.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV009.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV010.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV011.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV012.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV013.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV014.FRM");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV015.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0151.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV0152.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV016.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV017.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV018.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV019.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV020.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv021.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV022.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv023.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv024.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV025.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv026.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv027.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv028.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV029.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV030.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV031.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV032.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV033.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV034.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV035.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv036.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV037.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/MLV038.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv039.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv040.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv041.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv042.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv043.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv044.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv045.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv046.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv047.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv048.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv049.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv050.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv051.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv052.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv053.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv053a.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv054.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv055.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv056.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv057.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv058.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv059.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv060.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv061.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv062.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv063.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv064.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv065.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv066.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv067.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv068.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv069.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv070.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv071.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv072.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv073.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv074.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv075.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv076.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv077.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv078.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv079.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv080.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv081.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv082.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv083.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv084.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv085.frm");
//		unitTest("C:/workspace/arcatalog/vb6/antlr4/input/projMarie/mlv086.frm");
		
//		unitTest("C:\\Download\\Fontes\\VB\\Boleto-VB6-master\\Boleto-VB6-master\\Form1.frm");
//		unitTest("C:\\Download\\Fontes\\VB\\Boleto-VB6-master\\Boleto-VB6-master\\Form2.frm");
//		unitTest("C:\\Download\\Fontes\\VB\\Boleto-VB6-master\\Boleto-VB6-master\\Form3.frm");
//		unitTest("C:\\Download\\Fontes\\VB\\Boleto-VB6-master\\Boleto-VB6-master\\Form4.frm");

		
		
//		File f = null;
//		try {
//			f = BicamSystem.toFileUTF8("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB002.FRM");
//		} catch (IOException e1) {
//			e1.printStackTrace();
//		}
//		
//		System.err.println(f.getAbsolutePath());
//		
//		URI uri = f.toURI();
//		URL url = null;
//		try {
//			url = uri.toURL();
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		}
//
//		PropertyList props = new PropertyList();
//		props.addProperty("URL", url);
//		props.addProperty("FILE_NAME", f.getAbsolutePath());
//
//		props = RunVisualBasic6CompUnitParser.parse(props);	
//
//		
//		ParseTree tree = (ParseTree) props.getProperty("TREE");
//        ParseTreeWalker walker = new ParseTreeWalker();
//        
//        VisualBasic6InventoryCompUnit visualBasic6InventoryCompUnit = new VisualBasic6InventoryCompUnit();
//        walker.walk(visualBasic6InventoryCompUnit, tree);        // walk parse tree 
//        
//        
//        if(visualBasic6InventoryCompUnit.getException() != null) {
//        	System.err.println(visualBasic6InventoryCompUnit.getException());
//        }
//        
//        
//  	     ParserRegexVisualBasic6 parseRegex = new ParserRegexVisualBasic6(f );
//  	     boolean ok = visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory());
//  	     if(!ok) {
//             visualBasic6InventoryCompUnit.getInventory().print();
//             parseRegex.getInventory().print();
//  	     }
//  	     
//  	     System.err.println(visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory()));
	}
	
	public static int indexOfDifference(String str1, String str2) {
	      if (str1 == str2) {
	          return -1;
	      }
	      if (str1 == null || str2 == null) {
	          return 0;
	      }
	      int i;
	      for (i = 0; i < str1.length() && i < str2.length(); ++i) {
	          if (str1.charAt(i) != str2.charAt(i)) {
	              break;
	          }
	      }
	      if (i < str2.length() || i < str1.length()) {
	          return i;
	      }
	      return -1;
	  }
}