diag_log text format["%1 %2 %3",__LINE__,__FILE__,diag_ticktime];

_hour = _this select 0; 	//the hour the server is running at

/*
	Put code you need the serevr to run every hour here.
	If this script is still running the server won't run it again the next hour,
	so make sure you spawn any long running loops or execvm your hotfix file.
	Example below:

	[_hour] execVM "servermissionfile\myfix.sqf";
*/


diag_log text format["%1 %2 %3",__LINE__,__FILE__,diag_ticktime];