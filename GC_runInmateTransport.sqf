diag_log text format ["starting %1 at %2",__FILE__,time];

_added = false;
_inbay = false;
_onland = false;
_landed = false;
_sidewon = "Neither";
_counter = 0;
_counter2 = 0;
_inmates = [
	"Edward Snowden",
	"Bradley Manning",
	"James Bulger",
	"Denny Hecker",
	"Guy Fawkes",
	"Nelson Mandela",
	"Bernard Madoff"
];
_inmate = _inmates call BIS_fnc_selectRandom;

//Gets position to spawn
_array  = [[ConvoySpawn1, 10], [ConvoySpawn2, 10], [ConvoySpawn3, 10], [ConvoySpawn4, 10]];

_spawn   = (floor(random(count _array)));
_pos    = (_array select _spawn) select 0;
_radius = (_array select _spawn) select 1;

// spawn markers truck and soldiers
_markerobj = createMarker ["convoyboat",[0,0]];
_markername = "convoyboat";
_markerobj setMarkerShape "ICON";
"convoyboat" setMarkerType "mil_marker";
"convoyboat" setMarkerColor "ColorRed";
"convoyboat" setMarkerText _inmate;

boatconvoy_marker_active = 1;
boatconvoyhascash=true; publicvariable "boatconvoyhascash";

convoyboat = "B_Boat_Armed_01_minigun_F" createVehicle getPos _pos;
convoyboat setVehicleVarName "convoyboat";
//convoyboat setAmmoCargo 0;
clearweaponcargoglobal convoyboat;
clearmagazinecargoglobal convoyboat;
clearitemcargoglobal convoyboat;

publicvariable "convoyboat";
convoyboat setDir (getDir _pos);

convoyboat setVehicleLock "unlocked";
convoyboat lock 0;

boatconvoysoldier = boatconvoygroup createUnit ["I_Soldier_TL_F", _pos, [], _radius, "FORM"];
boatconvoysoldier setVehicleVarName "boatconvoysoldier";
[boatconvoysoldier] joinsilent boatconvoygroup;
boatconvoysoldier setskill 1;
removebackpack boatconvoysoldier;
removeVest boatconvoysoldier;
removeHeadgear boatconvoysoldier;
removeGoggles boatconvoysoldier;

boatconvoyguard1 = boatconvoygroup createUnit ["I_Soldier_SL_F", _pos, [], _radius, "FORM"];
boatconvoyguard1 setVehicleVarName "boatconvoyguard1";
boatconvoyguard1 setskill 0.85;
removebackpack boatconvoyguard1;
//removeVest boatconvoyguard1;
//removeHeadgear boatconvoyguard1;
removeGoggles boatconvoyguard1;

boatconvoyguard2 = boatconvoygroup createUnit ["I_Soldier_SL_F", _pos, [], _radius, "FORM"];
boatconvoyguard2 setVehicleVarName "boatconvoyguard2";
boatconvoyguard2 setskill 0.85;
removebackpack boatconvoyguard2;
//removeVest boatconvoyguard2;
//removeHeadgear boatconvoyguard2;
removeGoggles boatconvoyguard2;

boatconvoyguard3 = boatconvoygroup createUnit ["I_Soldier_SL_F", _pos, [], _radius, "FORM"];
boatconvoyguard3 setVehicleVarName "boatconvoyguard3";
boatconvoyguard3 setskill 0.85;
removebackpack boatconvoyguard3;
//removeVest boatconvoyguard3;
//removeHeadgear boatconvoyguard3;
removeGoggles boatconvoyguard3;

boatconvoyguard4 = boatconvoygroup createUnit ["I_Soldier_SL_F", _pos, [], _radius, "FORM"];
boatconvoyguard4 setVehicleVarName "boatconvoyguard4";
boatconvoyguard4 setskill 1;
removebackpack boatconvoyguard4;
//removeVest boatconvoyguard4;
//removeHeadgear boatconvoyguard4;
removeGoggles boatconvoyguard4;

boatinmate = boatconvoygroup createUnit ["I_Helipilot_F", _pos, [], _radius, "FORM"];
boatinmate setVehicleVarName "boatinmate";
boatinmate setskill 1;
removebackpack boatinmate;
removeVest boatinmate;
removeHeadgear boatinmate;
removeGoggles boatinmate;
removeAllWeapons boatinmate;
removeallitems boatinmate;
boatinmate unassignItem "NVGoggles_INDEP"; 
boatinmate removeItem "NVGoggles_INDEP";
publicvariable "boatinmate";
sleep 1;
[WEST,"GC_BoatConvoy_cop",["Escort the prisoner transport boat and inmate to base","Escort the prisoner","ESCORT PRISONER"],[boatinmate,true],true] call BIS_fnc_taskCreate;
[CIVILIAN,"GC_BoatConvoy_civ",["Free the prisoner from the transport boat or kill the captain and steal the paychecks","Free the prisoner","FREE PRISONER"],[boatinmate,true],true] call BIS_fnc_taskCreate;

'
boatinmate setObjectTexture [0, "images\coveralls_prisoner_co.jpg"];
convoyboat setobjecttexture[0,"images\gc_boat_c.jpg"];
convoyboat setobjecttexture[1,"images\gc_boat_o.jpg"];
convoyboat setobjecttexture[2,"images\gc_boat_p.jpg"];
' call broadcast;

//processInitCommands;
[boatconvoyguard1,boatconvoyguard2,boatconvoyguard3,boatconvoyguard4,boatinmate] joinsilent boatconvoygroup;
boatconvoygroup selectLeader boatconvoysoldier;
boatconvoysoldier moveInDriver convoyboat;
boatconvoysoldier assignAsDriver convoyboat;

//make guards follow convoysoldier
boatconvoyguard1 dofollow boatconvoysoldier;
boatconvoyguard2 dofollow boatconvoysoldier;
boatconvoyguard3 dofollow boatconvoysoldier;
boatconvoyguard4 dofollow boatconvoysoldier;
boatinmate dofollow boatconvoysoldier;

boatconvoygroup setbehaviour "AWARE";
boatconvoygroup setCombatMode "GREEN";
//boatconvoygroup setFormation "FILE";
//put guards in car with convoysoldier
boatconvoyguard1 moveingunner convoyboat;
boatconvoyguard1 assignAsGunner convoyboat;
boatconvoyguard2 moveInCommander convoyboat;
boatconvoyguard2 assignAsCommander convoyboat;
boatconvoyguard3 moveInCargo convoyboat;
boatconvoyguard3 assignAsCargo convoyboat;
boatconvoyguard4 moveInCargo convoyboat;
boatconvoyguard4 assignAsCargo convoyboat;
boatinmate moveInCargo convoyboat;
boatinmate assignAsCargo convoyboat;
sleep 4;
boatconvoysoldier commandMove getmarkerpos "boatconvoy0";
convoyboat setVehicleLock "locked";
convoyboat lock 2;

_inmatepos = [];

//start mission loop
'playsound "convoy2sfx";["GC_BoatConvoy",["CHAOS LIFE PRISONER TRANSPORT","The Government boat is moving out!"]] spawn bis_fnc_showNotification;' call broadcast;
format["server globalchat ""The transport boat has arrived! Civs: kill the captain to steal the money onboard. Cops: your bonuses are inside, make sure %1 gets to base!"";",_inmate] call broadcast;
[convoyboat,_inmate,boatinmate] spawn {
	sleep 1;
	_cash = (playersNumber west)*10000;
	if(_cash < 100000) then {_cash = 100000};
	format['
		boatconvoyaction = %1 addaction ["Steal money","gc\client\GC_FNC_noScript.sqf","boatconvoyhascash=false; publicvariable ""boatconvoyhascash"";  [""cash"", %2] call INV_AddInventoreItem; [""GC_Good2"",[""CHAOS LIFE PRISONER TRANSPORT"",""You stole $%2!""]] spawn bis_fnc_showNotification;",1,false,true,"","_this distance convoyboat <= 7 and boatconvoyhascash and isciv and (!alive boatconvoysoldier)"];
		boatconvoyaction2 = %4 addaction ["Free prisoner","gc\client\GC_FNC_noScript.sqf","boatconvoyhascash=false; publicvariable ""boatconvoyhascash"";  [""cash"", %2] call INV_AddInventoreItem; [""GC_Good2"",[""CHAOS LIFE PRISONER TRANSPORT"",""You freed %3 and got a reward of $%2!""]] spawn bis_fnc_showNotification;",1,false,true,"","_this distance boatinmate <= 7 and boatconvoyhascash and isciv and (!alive (driver convoyboat) or isnull (driver convoyboat))"];
		boatconvoyaction3 =  %4 addaction ["Take prisoner", "gc\client\GC_FNC_noScript.sqf", "[%1] join (group player); [""GC_Good2"",[""CHAOS LIFE PRISON GUARD"",""Lead the inmate to base or you will fail!""]] spawn bis_fnc_showNotification;",1,false,true,"","iscop and _this distance boatinmate < 5 and !(boatinmate in units group _this)"];
	',(_this select 0),_cash,(_this select 1),(_this select 2)] call broadcast;
};

_wp1 = boatconvoygroup addWaypoint [getmarkerpos "boatconvoy0", 1,0];
_wp2 = boatconvoygroup addWaypoint [getmarkerpos "boatconvoy1", 1,1];
_wp3 = boatconvoygroup addWaypoint [getmarkerpos "policebase", 1,2];
boatconvoygroup move getmarkerpos "boatconvoy0";
boatconvoygroup setCurrentWaypoint _wp1; 
boatconvoygroup move getmarkerpos "boatconvoy0";
while {true} do {

	"if(alive player and isciv and player distance boatinmate <= 60)then{titleText [""The Government is operating in this area! Turn back or you will be shot!"", ""plain down""]};" call broadcast;
	if (!_landed) then {
		_inmatepos = getposASL convoyboat;
		"convoyboat" setmarkerpos getpos convoyboat;
	} else {
		_inmatepos = getposASL boatinmate;
		"convoyboat" setmarkerpos getpos boatinmate;
	};

	if (!boatconvoyhascash) exitwith
		{
		_sidewon = "Civs";
		_inmate= getPosASL boatinmate;
		'convoyboat removeaction boatconvoyaction;boatinmate removeaction boatconvoyaction2;boatinmate removeaction boatconvoyaction3;' call broadcast;
		deletevehicle convoyboat;
		["GC_BoatConvoy_cop", "FAILED"] call BIS_fnc_taskSetState;
		["GC_BoatConvoy_civ", "SUCCEEDED"] call BIS_fnc_taskSetState;
		};

	if (!alive boatconvoyguard1) then {deletevehicle boatconvoyguard1;};
	if (!alive boatconvoyguard2) then {deletevehicle boatconvoyguard2;};
	if (!alive boatconvoyguard3) then {deletevehicle boatconvoyguard3;};
	if (!alive boatconvoyguard4) then {deletevehicle boatconvoyguard4;};
	if (!alive boatinmate) exitwith {
		format['server globalchat "%1 has been killed, nobody wins";',_inmate] call broadcast;
		_sidewon = "Neither";
		deletevehicle convoyboat;
		'convoyboat removeaction boatconvoyaction;boatinmate removeaction boatconvoyaction2;boatinmate removeaction boatconvoyaction3;' call broadcast;
		boatconvoyhascash=false; publicvariable "boatconvoyhascash";
		["GC_BoatConvoy_cop", "CANCELED"] call BIS_fnc_taskSetState;
		["GC_BoatConvoy_civ", "CANCELED"] call BIS_fnc_taskSetState;
	};


	if (!alive boatconvoysoldier and !_added) then {
		_added = true;
		boatconvoygroup setbehaviour "AWARE";
		boatconvoygroup setCombatMode "RED";
		"if (isciv) then {server sidechat ""The captain is dead. Steal the money aboard or free the prisoner."";} else {server sidechat ""The the captain is dead. Get in his boat and beach it near the canal going to base in Marina Bay"";};" call broadcast;
		convoyboat setVehicleLock "unlocked";
		convoyboat lock 0;
		/*
		[boatconvoyguard1, boatconvoyguard2,boatconvoyguard3,boatconvoyguard4,boatinmate] orderGetIn false;
		unassignVehicle boatconvoyguard1;
		unassignVehicle boatconvoyguard2;
		unassignVehicle boatconvoyguard3;
		unassignVehicle boatconvoyguard4;
		unassignVehicle boatinmate;
		boatconvoyguard1 action ["eject", convoyboat];
		boatconvoyguard2 action ["eject", convoyboat];
		boatconvoyguard3 action ["eject", convoyboat];
		boatconvoyguard4 action ["eject", convoyboat];
		boatinmate action ["eject", convoyboat];
		boatconvoyguard1 commandfollow convoyboat;
		boatconvoyguard2 commandfollow convoyboat;
		boatconvoyguard3 commandfollow convoyboat;
		boatconvoyguard4 commandfollow convoyboat;
		boatinmate commandfollow convoyboat;
		*/
	};

	if (convoyboat distance (getmarkerpos "boatconvoy0") < 10) then {_inbay = true;};
	if (convoyboat distance (getmarkerpos "boatconvoy1") < 100 and abs(speed convoyboat) <= 1) then {_onland = true;};
	
	if (_counter >= 15  and !_inbay and !_onland) then {
		boatconvoysoldier commandmove getmarkerpos "boatconvoy0";
		boatconvoygroup setBehaviour "AWARE";
		boatconvoygroup setSpeedMode "FULL";		
		[boatconvoyguard1, boatconvoyguard2,boatconvoyguard3,boatconvoyguard4,boatinmate] orderGetIn true;
		_counter = 0;
		diag_log "flank speed to bay";
	};
	if (_counter >= 3 and _inbay and !_onland) then {
		boatconvoygroup setCurrentWaypoint _wp2; 
		boatconvoysoldier commandmove getmarkerpos "boatconvoy1";
		boatconvoygroup setBehaviour "AWARE";
		boatconvoygroup setSpeedMode "LIMITED";		
		[boatconvoyguard1, boatconvoyguard2,boatconvoyguard3,boatconvoyguard4,boatinmate] orderGetIn true;
		_counter = 0;
		diag_log "no wake in bay";
	};	
	if (_counter >= 15 and _landed and alive boatconvoysoldier) then {
		boatconvoygroup setCurrentWaypoint _wp3; 
		boatconvoyguard1 dofollow boatconvoysoldier;
		boatconvoyguard2 dofollow boatconvoysoldier;
		boatconvoyguard3 dofollow boatconvoysoldier;
		boatconvoyguard4 dofollow boatinmate;	
		boatinmate dofollow boatconvoysoldier;		
		boatconvoysoldier domove getmarkerpos "policebase";
		boatconvoygroup setBehaviour "AWARE";
		boatconvoygroup setSpeedMode "LIMITED";
		boatconvoygroup setCombatMode "GREEN";
		boatconvoygroup setFormation "FILE";
		boatconvoygroup move getmarkerpos "policebase";
		_counter = 0;
		diag_log "following the leader";
	};
	if (_counter >= 15  and _landed and !alive boatconvoysoldier) then {
		boatconvoygroup setCurrentWaypoint _wp3; 
		boatconvoyguard1 domove getmarkerpos "policebase";
		boatconvoyguard2 domove getmarkerpos "policebase";
		boatconvoyguard3 domove getmarkerpos "policebase";
		boatconvoyguard4 domove getmarkerpos "policebase";
		boatinmate domove getmarkerpos "policebase";	
		boatconvoygroup setBehaviour "COMBAT";
		boatconvoygroup setSpeedMode "NORMAL";
		boatconvoygroup setCombatMode "YELLOW";
		boatconvoygroup setFormation "FILE";
		boatconvoygroup move getmarkerpos "policebase";
		_counter = 0;
		diag_log "everyone for themselves";
	};	
	if (_counter >= 3 and _onland and !_landed) then {
		boatconvoygroup setCurrentWaypoint _wp3; 
		boatconvoysoldier setskill 0.1;
		boatconvoygroup setBehaviour "AWARE";
		boatconvoygroup setCombatMode "GREEN";		
		convoyboat setVehicleLock "unlocked";
		convoyboat lock 0;
		'convoyboat engineOn false;' call broadcast;
		[boatconvoysoldier,boatconvoyguard1, boatconvoyguard2,boatconvoyguard3,boatconvoyguard4,boatinmate] orderGetIn false;
		unassignVehicle boatconvoysoldier;
		unassignVehicle boatconvoyguard1;
		unassignVehicle boatconvoyguard2;
		unassignVehicle boatconvoyguard3;
		unassignVehicle boatconvoyguard4;
		unassignVehicle boatinmate;
		boatconvoysoldier action ["eject", convoyboat];
		boatconvoyguard1 action ["eject", convoyboat];
		boatconvoyguard2 action ["eject", convoyboat];
		boatconvoyguard3 action ["eject", convoyboat];
		boatconvoyguard4 action ["eject", convoyboat];
		boatinmate action ["eject", convoyboat];
		{_x action ["eject", convoyboat];} forEach (crew convoyboat);
		sleep 1;
		boatconvoyguard1 commandfollow boatconvoysoldier;
		boatconvoyguard2 commandfollow boatconvoysoldier;
		boatconvoyguard3 commandfollow boatconvoysoldier;
		boatconvoyguard4 commandfollow boatinmate;	
		boatinmate commandfollow boatconvoysoldier;	
		boatconvoysoldier commandmove getmarkerpos "policebase";
		_counter = 0;
		_landed = true;
		// 'convoyboat hideobject true;convoyboat enablesimulation false;'call broadcast;
convoyboat spawn {
	_this setfuel 0;
	sleep 4;
	_this setVehicleLock "locked";
	_this lock 2;

};
		diag_log "boat unloaded";
	};	
	if (vehicle boatinmate in list CopBaseTrigger) exitwith
		{
		"if (iscop) then {Kontostand = (Kontostand + govconvoybonus); player sidechat format[""you received $%1 for successfully escorting %2 to base"", govconvoybonus,_inmate];};" call broadcast;
		_sidewon = "Cops";
		'convoyboat removeaction boatconvoyaction;boatinmate removeaction boatconvoyaction2;boatinmate removeaction boatconvoyaction3;' call broadcast;
		deletevehicle convoyboat;
		boatconvoyhascash=false; publicvariable "boatconvoyhascash";
		["GC_BoatConvoy_cop", "SUCCEEDED"] call BIS_fnc_taskSetState;
		["GC_BoatConvoy_civ", "FAILED"] call BIS_fnc_taskSetState;		
		};

	if (_counter2 >= 2400) exitwith
		{
		_sidewon = "Neither";
		deletevehicle convoyboat;
		'convoyboat removeaction boatconvoyaction;boatinmate removeaction boatconvoyaction2;boatinmate removeaction boatconvoyaction3;' call broadcast;
		boatconvoyhascash=false; publicvariable "boatconvoyhascash";
		["GC_BoatConvoy_cop", "CANCELED"] call BIS_fnc_taskSetState;
		["GC_BoatConvoy_civ", "CANCELED"] call BIS_fnc_taskSetState;		
		};

	if (GETDAMMAGE convoyboat >= 0.8 and !_landed) exitwith {
		format["server globalchat ""%1's boat has been destroyed, the prisoner has drown at sea"";",_inmate] call broadcast;
		_sidewon = "Neither";
		[convoyboat,60,false] execVM "ammo_burn.sqf";
		convoyboat setdammage 1;
		'convoyboat removeaction boatconvoyaction;boatinmate removeaction boatconvoyaction2;boatinmate removeaction boatconvoyaction3;' call broadcast;
		boatconvoyhascash=false; publicvariable "boatconvoyhascash";
		["GC_BoatConvoy_cop", "CANCELED"] call BIS_fnc_taskSetState;
		["GC_BoatConvoy_civ", "CANCELED"] call BIS_fnc_taskSetState;		
	};
	
	{
		if (vehicle _x != _x) then {
			if (alive vehicle _x and driver vehicle _x in playableunits and side driver vehicle _x != west and side driver vehicle _x != east) then {
				if (alive boatconvoyguard1) then {boatconvoyguard1 doWatch _x;boatconvoyguard1 dofire _x;};
				if (alive boatconvoyguard2) then {boatconvoyguard2 doWatch _x;boatconvoyguard2 dofire _x;};
				if (alive boatconvoyguard3) then {boatconvoyguard3 doWatch _x;boatconvoyguard3 dofire _x;};
				if (alive boatconvoyguard4) then {boatconvoyguard4 doWatch _x;boatconvoyguard4 dofire _x;};
			};
		 } else {
		 	if (alive _x and _x in playableunits and side _x != west and side _x != east) then {
		 		if (count (weapons _x - nonlethalweapons) > 0 or _x distance boatinmate < 20) then {
					if (alive boatconvoyguard1) then {boatconvoyguard1 doWatch _x;boatconvoyguard1 dofire _x;};
					if (alive boatconvoyguard2) then {boatconvoyguard2 doWatch _x;boatconvoyguard2 dofire _x;};
					if (alive boatconvoyguard3) then {boatconvoyguard3 doWatch _x;boatconvoyguard3 dofire _x;};
					if (alive boatconvoyguard4) then {boatconvoyguard4 doWatch _x;boatconvoyguard4 dofire _x;};
				};
			};
		};
	} forEach (nearestObjects [vehicle boatinmate, ["Man","LandVehicle","Tank","Air","Ship"], 150]);
	_counter2 = _counter2 + 1;
	_counter = _counter + 1;
	sleep 1;
};

//drop weapons  TODO - drop different stuff depending on the inmate 
if (_sidewon == "Civs") then {
	_ctime = round(time);
	_numAKs = floor(random 4) + 1;
	call compile format ['
		waffenhalter%1 = "groundWeaponHolder" createVehicle %2;
		waffenhalter%1 setVehicleVarName "waffenhalter%1";
	', _ctime,_inmatepos];
	sleep 0.5;
	call compile format ["for ""_i"" from 0 to %2 do {waffenhalter%1 addWeaponCargoGlobal [""SMG_02_F"", 1]; waffenhalter%1 addMagazineCargoGlobal [""30Rnd_9x21_Mag"", 4]}; waffenhalter%1 setposASL %3;", _ctime, _numAKs, _inmatepos];
};

//mission has ended resetting vars and deleting units
(format ['server globalChat "%2 side won the prisoner transport mission, next inmate arrives in %1 minutes!";', 45, _sidewon]) call broadcast;
deletevehicle boatconvoyguard1;
deletevehicle boatconvoyguard2;
deletevehicle boatconvoyguard3;
deletevehicle boatconvoyguard4;
deletevehicle boatconvoysoldier;
deletevehicle boatinmate;
deletemarker "convoyboat";
deletevehicle convoyboat;

diag_log text format ["finished %1 at %2",__FILE__,time];