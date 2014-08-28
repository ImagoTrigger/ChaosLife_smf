for [{_i=0}, {_i < (count publicarbeiterarctionarray)}, {_i=_i+1}] do {
	if ( (not((format["%1", ((publicarbeiterarctionarray select _i) select 1)]) call ISSE_UnitExists)) or (isNull((publicarbeiterarctionarray select _i) select 0)) ) then {
		if (not(isNull((publicarbeiterarctionarray select _i) select 0))) then
		{
			_object = ((publicarbeiterarctionarray select _i) select 0);
			_object setpos [0,0,0];
			deletevehicle _object;
		};
		publicarbeiterarctionarray SET [_i, ""];
		publicarbeiterarctionarray = publicarbeiterarctionarray - [""];
	};
};	