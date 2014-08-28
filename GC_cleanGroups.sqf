private ["_gangFlagUser","_memberlistchanged","_name","_gname","_gopen","_newgangarray","_members","_gangarray","_gangdeleted","_label","_color","_gangmarker","_read","_gangname","_ga"];
//unset gang area users if not around
{
	_gangFlagUser = _x getVariable "mover";
	if (!isnil "_gangFlagUser") then {	
		if (!(_gangFlagUser in (nearestObjects [_x, ["Man"], 10]))) then {
			_x setVariable["mover", nil, true];
			diag_log text "unsetting mover for GA";
		};
	};
} forEach gangAreas;		

//empty gangs
if (time > 599) then {
	for "_c" from 0 to (count gangsarray - 1) do {
		_gangarray = gangsarray select _c;
		_gangname = _gangarray select 0;
		_gangdeleted = false;
		if (isNil "_gangarray") then {
			format['gangsarray set[%1, 0]; gangsarray = gangsarray - [0];', _c] call broadcast;
			_gangdeleted = true;
		} else {
			_members   = _gangarray select 1;
			if(isNil "_members" or count _members == 0) then {
				format['gangsarray set[%1, 0]; gangsarray = gangsarray - [0];', _c] call broadcast;
				_gangdeleted = true;
			} else {
				_memberlistchanged = false;
				{
					_name = _x;
					if({_x getvariable "deadname" == _name and side _x != west} count allunits == 0) then {
						_memberlistchanged = true;
						call compile format['_members = _members - ["%1"];',_name];
					};
				} foreach _members;
				if (_memberlistchanged) then {
					_gname = _gangarray select 0;
					_gopen = _gangarray select 2;
					_newgangarray = [_gname,_members,_gopen];
					format['gangsarray set[%1, %2];', _c, _newgangarray] call broadcast;
				};
			};
		};
		
		if (_gangdeleted) then {
			{
				_read = _x getvariable "control";
				_ga = _x;
				if (!isnil "_read") then {
					_gangmarker = "";
					_label = nil;
					_color = nil;
					if(_ga == gangarea1) then {
						if (_read == _gangname) then {
							_label = "Camp Maxwell (cocaine - lsd)";
							_ga setvariable["control",nil,true];
							_color = "ColorBlack";
						} else {
							_label = format["%1's Camp (cocaine - lsd)", _read];
							_color = "ColorOrange";
						};
						_gangmarker = "gangmarker1";
					};
					if(_ga == gangarea2) then {
						if (_read == _gangname) then {
							_label = "Camp Tempest (heroin - lsd)";
							_ga setvariable["control",nil,true];
							_color = "ColorBlack";
						} else {
							_label = format["%1's Camp (heroin - lsd)", _read];
							_color = "ColorOrange";
						};
						_gangmarker = "gangmarker2";
					};
					if(_ga == gangarea3) then {
						if (_read == _gangname) then {
							_label = "Camp Kill (heroin - marijuana)";
							_ga setvariable["control",nil,true];
							_color = "ColorBlack";
						} else {
							_label = format["%1's Camp (heroin - marijuana)", _read];
							_color = "ColorOrange";
						};
						_gangmarker = "gangmarker3";
					};
					if(_ga == gangarea4) then {
						if (_read == _gangname) then {
							_label = "Camp Xiros (marijuana - cocaine)";
							_ga setvariable["control",nil,true];
							_color = "ColorBlack";
						} else {
							_label = format["%1's Camp (marijuana - cocaine)", _read];
							_color = "ColorOrange";
						};
						_gangmarker = "gangmarker4";
					};
					if(_ga == gangarea5) then {
						if (_read == _gangname) then {
							_label = "Camp Tsoukala (all drugs)";
							_ga setvariable["control",nil,true];
							_color = "ColorBlack";
						} else {
							_label = format["%1's Camp (all drugs)", _read];
							_color = "ColorOrange";
						};
						_gangmarker = "gangmarker5";
					};						
					if (!isnil "_label") then {
						diag_log text format["server is setting %1 label to %2 becasue we deleted %3 gang",_gangmarker,_label,_gangname];
						_gangmarker setMarkerColor _color;
						_gangmarker setMarkerText _label;
					};
				};
			} foreach gangareas;
		};
	};
};

//empty groups
{
	if ((count (units _x)) == 0 and (side _x) != resistance) then {
		deleteGroup _x; 
		_x = grpNull; 
		_x = nil;
	};
} foreach allGroups;