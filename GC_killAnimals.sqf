private ["_players","_ref","_agent"];
{
	_players = {alive _x and isplayer _x} count nearestobjects [getmarkerpos (_x select 0), ["Man"], (_x select 1)];
	if (_players == 0) then {
		{deletevehicle _x;} foreach nearestobjects [getmarkerpos (_x select 0), ["Turtle_F"], (_x select 1)];
	};
} foreach turtlearray;
{
	_players = {alive _x and isplayer _x} count nearestobjects [getmarkerpos (_x select 0), ["Man"], (_x select 1)];
	if (_players == 0) then {
		{deletevehicle _x;} foreach nearestobjects [getmarkerpos (_x select 0), ["Sheep_random_F","Rabbit_F"], (_x select 1)];
	};
} foreach huntingarray;
{
	_animal = agent _x;
	_class = typeof _animal;
	if (_class in ambientanimals) then {
		if (!alive _animal) then {
			deletevehicle _animal;
		} else {
			{
				if (_animal distance getmarkerpos (_x select 0) > (_x select 1)) then {
					if ((_x select 0) == _animal getvariable["marker",""]) then {
						deletevehicle _animal;
					};
				};
			} foreach ambientarray;
		};		
	};
} foreach agents;