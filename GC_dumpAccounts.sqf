{
	_delete = false;
	_account = nil;
	if (typename _x == "ARRAY") then {_account = _x;} else {_delete = true;};
	if (isnil "_account") then {_delete = true; } else {
		_name = (_account select 0);
		if (!isnil "_name") then {
			if (({(_x select 0) == _name} count cashCache == 0) and not(_name in loaded)) then {_delete = true;};
		} else {
			_delete = true;
		};
	};
	if (_delete) then {
		serverKontoArray set [_foreachindex,""];
		serverKontoArray = serverKontoArray - [""];
	};
} foreach serverKontoArray;
