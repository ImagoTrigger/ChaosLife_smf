onplayerconnected {
	if (_name != "__SERVER__") then {
		//donators
		diag_log text format["CONNECTED: %1 %2 %3 %4",__FILE__,_uid, _name, _id];
		[_uid, "load", _name] call GC_Donators;
	};
};

onPlayerDisconnected {
	//remove from gang
	for "_c" from 0 to (count gangsarray - 1) do {
		_gangarray = gangsarray select _c;
		_gang   = _gangarray select 0;
		_members   = _gangarray select 1;

		if (_name in _members) then {
			_members = _members - [_name];
			_gangarray set[1, _members];
			format["gangsarray set[%1, %2]", _c, _gangarray] call broadcast;
		};
	};

	//donators
	_konto = [_name, "kontostand"] call ServerGetVar;
	if (!isNil "_konto") then {[_uid, "save", _name] call GC_Donators;};

	//log it
	"gc" callExtension format["W|%1|%2|%3|%4",_uid,_name,"Slot",""];
	
	diag_log text format["DISCONNECTED: %1 %2 %3",__FILE__,_uid, _name];
};
