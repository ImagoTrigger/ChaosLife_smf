//remove abandoned vehicles from jail
{
	if (alive _x and count(crew _x) == 0) then {
		if (_x iskindof "air") then {
			_x setpos [(getPos impoundarea3 select 0)-(random 50)+(random 50), (getPos impoundarea3 select 1)-(random 50)+(random 50), getPos impoundarea3 select 2];
		} else {
			_x setpos [(getPos impoundarea1 select 0)-(random 50)+(random 50), (getPos impoundarea1 select 1)-(random 50)+(random 50), getPos impoundarea1 select 2];
		};
		_x setdamage 0;
		_x engineOn false;
		_x setvehiclelock "locked";
		format['%1 enablesimulation false;',_x] call broadcast;
	};
} foreach nearestObjects [(getMarkerPos "jailarea"),["LandVehicle","ship","Air","Tank"],30];