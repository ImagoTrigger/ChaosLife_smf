{
	_npc = _x getvariable "NPC";
	_created = _x getvariable "created";
	if (isnil "_npc" and isnil "_created") then {
		deleteVehicle _x;
	};
	if (!isnil "_created") then {
		_deadtime = _x getvariable "deadtime";
		if (isnil "_deadtime") then {
			_x setvariable["deadtime",time,false];
		} else {
			if (_deadtime + 300 <= time) then {
				deletevehicle _x;
			};
		};
	};
} foreach AllDead;
