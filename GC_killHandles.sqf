diag_log text format ["starting %1 at %2",__FILE__,time];

_spawnarr = _this;
_now = time;
{
	_name = _x select 0;
	_started = _x select 1;
	_handle = _x select 2;
	_timeout = _x select 3;
	if ((_started + _timeout) <= _now) then {
		if (!scriptDone _handle) then {
			terminate _handle;
			diag_log text format["TERMINATED %1 was started at %2!",_name,_started];
		};	
	};
} foreach _spawnarr;


diag_log text format ["finished %1 at %2",__FILE__,time];