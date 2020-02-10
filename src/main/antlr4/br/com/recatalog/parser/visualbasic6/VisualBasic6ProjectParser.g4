parser grammar VisualBasic6ProjectParser;

// CONSIDERATONS
//======================MAP CONTROL VB6 to .Net =============================
// MAP Control            	To .Net
// Threed.SSCommand							System.Windows.Forms.Button
// Threed.Constants_ButtonStyle				System.Windows.Forms.FlatStyle
// Threed.SSFrame							System.Windows.Forms.GroupBox
// Threed.SSPanel							System.Windows.Forms.Panel
// Threed.SSCheck							System.Windows.Forms.CheckBox
// Threed.SSOption							System.Windows.Forms.RadioButton
// Threed.Constants_Alignment				System.Drawing.ContentAlignment
// Threed.Constants_PictureBackgroundStyle	System.Windows.Forms.ImageLayout
// Threed.Constants_Bevel					System.Windows.Forms.BorderStyle
// Threed.Constants_MousePointer			System.Windows.Forms.Cursor
// Threed.Constants_CheckBoxValue			System.Windows.Forms.CheckState
//=============================================================================
/*
============================== VB5 Activex Controls =========================
AniBtn32.ocx
Gauge32.ocx
Graph32.ocx
Gsw32.EXE
Gswdll32.DLL
Grid32.ocx
KeySta32.ocx
MSOutl32.ocx
Spin32.ocx
Threed32.ocx
MSChart.ocx
==============================================================================
*/
/*
===== Herança da linguagem BASIC - Variáveis terminadas com os seguintes caracteres
===== não tem qualquer significado em VB ou VB.Net
      %                 Integer
      &                 Long
      !                 Single
      #                 Double
      $                 String
      @                 Currency
=============================================================================
*/
/* ============= VBP File - References Vs Objects
Objects are for ActiveX controls which are usually compiled to .ocx files.
References are for type libraries usually compiled to .dll files or .tlb files.
Notice that .ocx files contain typelib too so this is very inconsistent and pretty much a legacy division.

Paths and filenames are optional, typelib IDs are canonical way to resolve dependency.
Only if these are not found in registry there is a auto-resolve strategy searching
for files in current folder for .ocxes only. 
This most annoying behavior happens at run-time too when the applications starts 
to auto-registering .ocxes in current folder if typelibs are not found and often 
fails on modern OSes for lack of permissions to write in HKLM.

There are Object lines in .frm/.ctl source files too. These get appended to 
current project if adding existing form/usercontrol.

If an .ocx typelib is added as Reference line the IDE usually fails to load the project 
and a manual edit is needed.
*/
/*
ScaleMode 	Meaning 
0 	User-defined. 
1 	Twips - 1440 per inch. 
2 	Points - 72 per inch. 
3 	Pixels - number per inch depends on monitor. 
4 	Characters - character = 1/6 inch high and 1/12 inch wide. 
5 	Inches. 
6 	Millimeters. 
7 	Centimeters.
*/

options {tokenVocab=VisualBasic6ProjectLexer;}

@parser::header {
//  package br.com.recatalog.parser.visualbasic6; 
  import  br.com.recatalog.util.Watch;
  import  java.util.HashMap;
}

@parser::members {
   Watch elapsedTime = new Watch();
   double timeElapsedSinceLastStatement = 0;
}

startRule : module EOF;

module : 
	 (propertySection | property)+
;

propertySection :
section property+
;

section:
	Name=PROPERTY_SECTION
;

// AutoRefresh=1
property :
 key value
;

key : PROPERTY_KEY;

value : PROPERTY_VALUE;