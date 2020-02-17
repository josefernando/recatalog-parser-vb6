package br.com.recatalog.parser.visualbasic6;

import br.com.recatalog.util.ParserInventory;

public class VB6InventoryProject extends VisualBasic6ProjectParserBaseListener {
	ParserInventory inventory;
	StringBuffer exception;

	public VB6InventoryProject() {
		exception = new StringBuffer();
		inventory = new ParserInventory();
	}
	
	public ParserInventory getInventory() {
		return inventory;
	}
	
	public StringBuffer getException() {
		return exception;
	}
	
	@Override 
	public void enterProperty(VisualBasic6ProjectParser.PropertyContext ctx) {
		inventory.add(ctx.value().getText().substring(1), ctx.key().getText().toUpperCase());
	}
}
