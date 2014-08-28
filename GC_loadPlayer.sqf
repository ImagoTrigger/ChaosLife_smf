{
	_loaded = _x getvariable "loaded";
	_deadname = _x getvariable "deadname";
	if (!isnil "_deadname") then {
		if (alive _x and isnil "_loaded" and name _x == _deadname) then {
			_x setvariable["loaded",true,false];
			[_x] call GC_preloadStats;
			//call compile format['[[[46, 1200, 1002, 1001, 1000],"gc\client\GC_FNC_HUD_Beta.sqf"],"BIS_fnc_execVM",%1,false] spawn BIS_fnc_MP;',owner _x];		

		};
	};
} foreach playableunits;