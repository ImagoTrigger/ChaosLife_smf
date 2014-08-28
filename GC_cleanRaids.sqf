_thiscount = count(raidarray);
if (_thiscount != lastraidcount) then {
	lastraidcount = _thiscount;
	_nocops = true;
	{
		if (side _x == west) then {
			_pos = getPosATL (vehicle _x);
			_xp = _pos select 0;
			_y = _pos select 1;
			if (!((_y > (((-12.476) * _xp) + 36064)) and (_y < (((-0.0487) * _xp) + 5578)) and (_y < (((-12.417) * _xp) + 73214)) and (_y > (((-0.0118) * _xp) + 2462)))) then {
				_nocops = false;
			};
		};
	} foreach playableunits;
	if (_nocops) then {
		'
			if (!isServer and iscop) then {
				raidarray = []; 
				copraidarray = []; 
				not_raiding = true;
			};
			hint "Police are no longer outside the border!";
		' call broadcast;
	};
};