//
// PlanAhead(TM)
// rundef.js: a PlanAhead-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "D:/ISE/14.7/ISE_DS/EDK/bin/nt64;D:/ISE/14.7/ISE_DS/EDK/lib/nt64;D:/ISE/14.7/ISE_DS/ISE/bin/nt64;D:/ISE/14.7/ISE_DS/ISE/lib/nt64;D:/ISE/14.7/ISE_DS/common/bin/nt64;D:/ISE/14.7/ISE_DS/common/lib/nt64;D:/ISE/14.7/ISE_DS/PlanAhead/bin;";
} else {
  PathVal = "D:/ISE/14.7/ISE_DS/EDK/bin/nt64;D:/ISE/14.7/ISE_DS/EDK/lib/nt64;D:/ISE/14.7/ISE_DS/ISE/bin/nt64;D:/ISE/14.7/ISE_DS/ISE/lib/nt64;D:/ISE/14.7/ISE_DS/common/bin/nt64;D:/ISE/14.7/ISE_DS/common/lib/nt64;D:/ISE/14.7/ISE_DS/PlanAhead/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "ngdbuild",
         "-intstyle ise -p xc7vx485tffg1157-2L -dd _ngo -uc \"variant_23.ucf\" \"variant_23.edf\"" );
ISEStep( "map",
         "-intstyle pa -w \"variant_23.ngd\"" );
ISEStep( "par",
         "-intstyle pa \"variant_23.ncd\" -w \"variant_23_routed.ncd\"" );
ISEStep( "trce",
         "-intstyle ise -o \"variant_23.twr\" -v 30 -l 30 \"variant_23_routed.ncd\" \"variant_23.pcf\"" );
ISEStep( "xdl",
         "-secure -ncd2xdl -nopips \"variant_23_routed.ncd\" \"variant_23_routed.xdl\"" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
