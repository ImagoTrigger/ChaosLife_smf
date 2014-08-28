private ["_agent","_turtles","_players","_code","_code2","_ctime","_bexists","_rabbits","_sheep","_class","_animals"];
{	if ({alive _x and isplayer _x} count nearestobjects [getmarkerpos (_x select 0), ["Man"], (_x select 1)] > 0) then {		_turtles = {alive _x} count nearestobjects [getmarkerpos (_x select 0), ["Turtle_F"], (_x select 1)];		_players = {alive _x and isplayer _x} count nearestobjects [getmarkerpos (_x select 0), ["Man"], (_x select 1)];		if ((_turtles - minagents) < _players) then {			_agent = createAgent ["Turtle_F", getmarkerpos (_x select 0), [], ((_x select 1) - ((_x select 1) / 1.5)), "FORM"];			_agent setDir (random 360);		};	}	} foreach turtlearray;
{
	if ({alive _x and isplayer _x} count nearestobjects [getmarkerpos (_x select 0), ["Man"], (_x select 1)] > 0) then {
		_rabbits = {alive _x} count nearestobjects [getmarkerpos (_x select 0), ["Rabbit_F"], (_x select 1)];
		_sheep = {alive _x} count nearestobjects [getmarkerpos (_x select 0), ["Sheep_random_F"], (_x select 1)];
		_players = {alive _x and isplayer _x} count nearestobjects [getmarkerpos (_x select 0), ["Man"], (_x select 1)];
		if ((_rabbits - minagents) < _players) then {
			_agent = createAgent ["Rabbit_F", getmarkerpos (_x select 0), [], ((_x select 1) - ((_x select 1) / 1.5)), "FORM"];
			_agent setDir (random 360);
		};
		if ((_sheep - minagents) < _players) then {
			_ctime = round(time);
			_bexists = false;
			call compile format['if (!isnil "cock_%1_%2") then {_bexists = true;};',rolestring, _ctime];
			if (!_bexists) then {				
				call compile format['
					sheep_%1_%2 = createAgent ["Sheep_random_F", %3, [],%4, "FORM"]; 
					sheep_%1_%2 setVehicleVarName "sheep_%1_%2"; 
					sheep_%1_%2 setDir (random 360);
				',rolestring, _ctime,getmarkerpos (_x select 0), ((_x select 1) - ((_x select 1) / 1.5))];
				_code = format['if (!isnil "sheep_%1_%2") then{sheep_%1_%2 setObjectMaterial [0, "\A3\animals_f_beta\Sheep\data\sheepShort.rvmat"];};',rolestring, _ctime];
				_code2 = format['if (!isnil "sheep_%1_%2") then{sheep_%1_%2 setObjectTexture [0, "\A3\animals_f_beta\Sheep\data\white_sheep_co.paa"];};',rolestring, _ctime];
				call compile format['if (!isnil "sheep_%1_%2") then{[[[sheep_%1_%2,"sheep_%1_%2",''%3'',''%4''],"gc\global\GC_onVehicleCreated.sqf"],"BIS_fnc_execVM",true,false] call BIS_fnc_MP;};',rolestring, _ctime,_code,_code2];
			};
		};			
	}	
} foreach huntingarray;	
{
	_animals = {alive _x} count nearestobjects [getmarkerpos (_x select 0), ambientanimals, (_x select 1)];
	if (_animals < minagents * 2) then {
		_class = (ambientanimals call BIS_fnc_selectRandom);
		if (_class == "Cock_random_F") then {
			_ctime = round(time);
			_bexists = false;
			call compile format['if (!isnil "cock_%1_%2") then {_bexists = true;};',rolestring, _ctime];
			if (!_bexists) then {
				call compile format['
					cock_%1_%2 = createAgent ["Cock_random_F", %3, [],%4, "FORM"]; 
					cock_%1_%2 setVehicleVarName "cock_%1_%2"; 
					cock_%1_%2 setDir (random 360);
					cock_%1_%2 setvariable["marker","%5",true];
				',rolestring, _ctime,getmarkerpos (_x select 0), ((_x select 1) - ((_x select 1) / 1.5)),(_x select 0)];
				_code = format['if (!isnil "cock_%1_%2") then{cock_%1_%2 setObjectMaterial [0, "\A3\animals_f_beta\Chicken\data\cock_brown.rvmat"];};',rolestring, _ctime];
				_code2 = format['if (!isnil "cock_%1_%2") then{cock_%1_%2 setObjectTexture [0, "\A3\animals_f_beta\Chicken\data\brown_rooster_CO.paa"];};',rolestring, _ctime];
				call compile format['if (!isnil "cock_%1_%2") then{[[[cock_%1_%2,"cock_%1_%2",''%3'',''%4''],"gc\global\GC_onVehicleCreated.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;};',rolestring, _ctime,_code,_code2];			
			};
		} else {
			_agent = createAgent [_class, getmarkerpos (_x select 0), [], ((_x select 1) - ((_x select 1) / 1.5)), "FORM"];
			_agent setDir (random 360);
			_agent setvariable["marker",(_x select 0),true];
		};
	};	
} foreach ambientarray;	