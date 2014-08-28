diag_log text format ["starting %1 at %2",__FILE__,time];

_added = false;
_sidewon = "Neither";
_counter = 0;
_counter2 = 0;

//Gets position to spawn
_array  = [[VIPspawn1, 10], [VIPspawn2, 10], [VIPspawn3, 10], [VIPspawn4, 10], [VIPspawn5, 10]];
_spawn   = (floor(random(count _array)));
_pos    = (_array select _spawn) select 0;
_radius = (_array select _spawn) select 1;

// spawn markers truck and soldiers
_markerobj = createMarker ["convoy",[0,0]];
_markername = "convoy";
_markerobj setMarkerShape "ICON";
"convoy" setMarkerType "mil_marker";
"convoy" setMarkerColor "ColorRed";
"convoy" setMarkerText "Money Truck";

convoy_marker_active = 1;
convoyhascash=true; publicvariable "convoyhascash";

convoytruck = "B_Truck_01_covered_F" createVehicle getPos _pos;

convoytruck setVehicleVarName "convoytruck";
convoytruck setAmmoCargo 0;
clearweaponcargoglobal convoytruck;
clearmagazinecargoglobal convoytruck;
clearitemcargoglobal convoytruck;

publicvariable "convoytruck";
convoytruck setDir (getDir _pos);

convoytruck setVehicleLock "unlocked";
convoytruck lock 0;

convoysoldier = govconvoygroup createUnit ["I_Soldier_TL_F", _pos, [], _radius, "FORM"];
convoysoldier setVehicleVarName "convoysoldier";

convoysoldier setskill 0.75;
removebackpack convoysoldier;
removeVest convoysoldier;
removeHeadgear convoysoldier;
removeGoggles convoysoldier;

convoyguard1 = govconvoygroup createUnit ["I_Soldier_F", _pos, [], _radius, "FORM"];
convoyguard1 setVehicleVarName "convoyguard1";
convoyguard1 setskill 0.75;
removebackpack convoyguard1;
removeVest convoyguard1;
removeHeadgear convoyguard1;
removeGoggles convoyguard1;

convoyguard2 = govconvoygroup createUnit ["I_Soldier_F", _pos, [], _radius, "FORM"];
convoyguard2 setVehicleVarName "convoyguard2";
convoyguard2 setskill 0.75;
removebackpack convoyguard2;
removeVest convoyguard2;
removeHeadgear convoyguard2;
removeGoggles convoyguard2;

convoyguard3 = govconvoygroup createUnit ["I_Soldier_F", _pos, [], _radius, "FORM"];
convoyguard3 setVehicleVarName "convoyguard3";
convoyguard3 setskill 0.75;
removebackpack convoyguard3;
removeVest convoyguard3;
removeHeadgear convoyguard3;
removeGoggles convoyguard3;

convoyguard4 = govconvoygroup createUnit ["I_Soldier_F", _pos, [], _radius, "FORM"];
convoyguard4 setVehicleVarName "convoyguard4";
convoyguard4 setskill 0.75;
removebackpack convoyguard4;
removeVest convoyguard4;
removeHeadgear convoyguard4;
removeGoggles convoyguard4;

[WEST,"GC_Convoy_cop",["Make sure the money truck makes it all the way to base","Defend the money truck","DEFEND TRUCK"],[convoytruck,true],true] call BIS_fnc_taskCreate;
[CIVILIAN,"GC_Convoy_civ",["Kill the driver of the money truck and steal the cash!","Steal the money from the truck","STEAL MONEY"],[convoytruck,true],true] call BIS_fnc_taskCreate;

//processInitCommands;

govconvoygroup selectLeader convoysoldier;

convoysoldier moveInDriver convoytruck;
convoysoldier assignAsDriver convoytruck;

//make guards follow convoysoldier
convoyguard1 dofollow convoysoldier;
convoyguard2 dofollow convoysoldier;
convoyguard3 dofollow convoysoldier;
convoyguard4 dofollow convoysoldier;

govconvoygroup setbehaviour "AWARE";
govconvoygroup setCombatMode "GREEN";

//put guards in car with convoysoldier
convoyguard1 moveincargo convoytruck;
convoyguard1 assignAsCargo convoytruck;
convoyguard2 moveInCargo convoytruck;
convoyguard2 assignAsCargo convoytruck;
convoyguard3 moveInCargo convoytruck;
convoyguard3 assignAsCargo convoytruck;
convoyguard4 moveInCargo convoytruck;
convoyguard4 assignAsCargo convoytruck;
sleep 4;
convoysoldier commandMove getmarkerpos "policebase";

convoytruck setVehicleLock "locked";
convoytruck lock 2;

_truckpos = [];

//start mission loop
'playsound "convoy2sfx";["GC_Convoy",["CHAOS LIFE POLICE PAYROLL","The money truck is moving out!"]] spawn bis_fnc_showNotification;' call broadcast;
"server globalchat ""The money truck has arrived! Civs: kill the driver and steal the cash. Cops: your bonuses are inside, make sure it gets to the base!"";" call broadcast;
convoytruck spawn {
	sleep 0.35;
	_cash = (playersNumber west)*10000;
	if(_cash < 100000) then {_cash = 100000};
	format['
		convoyaction = %1 addaction ["Steal money","gc\client\GC_FNC_noScript.sqf","convoyhascash=false; publicvariable ""convoyhascash"";  [""cash"", %2] call INV_AddInventoreItem; [""SKILL_ROBBERY"",0.030] call GC_addSkill; [""GC_Good2"",[""CHAOS LIFE POLICE PAYROLL"",""You stole $%2!""]] spawn bis_fnc_showNotification;",1,false,true,"","_this distance convoytruck <= 7 and convoyhascash and isciv and (!alive (driver convoytruck) or isnull (driver convoytruck))"];
	',_this,_cash] call broadcast;
};
while {true} do {

	"if(alive player and isciv and player distance convoytruck <= 100)then{titleText [""The Government is operating in this area! Turn back or you will be shot!"", ""plain down""]};" call broadcast;
	"convoy" setmarkerpos getpos convoytruck;


	if (!convoyhascash) exitwith
		{
		_sidewon = "Civs";
		_truckpos = getPosASL convoytruck;
		'convoytruck removeaction convoyaction;' call broadcast;
		deletevehicle convoytruck;
		["GC_Convoy_cop", "FAILED"] call BIS_fnc_taskSetState;
		["GC_Convoy_civ", "SUCCEEDED"] call BIS_fnc_taskSetState;		
		};

	if (!alive convoyguard1) then {deletevehicle convoyguard1;};
	if (!alive convoyguard2) then {deletevehicle convoyguard2;};
	if (!alive convoyguard3) then {deletevehicle convoyguard3;};
	if (!alive convoyguard4) then {deletevehicle convoyguard4;};

	if (!alive convoysoldier and !_added) then {
		_added = true;
		govconvoygroup setbehaviour "AWARE";
		govconvoygroup setCombatMode "RED";
		"if (isciv) then {server sidechat ""The money truck driver is dead. Steal the police's cash!"";} else {server sidechat ""The money truck driver is dead. Get in his truck and drive it to base"";};" call broadcast;
		convoytruck setVehicleLock "unlocked";
		convoytruck lock 0;
		[convoyguard1, convoyguard2,convoyguard3,convoyguard4] orderGetIn false;
		unassignVehicle convoyguard1;
		unassignVehicle convoyguard2;
		unassignVehicle convoyguard3;
		unassignVehicle convoyguard4;
		convoyguard1 action ["eject", convoytruck];
		convoyguard2 action ["eject", convoytruck];
		convoyguard3 action ["eject", convoytruck];
		convoyguard4 action ["eject", convoytruck];
		convoyguard1 dofollow convoytruck;
		convoyguard2 dofollow convoytruck;
		convoyguard3 dofollow convoytruck;
		convoyguard4 dofollow convoytruck;
	};

	if (_counter >= 15 and !_added) then {
		govconvoygroup setBehaviour "AWARE";
		govconvoygroup setSpeedMode "LIMITED";
		convoysoldier commandmove getmarkerpos "policebase";
		[convoyguard1, convoyguard2,convoyguard3,convoyguard4] orderGetIn true;
		_counter = 0;
	};

	if (convoytruck in list CopBaseTrigger) exitwith
		{
		"if (iscop) then {Kontostand = (Kontostand + govconvoybonus); player sidechat format[""you received $%1 for the successfully escorting the truck"", govconvoybonus];};" call broadcast;
		_sidewon = "Cops";
		'convoytruck removeaction convoyaction;' call broadcast;
		deletevehicle convoytruck;
		convoyhascash=false; publicvariable "convoyhascash";
		["GC_Convoy_civ", "FAILED"] call BIS_fnc_taskSetState;
		["GC_Convoy_cop", "SUCCEEDED"] call BIS_fnc_taskSetState;		
		};

	if (_counter2 >= 1600) exitwith
		{
		_sidewon = "Neither";
		deletevehicle convoytruck;
		'convoytruck removeaction convoyaction;' call broadcast;
		convoyhascash=false; publicvariable "convoyhascash";
		["GC_BoatConvoy_cop", "CANCELED"] call BIS_fnc_taskSetState;
		["GC_BoatConvoy_civ", "CANCELED"] call BIS_fnc_taskSetState;		
		};

	if (GETDAMMAGE convoytruck >= 0.8) exitwith {
		"server globalchat ""The money truck has been destroyed the cash has burned"";" call broadcast;
		_sidewon = "Neither";
		[convoytruck,60,false] execVM "ammo_burn.sqf";
		convoytruck setdammage 1;
		convoyhascash=false; publicvariable "convoyhascash";
		["GC_BoatConvoy_cop", "CANCELED"] call BIS_fnc_taskSetState;
		["GC_BoatConvoy_civ", "CANCELED"] call BIS_fnc_taskSetState;		
	};

	{
		if (vehicle _x != _x) then {
			if (alive vehicle _x and driver vehicle _x in playableunits and side driver vehicle _x != west and side driver vehicle _x != east) then {
				if (alive convoyguard1) then {convoyguard1 doWatch _x;convoyguard1 dofire _x;};
				if (alive convoyguard2) then {convoyguard2 doWatch _x;convoyguard2 dofire _x;};
				if (alive convoyguard3) then {convoyguard3 doWatch _x;convoyguard3 dofire _x;};
				if (alive convoyguard4) then {convoyguard4 doWatch _x;convoyguard4 dofire _x;};
			};
		 } else {
		 	if (alive _x and _x in playableunits and side _x != west and side _x != east) then {
		 		if (count (weapons _x - nonlethalweapons) > 0) then {
					if (alive convoyguard1) then {convoyguard1 doWatch _x;convoyguard1 dofire _x;};
					if (alive convoyguard2) then {convoyguard2 doWatch _x;convoyguard2 dofire _x;};
					if (alive convoyguard3) then {convoyguard3 doWatch _x;convoyguard3 dofire _x;};
					if (alive convoyguard4) then {convoyguard4 doWatch _x;convoyguard4 dofire _x;};
				};
			};
		};
	} forEach (nearestObjects [convoytruck, ["Man","LandVehicle","Tank","Air","Ship"], 150]);

	_counter2 = _counter2 + 1;

	_counter = _counter + 1;

	sleep 1;
};

//drop weapons
if (_sidewon == "Civs") then {
	_ctime = round(time);
	_numAKs = floor(random 4) + 1;
	call compile format ['
		waffenhalter%1 = "groundWeaponHolder" createVehicle _truckpos;
		waffenhalter%1 setVehicleVarName "waffenhalter%1";
	', _ctime];
	sleep 0.5;
	call compile format ["for ""_i"" from 0 to %2 do {waffenhalter%1 addWeaponCargoGlobal [""SMG_02_F"", 1]; waffenhalter%1 addMagazineCargoGlobal [""30Rnd_9x21_Mag"", 4]}; waffenhalter%1 setposASL %3;", _ctime, _numAKs, _truckpos];
};

//mission has ended resetting vars and deleting units
(format ['server globalChat "%2 side won the money truck mission, next truck leaves in %1 minutes!";', 30, _sidewon]) call broadcast;
deletevehicle convoyguard1;
deletevehicle convoyguard2;
deletevehicle convoyguard3;
deletevehicle convoyguard4;
deletevehicle convoysoldier;
deletemarker "convoy";

diag_log text format ["finished %1 at %2",__FILE__,time];
