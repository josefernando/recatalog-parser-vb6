package br.com.recatalog.parser.util;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class UnResolvedSymbolList {

	int unResolvedSymbols;
	
	Map<String, List<RevolvedSymbolLocation>> unResolvedDetails;
	
	public UnResolvedSymbolList() {
		unResolvedDetails = new HashMap<String, List<RevolvedSymbolLocation>>();
	}

	public int getUnResolvedSymbols() {
		return unResolvedSymbols;
	}

	public void setUnResolvedSymbols(int unResolvedSymbols) {
		this.unResolvedSymbols = unResolvedSymbols;
	}
	
	public void addUnResolvedSymbols() {
		this.unResolvedSymbols++;
	}

	public Map<String, List<RevolvedSymbolLocation>> getResolvedDetails() {
		return unResolvedDetails;
	}

	public void setResolvedDetails(Map<String, List<RevolvedSymbolLocation>> resolvedDetails) {
		this.unResolvedDetails = resolvedDetails;
	}
	
	public void addUnResolvedSymbolDetails(String symbolName, int line, int posInLine) {
		List<RevolvedSymbolLocation> rs = unResolvedDetails.get(symbolName.toUpperCase());
		if(rs == null) {
			rs = new LinkedList<RevolvedSymbolLocation>();
			unResolvedDetails.put(symbolName, rs);
		}
		rs.add(new RevolvedSymbolLocation(line,posInLine));
	}
}

class RevolvedSymbolLocation {
	int    line;
	int    positionInLine;
		
	public RevolvedSymbolLocation(int line, int positionInLine) {
		this.line  = line;
		this.positionInLine = positionInLine;
	}
	
	public int getLine() {
		return line;
	}
	
	public void setLine(int line) {
		this.line = line;
	}
	
	public int getPositionInLine() {
		return positionInLine;
	}
	
	public void setPositionInLine(int positionInLine) {
		this.positionInLine = positionInLine;
	}
}