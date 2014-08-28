//ImagoTrigger <imagotrigger@gmail.com> for Chaos Life
_param = ((_this) select 1);
switch(((_this) select 0)) do {
	case "level":  {
		_param setpos [((getpos _param) select 0),((getpos _param) select 1),(((getpos _param) select 2) + 0.1)];
		_param setvectorup [0,0,1];
	};
	case "seat": {
		_chair = "Land_ChairPlastic_F" createVehicle getPos _param;
		_chair setPos (getPos _param);
		_chair setDir ((getDir _param) - 90);
		_param setDir (getDir _chair);
		_chair spawn {
			sleep 0.15;
			_this enableSimulation false;

		};			
	};
	case "groups": {
		_west = 0;
		_civ = 0;
		_east = 0;
		_counter_west = 0;
		_counter_civ = 0;
		_counter_east = 0;
		call compile format["copnpcgrp%1 = creategroup west;",_counter_west];
		call compile format["civnpcgrp%1 = creategroup civilian;",_counter_civ];
		call compile format["eastnpcgrp%1 = creategroup east;",_counter_east];
		{	
			if (!(_x in playableunits) and !(tolower(typeOf _x) in AIArray)) then {
				if (side (group _x) == west) then {
					_west = _west +1;
					if ((_west % _param) == 0) then {
						_counter_west = _counter_west + 1;
						call compile format["copnpcgrp%1 = creategroup west;",_counter_west];
					};				
					call compile format["[_x] joinsilent copnpcgrp%1;",_counter_west];
				};
				if ((side (group _x)) == CIVILIAN or (side (group _x)) == Resistance) then {
					_civ = _civ +1;
					if ((_civ % _param) == 0) then {
						_counter_civ = _counter_civ + 1;
						call compile format["civnpcgrp%1 = creategroup civilian;",_counter_civ];
					};
					call compile format["[_x] joinsilent civnpcgrp%1;",_counter_civ];
				};
				if (side (group _x) == east) then {
					_east = _east +1;
					if ((_east % _param) == 0) then {
						_counter_east = _counter_east + 1;
						call compile format["eastnpcgrp%1 = creategroup east;",_counter_east];
					};
					call compile format["[_x] joinsilent eastnpcgrp%1;",_counter_east];
				};				
			};
		} foreach allUnits;		
		diag_log text format["there are %1 WEST npcs, %2 CIV npcs and %6 EAST npcs so we made %3 WEST groups, %4 CIV groups and %5 EAST groups!",_west,_civ,(abs(_west/_param)),(abs(_civ/_param)),(abs(_east/_param)),_east];		
		{
			diag_log text format["Group %1 Units: %2",_x,units _x];			
		} foreach allGroups;
		
				
	};	
	default {
		diag_log text format["Invalid function called to serverfunc, param: %1",_x];
	};
};


