private ["_t","_dt","_var","_pcount","_fps","_epoch","_actualrt","_mt","_accounts","_vehcnt"];

actual_start_time = "gc" callExtension "epoch";
"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Server","ST",actual_start_time];

{call compile format["%1money = 10000; publicvariable ""%1money"";", _x];} forEach robbable;

_SideHQ = createCenter RESISTANCE;
govconvoygroup = createGroup RESISTANCE;
govconvoygroup allowFleeing 0;
boatconvoygroup = createGroup RESISTANCE;
boatconvoygroup allowFleeing 0;
actualconvoygroup = createGroup RESISTANCE;
actualconvoygroup allowFleeing 0;
convoy_handle = [] spawn {};
convoy_time = 0;
boatconvoy_handle = [] spawn {};
boatconvoy_time = 0;
actualconvoy_handle = [] spawn {};
actualconvoy_time = 0;

lastraidcount = 0;

one_stamp =  0;
seconds = 0;
minutes = 0;
hours = 0;
onEachFrame {
	_t = diag_ticktime;
	_dt = _t - one_stamp;
	if (_dt >= 1) then {
		one_stamp = _t;
		seconds = seconds + 1;
		if (seconds % 3 == 0) then {call GC_mateAnimals;};
		if (seconds % 5 == 0) then {call GC_cleanVehicles;};
		if (seconds % 7 == 0) then {
			//{((_x select 1) nearestObject (_x select 0)) setdammage 0;} foreach poles; //auto-repair light poles on bank rd
			call GC_lowerGates;
		};
		if (seconds % 30 == 0) then {
			call GC_updateRobMoney;
			//call GC_cleanRaids;
		};
		if (seconds % 60 == 0) then {
			minutes = minutes + 1;
			seconds = 0;
			call GC_cleanObjects;
			call GC_cleanJail;
			if (minutes % 2 == 0) then {
				call GC_cleanNarcs;
				//call GC_cleanTaxiNPCs;
			};
			if (minutes % 3 == 0) then {
				call GC_writeObjects;
				call GC_killAnimals;
			};

			if (minutes % 4 == 0) then {
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

			if (minutes % 5 == 0) then {
				call GC_cleanGroups;
				//call GC_deleteRestricted;
			};
			if (minutes % 7 == 0) then {call GC_deleteDead;};
			if (minutes % 20 == 0) then {"if (!isServer) then {[] spawn BANK_zinsen;};" call broadcast;};
			if (minutes % 28 == 0) then {'if (!isServer) then {playsound "convoy1sfx";["GC_Convoy",["CHAOS LIFE POLICE PAYROLL","The money truck will leave in a couple minutes."]] spawn bis_fnc_showNotification;};' call broadcast;};
			if (minutes % 30 == 0) then {
				if (scriptDone convoy_handle) then { convoy_handle = [] spawn GC_runMoneyTruck; convoy_time = _t;};
			};
			if (minutes % 42 == 0) then {'if (!isServer) then {playsound "convoy1sfx";["GC_BoatConvoy",["CHAOS LIFE PRISONER TRANSPORT","The Government boat will leave in a couple minutes."]] spawn bis_fnc_showNotification;};' call broadcast;};
			if (minutes % 45 == 0) then {
				if (scriptDone boatconvoy_handle) then { boatconvoy_handle = [] spawn GC_runInmateTransport; boatconvoy_time = _t;};
			};			
			if (minutes % 60 == 0) then {
				hours = hours + 1;
				minutes = 0;
				call GC_deleteVehicles;
				//if (scriptDone actualconvoy_handle) then { actualconvoy_handle = [] spawn GC_runConvoy; actualconvoy_time = _t;};
				//if (hours % 3 == 0) then {call GC_dumpAccounts;};
			};
		};
	};
};
