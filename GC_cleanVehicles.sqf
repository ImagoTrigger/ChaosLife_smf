//diag_log text format ["starting %1 at %2",__FILE__,time];
_changed = false;
{
	if (isNull _x) then {
		INV_ServerVclArray set [_forEachIndex, ""];
		INV_ServerVclArray = INV_ServerVclArray - [""];
		_changed = true;
	};
} foreach INV_ServerVclArray;

/*
{
	if (!(_x in INV_ServerVclArray)) then {
		_created = _x getvariable "created";
		if (!isnil "_created") then {
			diag_log text format["%1 CLEANING CREATED VEHICLE NOT IN ARRAY %2 %3",__LINE__,__FILE__,_x];
			deletevehicle _x;
		};
	};
} foreach vehicles;
*/

if (_changed) then {
	publicVariable "INV_ServerVclArray"; 
	//diag_log text format["%1 BROADCASTING NEW VEHICLE LIST %2 (Count of INV_ServerVclArray: %3)",__LINE__,__FILE__,count INV_ServerVclArray];
};

//diag_log text format ["finished %1 at %2",__FILE__,time];
