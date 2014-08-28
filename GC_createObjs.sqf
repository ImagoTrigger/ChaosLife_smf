private ["_terrorcamp","_code","_foreachindex","_weptypes","_wepcounts","_magtypes","_magcounts","_read","_pos","_dir","_weps","_mags","_class","_holder","_counter","_mounter","_on","_bon","_mountinit","_bskin","_arr","_damage","_name","_trunk","_nitro","_tuning","_caralarm","_customhorn","_radar","_mount","_skin","_bunny","_fuel","_vehicle","_parent","_mountst","_mountar","_mv","_droparray","_obj"];

//terror camp
_terrorcamp = [
	["Land_Cargo_HQ_V1_F",[-4,8.5,0],0,1,0,"allowdamage false"],
	["Land_Cargo_Patrol_V1_F",[-5,-5,0],0,1,0,"allowdamage false"],
	["Land_FieldToilet_F",[8,-8,0],90,1,0,"allowdamage false"]
];
[[2643.77,609.864,65.8633], 344, _terrorcamp] call GC_objMapper;

_powflag = "FlagPole_F" createvehicle  [2617.19,610.234,64.2397];
_powflag setFlagTexture "\a3\data_f\Flags\flag_pow_co.paa";
_powflag setposASL [2617.19,610.234,64.2397];
_powflag setdir 325.369;
_powflag allowdammage false;


//gas station 1 (Town East)
_gasstation_big = [
	["Land_FuelStation_Build_F",[8,14,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[8,14,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[1,14,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[8,8,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Shed_F",[-6,5,0],90,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-6,5,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-10,5,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-10,0,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-14,10,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-14,5,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-14,0,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[4,5,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[4,0,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[0,0,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[0,4,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[4,10,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Sign_F",[12,-2,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[12,-2,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[8,-2,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[-5,5,0.3],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-5,5,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[-7,5,0.3],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[-5,12,0.3],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[-7,12,0.3],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[-5,-2,0.2],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[-7,-2,0.2],0,1,0,"allowdamage false"]
];
[[3179.82,6193.97,35.5229], 335, _gasstation_big] call GC_objMapper;

//gas staion 3 (Town West)
_gasstation_small = [
	["Land_ClutterCutter_large_F",[0,-2,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Build_F",[0,2,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[0,2,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Sign_F",[-7,-5,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[5,-5,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[5,-4,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[11,-4,0],0,1,0,"allowdamage false"],
	["Land_FuelStation_Feed_F",[8,-4,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[8,-4,0],0,1,0,"allowdamage false"],
	["Land_dp_smallTank_F",[11,4,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[11,4,0],0,1,0,"allowdamage false"]
];
[[4328.55,6803.28,134.308],0, _gasstation_small] call GC_objMapper;

//gas station 4
[[3120.79,1602.51,90.8251],300, _gasstation_small] call GC_objMapper;

//gas station 6 (5 is in cop base)
[[6021.38,4944,87.0681], 200, _gasstation_small] call GC_objMapper;

//gas station 7
[[4224.92,3568.35,211.503], 0, _gasstation_small] call GC_objMapper;

//make a pier at black market (strogos bay)
_mypier = "Land_nav_pier_m_F" createvehicle [2112.13,1909.57,-1.27];
_mypier setposASL [2112.13,1909.57,-1.27];
_mypier setdir 130;
_mypier enablesimulation false;
_mypierbox = "Land_Pier_Box_F" createvehicle [2091,1887.57,4.70];
_mypierbox setposASL [2092.5,1887.57,4.74];
_mypierbox setdir 40;
_mypierbox enablesimulation false;
_effect = "Land_RowBoat_V2_F" createvehicle [2086.39,1881.16,4.74];
_effect setposASL [2099.16,1885.65,4.73];
_effect setdir -128;
_effect enablesimulation false;
_effect2 = "FirePlace_burning_F" createvehicle [2086.39,1880.16,4.74];
_effect2 setposASL [2102.96,1889.26,4.73];
_effect2 setdir 85;
_effect2 allowdammage false;
_effect3 = "FlagPole_F" createvehicle [2101.34,1887.27,4.75577];
_effect3 setFlagTexture "\a3\data_f\Flags\flag_pow_co.paa";
_effect3 setposASL [2101.34,1887.27,4.75577];
_effect3 setdir 42;
_effect3 allowdammage false;

//make a church at the crossroads (center of map mountain near radio tower)
_mychurch = "Land_Chapel_Small_V1_F" createvehicle [3761.44,4799.21,193.963];
_mychurch setposASL [3761.44,4799.21,193.963];
_mychurch setdir 99;
_mychurch enablesimulation false;
_mychurch2 = "Land_BellTower_01_V1_F" createvehicle [3761.73,4789.93,193.827];
_mychurch2 setposASL [3761.73,4789.93,193.827];
_mychurch2 setdir 99;
_mychurch2 enablesimulation false;
_mychurch3 = "Land_Calvary_01_V1_F" createvehicle [3761.73,4789.93,193.827];
_mychurch3 setposASL [3768.31,4803.72,194.268];
_mychurch3 setdir 99;
_mychurch3 enablesimulation false;

//move a random priest
_priestnum = (floor(random  7)) + 1;
call compile format['
	priest%1 setposASL [3761.48,4789.98,193.796];
	priest%1 setdir 109;
',_priestnum];

_mychurch4 = "UserTexture1m_F" createvehicle getposASL atm3;
[atm3, 0, 0] call setPitchBank;
atm3 setposASL [(getposASL atm3 select 0),(getposASL atm3 select 1),(getposASL atm3 select 2) + 0.2];
atm3npc setposASL [(getposASL atm3npc select 0),(getposASL atm3npc select 1),(getposASL atm3npc select 2) + 0.28];
_mychurch4 setObjectTexture [0,"images\dollarsign.paa"];
_mychurch4 attachTo [atm3,[0.0,-0.425,0.525]];
_mychurch4 enablesimulation false;

//make some towers by the checkpoints
_mycp1 = "Land_Cargo_Patrol_V1_F" createvehicle [4613.36,5890.42,142.124];
_mycp1 setposASL [4612.88,5891.02,142.082];
_mycp1 setdir 187;
_mycp2 = "Land_Cargo_Patrol_V1_F" createvehicle [4616.27,5871.72,142.453];
_mycp2 setposASL [4616.27,5871.72,142.453];
_mycp2 setdir 2;

//add court to basketball field
_mycourt = "Land_BC_Court_F" createvehicle [2849,6007,2.95];
_mycourt setposASL [2850.35,6008.43,2.9499];
_mycourt setDir 177.5;

//setup safes
safe1 setposASL [2888.08,6001.9,7.0663];
safe1 setDir 123;
safe2 setposASL [2887.16,5996.24,7.06624];
safe2 setDir 121;
safe3 setposASL [2893.13,6005.3,7.06656];
safe3 setDir 121;
_money1 = "UserTexture1m_F" createvehicle getposASL safe1;
_money1 setObjectTexture [0,"images\dollarsign.paa"];
_money1 attachTo [safe1,[0.0,-0.78,0.08]];
_money1 enablesimulation false;
_money2 = "UserTexture1m_F" createvehicle getposASL safe2;
_money2 setObjectTexture [0,"images\dollarsign.paa"];
_money2 attachTo [safe2,[0.0,-0.78,0.08]];
_money2 enablesimulation false;
_money3 = "UserTexture1m_F" createvehicle getposASL safe3;
_money3 setObjectTexture [0,"images\dollarsign.paa"];
_money3 attachTo [safe3,[0.0,-0.78,0.08]];
_money3 enablesimulation false;

//fast food /w precisley placed shit
cookfire setposASL [3060,6127.8,20.35];
cook setposASL [3059.5,6127.36,19.4855];
shit1 setposASL [3059.09,6129.35,20.5432];
shit1 setVectorUp [0,0,1];
shit1 enablesimulation false;
shit2 setposASL [3059.49,6128.85,20.5432];
shit2 enablesimulation false;
shit3 setposASL [3059.69,6129.05,20.5432];
shit3 setVectorUp [0,0,1];
shit3 enablesimulation false;

//boat impound
boatimpoundbuy setposASL [1959.93,5152.95,3.02292];
boatimpoundbuy setDir 56.1972;

//Firepits
_fire = "FirePlace_burning_F";
wep_lic_fire = _fire createvehicle [1878.1994,2748.7795,15.5773];
wep_lic_fire setposasl [1878.1994,2748.7795,15.5773];
equip_shop_fire = _fire createvehicle [1963.346,2743.823,6.32146];
equip_shop_fire setposasl [1963.346,2743.823,6.32146];
equip_shop_fire setvectorup [0,0,1];
ring_shop_fire = _fire createvehicle [2039.1554,2708.1998,6.76323];
ring_shop_fire setposasl [2039.1554,2708.1998,6.76323];
ring_shop_fire setvectorup [0,0,1];
hunt_shop_fire = _fire createvehicle [3680.388,2878.194,157.9994];
hunt_shop_fire setposasl [3680.388,2878.194,157.9994];
hunt_shop_fire setvectorup [0,0,1];
vehicle_shop_fire = _fire createvehicle [2978.9,6098.9,8];
vehicle_shop_fire setposasl [2978.9,6098.9,8];
vehicle_shop_fire setvectorup [0,0,1];

//Meth Lab
_table = "Land_CampingTable_F" createvehicle [2779.45,1736.67,142.966];
_table setposasl [2779.45,1736.67,142.966];
_table setdir 325;
_table2 = "Land_CampingTable_F" createvehicle [2779.45,1736.67,142.966];
_table2 setposasl [2780.249,1737.9224,142.966];
_table2 setdir 55;
_table3 = "Land_CampingTable_small_F" createvehicle [2780.20,1737.85,142.966];
_table3 setposasl [2779.485,1739.015,142.966];
_table3 setdir 55;
_jug = "Land_CanisterPlastic_F" createvehicle [2778.45,1735.95,142.966];
_jug setposasl [2778.45,1735.95,142.966];
_jug setdir 55;
_jug setvectorup [0,0,1];
_jug2 = "Land_CanisterPlastic_F" createvehicle [2779.95,1738.47,143.773];
_jug2 setposasl [2779.95,1738.47,143.773];
_jug2 setdir 325;
_jug2 setvectorup [0,0,1];
_barrel = "Land_BarrelSand_F" createvehicle [2779.01,1736.47,143.773];
_barrel setposasl [2779.01,1736.27,143.773];
_barrel setvectorup [0,0,1];
_barrel2 = "Land_BarrelSand_F" createvehicle [2779.01,1736.47,143.773];
_barrel2 setposasl [2779.81,1736.87,143.773];
_barrel2 setvectorup [0,0,1];
_fire = "FirePlace_burning_F" createvehicle [2779.01,1736.47,142.966];
_fire setposasl [2779.01,1736.27,142.966];
_fire setvectorup [0,0,1];
_fire2 = "FirePlace_burning_F" createvehicle [2779.01,1736.47,142.966];
_fire2 setposasl [2779.81,1736.87,142.966];
_fire2 setvectorup [0,0,1];
_methlabitems = [_table,_table2,_table3,_jug,_jug2,_barrel,_barrel2];
{
	_x allowdammage false;
	_x enablesimulation false;
} foreach _methlabitems;

//car parks
_parking_large = [
	["Land_CncBarrier_F",[-8,8,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[-6,8,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-6,6,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-6,3,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[-4,8,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[-2,8,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-2,6,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-2,3,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[0,8,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[2,8,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[2,6,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[2,3,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[4,8,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[6,8,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[6,6,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[6,3,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[8,8,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[10,8,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[10,6,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[10,3,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[12,8,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[14,8,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[14,6,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[14,3,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[15,8,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[-9,3,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[-9,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[-4,3,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[-4,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[1,3,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[1,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[6,3,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[6,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[11,3,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[11,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[16,3,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[16,6,0],0,1,0,"allowdamage false"]
];

_parking_small = [
	["Land_CncBarrier_F",[-3.8,8,0],0,1,0,"allowdamage false"],
	["Land_CncBarrier_F",[-1.2,8,0],0,1,0,"allowdamage false"],
	["Land_ClutterCutter_large_F",[-2,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[0,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[0,3,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[-5,6,0],0,1,0,"allowdamage false"],
	["Land_Obstacle_Saddle_F",[-5,3,0],0,1,0,"allowdamage false"]
];

//near graveyard carpark1
[[2974.2,6211.93,28.3249],350, _parking_large] call GC_objMapper;
[[2977.77,6201.18,28.1497],177.123, _parking_small] call GC_objMapper;
[[2967.64,6202.35,28.4716],174.849, _parking_small] call GC_objMapper;

//near romans pub/wp3 carpark2
[[5232.85,5233.3,201.503],49.0425,_parking_large] call GC_objMapper;

//near zargeros pub carpark3
[[3157.46,6037.94,4.97638],333.02,_parking_large] call GC_objMapper;

//market export carpark4
[[2135.65,4729.78,2.37833],185.589,_parking_large] call GC_objMapper;

//airport carpark5
[[2080.75,5609.42,6.73144],281.935,_parking_large] call GC_objMapper;

//city hall carpark 6 & 7
[[2876.94,6069.68,2.83574],211.65, _parking_large] call GC_objMapper;

//girna carpark8
[[1976.63,2757.32,4.79023],38, _parking_large] call GC_objMapper;

//veh fac car park 9
[[2025.62,5162.22,3.37106],194.022, _parking_small] call GC_objMapper;
[[2020.2,5163.39,3.35297],193.162, _parking_small] call GC_objMapper;
[[2014.86,5165.63,3.2821],196.495, _parking_small] call GC_objMapper;

//fast travel desk marina
ftdesk1 setposASL [2871.76,6097.91,6.51541];
ftdesk1 setdir 11;
ftlaptop1 setposASL [2871.76,6097.91,7.29];
ftlaptop1 setdir 11;
ftlaptop1 enablesimulation false;

//girna ft
ftdesk2 setposASL [1879.8,2754,14.1526];
ftdesk2 setdir 80;
ftdesk2 enablesimulation false;
ftdesk2 setVectorUp [0,0,1];
ftlaptop2 setposASL [1879.8,2754,15.1];
ftlaptop2 setdir 80;
ftlaptop2 enablesimulation false;

//dropped weapons, mags, items backpacks
//- A3 TODO NYI- also save the shit that can be inside the backpacks!  also now reattach weapon attachments, readd mags/inv to uniforms/vests
_counter = 0;
while{true} do {
	_read = "gc" callExtension format["R|%1|%2|%3","__A3SERVER__","GC_WeaponHolders",_counter];
	if (_read == "") exitWith {};
	_read = call compile _read;
	_pos = _read select 0;
	_dir = _read select 1;
	_weps = _read select 2;
	_mags = _read select 3;
	_items = _read select 4;
	_class = _read select 5;
	_packs = [];
	if (count _read > 6) then {
		_packs = _read select 6;
	};
	_code = "";
	if (count _weps > 0 || count _mags > 0 || count _items > 0) then {
		_holder = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
		diag_log _read;
		_holder setposASL _pos;
		_holder setdir _dir;
		if (count _weps > 0) then {
			_weptypes = _weps select 0;
			_wepcounts = _weps select 1;
			{
				if (_x != "") then {
					_code = _code + format['_holder addweaponcargoglobal ["%1",%2];',_x,(_wepcounts select _foreachindex)];
				};
			} foreach _weptypes;
		};
		if (count _mags > 0) then {
			_magtypes = _mags select 0;
			_magcounts = _mags select 1;
			{
				if (_x != "") then {
					_code = _code + format['_holder addmagazinecargoglobal ["%1",%2];',_x,(_magcounts select _foreachindex)];
				};
			} foreach _magtypes;
		};
		if (count _items > 0) then {
			_itemtypes = _items select 0;
			_itemcounts = _items select 1;
			{
				if (_x != "") then {
					_code = _code + format['_holder additemcargoglobal ["%1",%2];',_x,(_itemcounts select _foreachindex)];
				};
			} foreach _itemtypes;
		};
		if (count _packs > 0) then {
			_packtypes = _packs select 0;
			_packcounts = _packs select 1;
			{
				if (_x != "") then {
					_code = _code + format['_holder addbackpackcargoglobal ["%1",%2];',_x,(_packcounts select _foreachindex)];
				};
			} foreach _packtypes;
		};
		call compile _code;
		_counter = _counter + 1;
	};
};

// dropped suitcases/cash
_counter = 0;
while{true} do {
	_read = "gc" callExtension format["R|%1|%2|%3","__A3SERVER__","GC_Objects",_counter];
	if (_read == "") exitWith {};
	_read = call compile _read;
	_pos = _read select 0;
	_dir = _read select 1;
	_class = _read select 2;
	_droparray = _read select 3;
	_name = "";
	if (count _read > 4) then {
		_name = _read select 4;
	};
	_obj = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
	diag_log _read;
	_obj setposASL _pos;
	_obj setdir _dir;
	_obj setvariable["droparray",_droparray,true];
	if (_class == "Land_HumanSkull_F" and _name != "") then {_obj setvariable["nameskull",_name,true];};
	_obj enablesimulation false;
	_counter = _counter + 1;
};

//parked vehicles
reattach = [];
_counter = 0;
while{true} do {
	_read = "gc" callExtension format["R|%1|%2|%3","__A3SERVER__","GC_Vehicles",_counter];
	if (_read == "") exitWith {};
	_read = call compile _read;
	_pos = _read select 0;
	_dir = _read select 1;
	_damage = _read select 2;
	_class = _read select 3;
	_name = _read select 4;
	_weps = _read select 5;
	_mags = _read select 6;
	_trunk = _read select 7;
	_nitro = (_read select 8) call ISSE_str_StrToInt;
	_tuning = (_read select 9) call ISSE_str_StrToInt;
	_caralarm = (_read select 10) call ISSE_str_StrToInt;
	_customhorn = _read select 11;
	_radar = (_read select 12) call ISSE_str_StrToInt;
	_mount = _read select 13;
	_mounter = 0;
	if (_mount != "") then {
		_mounter = 1;
	};
	_skin = _read select 14;
	_bunny = _read select 15 call ISSE_str_StrToInt;
	_fuel = _read select 16;
	_on = _read select 17;
	_items = _read select 18;
	_packs = [];
	if (count _read > 19) then {
		_packs = _read select 19;
	};
	_mountinit = "";
	_bon = false;
	if (_on != "" and _on != "<NULL-object>") then {
		_on = call compile _on;
		_bon = true;
		_mountinit = format["
			if (%2 iskindof 'Quadbike_01_base_F') then {
				%2 attachto[%1,[0.0,-1.45,0.80]];
			} else {
				if (%2 iskindof 'Bicycle') then {
					%2 attachto[%1,[0.0,-1.4,0.27]];
				} else {
					%2 attachto[%1,[0.0,-1.65,0.80]];
				};
			};
			%2 setdir 0;
		",_on,_name];
	};
	_code = "";
	_bskin = false;
	if ((typename _skin) == "CODE") then {
		_code = [str(_skin),1,count (toArray str(_skin))-2] call BIS_fnc_TrimString;
		_bskin = true;
	};
	if (count _weps > 0) then {
		_weptypes = _weps select 0;
		_wepcounts = _weps select 1;
		{
			if (_x != "") then {
				_code = _code + format["%3 addweaponcargoglobal ['%1',%2];",_x,(_wepcounts select _foreachindex),_name];
			};
		} foreach _weptypes;
	};
	if (count _mags > 0) then {
		_magtypes = _mags select 0;
		_magcounts = _mags select 1;
		{
			if (_x != "") then {
				_code = _code + format["%3 addmagazinecargoglobal ['%1',%2];",_x,(_magcounts select _foreachindex),_name];
			};
		} foreach _magtypes;
	};
	if (count _items > 0) then {
		_itemtypes = _items select 0;
		_itemcounts = _items select 1;
		{
			if (_x != "") then {
				_code = _code + format["%3 additemcargoglobal ['%1',%2];",_x,(_itemcounts select _foreachindex),_name];
			};
		} foreach _itemtypes;
	};
	if (count _packs > 0) then {
		_packtypes = _packs select 0;
		_packcounts = _packs select 1;
		{
			if (_x != "") then {
				_code = _code + format["%3 addbackpackcargoglobal ['%1',%2];",_x,(_packcounts select _foreachindex),_name];
			};
		} foreach _packtypes;
	};
	diag_log _read;
	_vehicle = "";
	call compile format['
		%1 = createVehicle ["%2", %3, [], 0, "CAN_COLLIDE"];
		%1 setposASL %3;
	',_name,_class,_pos];
	call compile format['%1 setVehicleVarName "%1"; _vehicle = %1;',_name];
	call compile format['[[[%1,"%2","%3","%4"],"gc\global\GC_onVehicleCreated.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;',_vehicle,_name,_code,_mountinit];

	if (!_bon) then {_vehicle setdir _dir;};
	_vehicle setVariable["created",time,true];

	_vehicle setdamage _damage;
	_vehicle setfuel _fuel;
	_vehicle addEventHandler ["GetIn", {_this call onGetIn;}];
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	removeAllAssignedItems _vehicle;
	_vehicle lock 2;
	call compile _code;
	call compile _mountinit;
	
	if (count _trunk > 0) then {
		call compile format['
			%1_storage = %2;
			publicVariable "%1_storage";
		',_name,_trunk];
	};
	if (_bskin) then {_vehicle setvariable["customskin",_skin,true];};
	if (_nitro > 0) then {_vehicle setvariable["nitro",_nitro,true];};
	if (_tuning > 0) then {_vehicle setvariable["tuning",_tuning,true];};
	if (_caralarm > 0) then {
		_vehicle setvariable["caralarm",_caralarm,true];
		_vehicle setvariable["rolenum",0,true]; // will this work ok?-no this needs to be set by the owner
		_vehicle setVariable ["nextalarmtime", time, true];
		_vehicle addEventHandler ["Dammaged", {[_this] call onHit;}];	//will this work here? - no this needs to run by the owner
	};
	if (_customhorn != "") then {_vehicle setvariable["customhorn",_customhorn,true];};
	if (_radar > 0) then {_vehicle setvariable["radar",_radar,true];};
	if (_bunny > 0) then {_vehicle setvariable["bunnyhop",_bunny,true];};
	if (_mounter == 1) then {
		_arr = [];
		call compile format['
			_arr = [%1,"%2"];
			reattach = reattach + [_arr];
		',_vehicle,_mount];

	} else {
		call compile format['[[[%1,%2],"scripts\mountOnVcl\mount_vcl_init.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;',_vehicle,0];
	};
	if (_mountinit != "") then {_vehicle setvariable["mountedon",_on,true];};
	call compile format ['INV_ServerVclArray = INV_ServerVclArray + [%1]',_vehicle];
	_counter = _counter + 1;
};
{
	_parent = _x select 0;
	_mountst = _x select 1;
	_mountar = call compile _mountst;
	_mv = _mountar select 1;
	if (_mv iskindof "Quadbike_01_base_F") then { 
		_mv attachto[_parent,[0.0,-1.45,0.80]];
	} else {
		if (_mv iskindof "Bicycle") then {  //no bikes in A3? ;-( todo imago
			_mv attachto[_parent,[0.0,-1.4,0.27]];
		} else {
			_mv attachto[_parent,[0.0,-1.65,0.80]];
		};
	};
	_parent setvariable["mount",_mountar,true];
	call compile format['[[[%1,%2],"scripts\mountOnVcl\mount_vcl_init.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;',_parent,1];
	_mv setdir 0;
} foreach reattach;

actual_load_time = "gc" callExtension "epoch";
"gc" callExtension format["W|%1|%2|%3|%4","__A3SERVER__","GC_Server","LT",actual_load_time];
