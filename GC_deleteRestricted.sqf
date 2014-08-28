diag_log text format ["starting %1 at %2",__FILE__,time];
{
	if ((typeof _x) in restrictedVehicles) then {
		diag_log text format["Deleting bad thing: %1 (%3) driver %2",_x, driver _x, typeof _x];
		deleteVehicle _x;
	};
} foreach vehicles;
diag_log text format ["finished %1 at %2",__FILE__,time];