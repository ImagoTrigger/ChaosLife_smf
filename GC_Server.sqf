private ["_loopcount"];
_loopcount = 1;
while {_loopcount <= 1800} do {
	call GC_loadPlayer;
	_loopcount = _loopcount + 1;
	sleep 4;
	if (_loopcount % 60 == 1) then {
		//record player count & fps
		_pcount = {_var = _x getvariable "deadname"; (!isnil "_var" and isPlayer _x)} count allunits;
		_fps = round(diag_fps);
		_epoch = parseNumber("gc" callExtension "epoch");
		_actualrt = round((_epoch - parseNumber(actual_start_time)) / 60);
		_mt = round(time / 60);
		_accounts = (count ServerKontoArray);
		_vehcnt = (count INV_ServerVclArray);
		//format['if (!isServer) then {[1,%1,%2] call GC_displayReport;};',[_actualrt,_mt,_pcount],[_accounts,_vehcnt,_fps]] call broadcast;
		diag_log text format["!!! Actual runtime: %1 - Mission runtime: %2 - Player count: %3 - Accounts count: %4 - Vehicles count: %5 - Average FPS %6 @ %7",_actualrt,_mt,_pcount,_accounts,_vehcnt,_fps,round(diag_ticktime / 60)];
	};
};
diag_log text format["flushing %1",__FILE__];
call GC_dumpAccounts;
execVM "servermissionfile\GC_Server.sqf";