GC_Hawks = {
	private ["_flockPos","_flockArea","_flockCount","_wp0","_wp1","_wp2","_wp3","_wps","_crowList","_crow"];

	_flockPos = _this select 0;
	_flockArea = if (count _this > 1) then {_this select 1} else {50};
	_flockCount = if (count _this > 2) then {_this select 2} else {_flockArea / 5};
	_flockHeight = if (count _this > 3) then {_this select 3} else {20};

	if (typename _flockPos == typename objnull) then {_flockPos = position _flockPos};
	if (typename _flockPos == typename "") then {_flockPos = markerpos _flockPos};

	_flockPos set [2,_flockHeight];
	_wp0 = [_flockPos, _flockArea, 00] call GC_relPos;
	_wp1 = [_flockPos, _flockArea, 090] call GC_relPos;
	_wp2 = [_flockPos, _flockArea, 180] call GC_relPos;
	_wp3 = [_flockPos, _flockArea, 270] call GC_relPos;
	_wps = [_wp0,_wp1,_wp2,_wp3];

	_crowList = [];
	for "_i" from 1 to _flockCount do {
		_crow = "Kestrel_Random_F" createvehicle [
			(_flockPos select 0) - _flockArea + (random _flockArea)*2,
			(_flockPos select 1) - _flockArea + (random _flockArea)*2,
			_flockHeight
		];
		[_crow,_wp0,_wp1,_wp2,_wp3,_flockArea] execfsm "gc\global\GC_flock.fsm";
		_crowList = _crowList + [_crow];
	};

	_crowList;
};

//birds (can't kill em, yet)
{_x call GC_Hawks;} foreach huntingarray;  //not really an agent, yet (A3 NYI BIS Imago)?




//rabbits
for [{_i=0}, {_i < maxboars}, {_i=_i+1}] do {
	_rabbit = createAgent ["Rabbit_F_GC", (getmarkerpos "boarhunting"), [], 150, "NONE"];
};

//snakes
for [{_i=0}, {_i < maxcows}, {_i=_i+1}] do {
	_snake = createAgent ["Snake_random_F_GC", (getmarkerpos "boarhunting"), [], 150, "NONE"];
};

//fish
{
	_pos = (getmarkerpos _x);
	_posx = _pos select 0;
	_posy = _pos select 1;
	_posz = _pos select 2;
	_newpos = [_posx,_posy,(_posz - 1)];			
	{
		_fish = createAgent [_x, _newpos, [], 3, "NONE"];
	} foreach fishtypes;	
} foreach ["bassarea","percharea","walleyearea","troutarea"];