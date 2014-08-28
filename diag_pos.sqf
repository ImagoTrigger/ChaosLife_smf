_objs = [];
{
	_obj = _x select 0;	
	_obj2 = _x select 2;
	if (!(_obj in _objs)) then {[_objs, _obj] call BIS_fnc_arrayPush;};
	if (!(_obj2 in _objs) and _obj2 != dummyobj) then {[_objs, _obj2] call BIS_fnc_arrayPush;};
} foreach INV_ItemShops;
{ 
	_obj = _x select 1;
	if (!(_obj in _objs)) then {[_objs, _obj] call BIS_fnc_arrayPush;};
} foreach INV_Lizenzen;
{
	_obj = _x select 0;	
	_obj2 = _x select 3;	
	if (!(_obj in _objs)) then {[_objs, _obj] call BIS_fnc_arrayPush;};
	if (!(_obj2 in _objs) and _obj2 != dummyobj) then{[_objs, _obj2] call BIS_fnc_arrayPush;};
} foreach INV_ItemFabriken;
{
	_obj = _x select 0;
	if (!(_obj in _objs)) then {[_objs, _obj] call BIS_fnc_arrayPush;};
}foreach workplacearray;
_objs = _objs - [atm1];
_objs = _objs - [atm1_1];
_objs = _objs + bankflagarray;
_objs = _objs + workplacejob_deliveryflagarray;
[_objs, hostage] call BIS_fnc_arrayPush;
[_objs, assassin] call BIS_fnc_arrayPush;
[_objs, grapeprocess] call BIS_fnc_arrayPush;
[_objs, hopsprocess] call BIS_fnc_arrayPush;
[_objs, barleyprocess] call BIS_fnc_arrayPush;
[_objs, ryeprocess] call BIS_fnc_arrayPush;
[_objs, Oil_1] call BIS_fnc_arrayPush;
[_objs, ryeprocess] call BIS_fnc_arrayPush;
[_objs, cook] call BIS_fnc_arrayPush;
[_objs, impoundbuy] call BIS_fnc_arrayPush;
[_objs, impoundbuy2] call BIS_fnc_arrayPush;
[_objs, boatimpoundbuy] call BIS_fnc_arrayPush;
[_objs, prostituteflag] call BIS_fnc_arrayPush;

diag_log text format["Outputting the details of %1 objects",count _objs];
{ diag_log text format["[%1,%2,%3],",getposASL _x, getdir _x,_x]; } foreach _objs;