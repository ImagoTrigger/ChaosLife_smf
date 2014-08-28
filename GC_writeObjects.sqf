private ["_gang","_pos","_dir","_weps","_mags","_class","_arr","_counter","_droparray","_item","_qty","_infos","_itemType","_trunk","_nitro","_tuning","_caralarm","_customhorn","_radar","_mount","_bunny","_skin","_on","_hasmount","_fuel","_name","_newarr","_unsorted","_created","_damage","_carpark","_distance","_sorted","_report","_date"];
diag_log text format ["starting %1 ticktime: %2",__FILE__,diag_ticktime];

//mission values
_date = Date;
"gc" callExtension "D|__A3SERVER__|GC_Mission";
"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Mission","DateStamp",_date];
if (count gangsarray > 0) then {
	"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Mission","gangsarray",gangsarray];
	{
		_gang = _x getvariable "control";
		if (!isnil "_gang") then {
			"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Mission",_x,_gang];
		};
	} foreach gangareas;
};
diag_log text "Wrote GC_Mission values";
_report = [(count allGroups),(count gangsarray)];


//all dropped weapons/items/backpacks
"gc" callExtension "D|__A3SERVER__|GC_WeaponHolders";
_counter = 0;
{
	_pos = getposASL _x;
	_dir = getdir _x;
	_weps = getWeaponCargo _x;
	_mags = getMagazineCargo _x;
	_items = getItemCargo _x;
	_packs = getBackpackCargo _x;
	_class = typeof _x;
	_arr = [_pos,_dir,_weps,_mags,_items,_class,_packs];
	"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_WeaponHolders",_counter,_arr];
	_counter = _counter + 1;
} foreach (worldCenterPosition nearObjects ["groundWeaponHolder", 20000]);
diag_log text format["Wrote %1 dropped weapons/mags/items/backpack piles",_counter];

_report = _report + [0];

//dropped (non illicit) suitcases (max qty 5)
"gc" callExtension "D|__A3SERVER__|GC_Objects";
_counter = 0;
{
	_droparray = _x getvariable "droparray";
	if (!isnil "_droparray") then {
		if (count _droparray > 1) then {
			_qty = _droparray select 0;
			_item = _droparray select 1;
			_itemType = _item call INV_getitemKindOf;
			if (_itemType != "drug" and _itemType != "drink" and _itemType != "food" and _itemType != "ressource" and _itemType != "bomb" and _itemType != "Ring" and _itemType != "static") then {
				_pos = getposASL _x;
				_dir = getdir _x;
				_class = typeof _x;
				if (_qty > 5 and _itemType != "cash") then {_droparray = [5,_item];};
				_skull = _x getvariable "nameskull";
				_name = "";
				if (!isnil "_skull") then {_name = _skull;};
				_arr =[_pos,_dir,_class,_droparray,_name];
				_dowrite = true;
				//dont save nameless skulls or small cash piles (spam)
				if ((_class == "Land_HumanSkull_F" and _name == "") or (_class == "Land_Money_F" and (_droparray select 0) <= 420)) then {
					_dowrite = false;
				};
				if (_dowrite) then {
					"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Objects",_counter,_arr];
					_counter = _counter + 1;
				};
			};
		};
	};
} foreach nearestObjects [worldCenterPosition,["Land_Suitcase_F","Land_HumanSkull_F","Land_Money_F"], 20000];
diag_log text format["Wrote %1 dropped suitcases/skulls",_counter];
_report = _report + [_counter];

//vehicles in car parks
_unsorted = [];
{
	_carpark = _x select 0;
	_distance = _x select 1;
	{
		if (!(["#",str(_x)] call BIS_fnc_inString)) then { //only get properly "classed" vehicles
			_created = _x getvariable "created";
			_damage = getdammage _x;
			if (!isnil "_created" and _damage < 0.98) then {
				_pos = getposASL _x;
				_dir = getdir _x;
				_weps = getWeaponCargo _x;
				_mags = getMagazineCargo _x;
				_items = getItemCargo _x;
				_packs = getBackpackCargo _x;
				_trunk = call compile format["%1_storage",_x];
				if (isnil "_trunk") then {
					_trunk = [];
				} else {
					if ( (typename _trunk) == "ARRAY") then {
						_newtrunk = [];
						{
							if ((typename _x) == "ARRAY") then {
								_item = _x select 0;
								_itemType = _item call INV_getitemKindOf;
								if (_itemType != "bomb" and _itemType != "static" and _itemType != "cash") then {
									_newtrunk = _newtrunk + [_x];
								};
							};
						} foreach _trunk;
						_trunk = _newtrunk;
					} else {
						_trunk = [];
					};
				};
				_fuel = fuel _x;
				_class = typeof _x;
				_name = format["%1",_x];
				_nitro = _x getvariable "nitro"; if (isnil "_nitro") then {_nitro = "";};
				_tuning = _x getvariable "tuning"; if (isnil "_tuning") then {_tuning = "";};
				_caralarm = _x getvariable "caralarm"; if (isnil "_caralarm") then {_caralarm = "";};
				_customhorn = _x getvariable "customhorn"; if (isnil "_customhorn") then {_customhorn = "";};
				_radar = _x getvariable "radar"; if (isnil "_radar") then {_radar = "";};
				_mount = _x getvariable "mount";
				if (isnil "_mount") then {
					_mount = "";
				} else {
					if ((_mount select 0) and !isNull (_mount select 1) and alive (_mount select 1)) then {
						_mount = format["%1",_mount];
					} else {
						_mount = "";
					};
				};
				_bunny = _x getvariable "bunnyhop"; if (isnil "_bunny") then {_bunny = "";};
				_skin = _x getvariable "customskin"; if (isnil "_skin") then {_skin = "";};
				_on = _x getvariable "mountedon"; if (isnil "_on") then {_on = "";} else {_on = format["%1",_on];};
				_arr = [_pos,_dir,_damage,_class,_name,_weps,_mags,_trunk,_nitro,_tuning,_caralarm,_customhorn,_radar,_mount,_skin,_bunny,_fuel,_on,_items,_packs];
				_hasmount = 1;
				if (_mount != "") then {
					_hasmount = 0;
				};
				_newarr = [_hasmount,_arr];
				_unsorted = _unsorted + [_newarr];
			};
		};
	} foreach nearestObjects[_carpark,["LandVehicle","Ship","Air"],_distance];
} forEach INV_VehicleGaragen;
//TODO Air save on/near helipads - Boat save near docks A3 NYI TODO Imago

"gc" callExtension "D|__A3SERVER__|GC_Vehicles";
_sorted = [_unsorted,0] call CBA_fnc_sortNestedArray;
_counter = 0;
{
	_arr = _x select 1;
	"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Vehicles",_counter,_arr];
	_counter = _counter + 1;
} foreach _sorted;
diag_log text format["Wrote %1 vehicles in car parks",_counter];
_report = _report + [_counter];

time_last_saved = "gc" callExtension "epoch";
"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Server","TLS",time_last_saved];

//format['if (!isServer) then {[0,%1,%2] call GC_displayReport;};',_report,_date] call broadcast;

diag_log text format ["finished %1 ticktime: %2",__FILE__,diag_ticktime];
