//if no cops within 50m, lower gates
{
	call compile format["
		_pos = (getPos cgate%1%2 select 2);
		_westCount = {side _x == west && _x distance copgate%1 <= 50} count playableUnits;
		if (_westCount == 0 and _pos > -4) then {
			[0,0,0,[%1, ""lower""]] call operateGates;
		};
	", _x,6];
} forEach [2, 3, 4, 5];	

