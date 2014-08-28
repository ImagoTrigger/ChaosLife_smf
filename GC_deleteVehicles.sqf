_thetime = time;
_hours = 2 * 3600;
/*
{
	_carpark = _x select 0;
	_distance = _x select 1;
	{
		_entered = _x getvariable "entered";
		if (isnil "_entered") then { _entered = 0; };	
		if ((_entered + _hours) <= _thetime) then {
			if ((count crew _x) == 0) then {
				diag_log text format["%1 DELETING PARKED VEHICLE %2 %3",__LINE__,__FILE__,_x];
				deletevehicle _x;
			};
		};		
	} foreach (position _carpark nearObjects["LandVehicle",_distance]);
} forEach INV_VehicleGaragen;
*/

{
	_entered = _x getvariable "entered";
	if (isnil "_entered") then { _entered = 0; };	
	if ((_entered + _hours) <= _thetime) then {
		if ((count crew _x) == 0) then {
			diag_log text format["%1 DELETING IMPOUNDED LAND VEHICLE %2 %3",__LINE__,__FILE__,_x];
			deletevehicle _x;
		};
	};		
} foreach (position impoundarea1 nearObjects["LandVehicle",200]);
{
	_entered = _x getvariable "entered";
	if (isnil "_entered") then { _entered = 0; };	
	if ((_entered + _hours) <= _thetime) then {
		if ((count crew _x) == 0) then {
			diag_log text format["%1 DELETING IMPOUNDED AIR VEHICLE %2 %3",__LINE__,__FILE__,_x];
			deletevehicle _x;
		};
	};		
} foreach (position impoundarea3 nearObjects["Air",200]);

//#119 Boat Impound TODO NYI A3 Imago