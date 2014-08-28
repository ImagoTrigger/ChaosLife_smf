//why does this loop konto array 3* ? NYI

ServerGetVar = {
  private ["_c", "_Fplayername", "_Fvarname", "_Ffound", "_Fvargefunden", "_return"];
  _Fplayername  = _this select 0;
  _Fvarname     = _this select 1;
  _Ffound       = false;
  _Fvargefunden = true;
  _return       = nil;

  for [{_c=0}, {_c < (count serverKontoArray)}, {_c=_c+1}] do {
    if (((serverKontoArray select _c) select 0) == (_Fplayername)) then {
      _Ffound = true;
    };
  };

  if (!(_Ffound)) then {
    serverKontoArray = serverKontoArray + [[(_Fplayername)]];
  };

  for [{_c=0}, {_c < (count serverKontoArray)}, {_c=_c+1}] do {

    if (((serverKontoArray select _c) select 0) == (_Fplayername)) then {
      _Fvargefunden = false;

      for [{_b=1}, {_b < (count (serverKontoArray select _c))}, {_b=_b+1}] do {

        if ((((serverKontoArray select _c) select _b) select 0) == _Fvarname) then {
          _return = ((serverKontoArray select _c) select _b) select 1;
          _Fvargefunden = true;
        };
      };
    };
  };

  if (!isnil "_return") then {_return};
};

ServerSaveVar = 

{

private ["_c", "_Fplayer", "_Fvarname", "_Fvarvalue", "_Ffound", "_Fvargefunden","_uid"];

_Fplayer      = _this select 0;
_Fvarname     = _this select 1;
_Fvarvalue    = _this select 2;
_Ffound       = false;
_Fvargefunden = true;
_Fname = nil;
if (!alive _Fplayer) then {
	_Fname = _Fplayer getVariable "deadname";
} else {
	_Fname = name _Fplayer;
};
_uid = (([_Fname, "PlayerUID"] call ServerGetVar) select 0);

for [{_c=0}, {_c < (count serverKontoArray)}, {_c=_c+1}] do 

	{

	if (((serverKontoArray select _c) select 0) == (_Fname)) then {_Ffound = true;};

	};

if (!(_Ffound)) then {serverKontoArray = serverKontoArray + [ [ (_Fname) ] ];};

for [{_c=0}, {_c < (count serverKontoArray)}, {_c=_c+1}] do 

	{

	if (((serverKontoArray select _c) select 0) == (_Fname)) then 

		{

			_Fvargefunden = false;

			for [{_b=1}, {_b < (count (serverKontoArray select _c))}, {_b=_b+1}] do 

				{

				if ((((serverKontoArray select _c) select _b) select 0) == _Fvarname) then 

					{

						(serverKontoArray select _c) set [_b, [_Fvarname, _Fvarvalue]];
						_Fvargefunden = true;
						//if (_Fvarname == "private_storage") then {
							//diag_log text format ["STORAGE:%1~~%2",_Fname,_Fvarvalue];
							_write = format["W|%1|%2|%3|%4",_uid,_Fname,_Fvarname,_Fvarvalue];
							"gc" callExtension _write;
						//};
					};
				};

			if (not(_Fvargefunden)) then {
				serverKontoArray SET [_c, ((serverKontoArray select _c) + [ [_Fvarname, _Fvarvalue] ])];
				//if (_Fvarname == "private_storage") then {
					//diag_log text format ["STORAGE:%1~~%2",_Fname,_Fvarvalue];
					_write = format["W|%1|%2|%3|%4",_uid,_Fname,_Fvarname,_Fvarvalue];
					"gc" callExtension _write;
				//};
			};

		};

	};

true

};


ServerSavePVar = 

{

private ["_c", "_Fplayer", "_Fvarname", "_Fvarvalue", "_Ffound", "_Fvargefunden"];

_Fplayer      = _this select 0;
_Fvarname     = _this select 1;
_Fvarvalue    = _this select 2;
_Ffound       = false;
_Fvargefunden = true;

for [{_c=0}, {_c < (count serverKontoArray)}, {_c=_c+1}] do 

	{

	if (((serverKontoArray select _c) select 0) == _Fplayer) then {_Ffound = true;};

	};

if (!(_Ffound)) then {serverKontoArray = serverKontoArray + [ [ _Fplayer ] ];};

for [{_c=0}, {_c < (count serverKontoArray)}, {_c=_c+1}] do 

	{

	if (((serverKontoArray select _c) select 0) == _Fplayer) then 

		{

		_Fvargefunden = false;
	
		for [{_b=1}, {_b < (count (serverKontoArray select _c))}, {_b=_b+1}] do 

			{

			if ((((serverKontoArray select _c) select _b) select 0) == _Fvarname) then 

				{

					(serverKontoArray select _c) set [_b, [_Fvarname, _Fvarvalue]];
					_Fvargefunden = true;

				};

			};

		if (not(_Fvargefunden)) then {serverKontoArray SET [_c, ((serverKontoArray select _c) + [ [_Fvarname, _Fvarvalue] ])];};

		};

	};

true

};

ServerClearKonto = 

{

private ["_i", "_j", "_k", "_arr", "_return", "_name"];

_name   = ""; 
if ((count _this) > 0) then {_name = _this select 0;};
_return = 0;

for [{_i=0}, {_i < (count serverKontoArray)}, {_i=_i+1}] do 

	{

	for [{_j=1}, {_j < (count ((serverKontoArray) select _i))}, {_j=_j+1}] do 

		{

		if ( (((serverKontoArray select _i) select 0) == _name) or (_name == "")  ) then 

			{

			if (( typeName (((serverKontoArray select _i) select _j) select 1) ) == "ARRAY") then 

				{

				for [{_k=0}, {_k < (count (((serverKontoArray select _i) select _j) select 1))}, {_k=_k+1}] do 

					{

					if ((typeName ((((serverKontoArray select _i) select _j) select 1) select _k)) == "OBJECT") then 

						{

						if (isNull((((serverKontoArray select _i) select _j) select 1) select _k)) then 

							{

							_arr = (((serverKontoArray select _i) select _j) select 1);
							_arr set [_k, "KontoDeleteString"]; 
							_arr = _arr - ["KontoDeleteString"];
							((serverKontoArray select _i) select _j) set [1, _arr];
							_return = _return + 1;

							};

						};

					};

				};

			if (( typeName (((serverKontoArray select _i) select _j) select 1) ) == "OBJECT") then {};

			};

		};

	};

_return;

};

ServerLoadVar = {

	private ["_spieler", "_name", "_found", "_statarray", "_i", "_j", "_k"];

	_spieler   = (_this select 0);

	if (!alive _spieler) then {
		_name = _spieler getVariable "deadname";
	} else {
		_name = name _spieler;
	};
	if (isnil "_name") then {_name = "Error: No Name";};

	_found     = false;
	_statarray = [];
	[_name] call ServerClearKonto; //why?
	{
		_delete = false;
		_account = nil;
		_accountindex = _foreachindex;
		if (typename _x == "ARRAY") then {_account = _x;} else {_delete = true;};
		if (isnil "_account") then {_delete = true; } else {
			if ((count _account) <= 1) then {_delete = true;};
		};
		if (_delete) then {
			serverKontoArray set [_accountindex,""];
			serverKontoArray = serverKontoArray - [""];
		} else {
			if (_name == (_x select 0)) exitWith {
				_statarray = (_x) - [(_x select 0)];
				_found = true;
			}; 
		};
	} forEach serverKontoArray;
	
	if (_found) then {
		_statstr = format["%1",_statarray];
		_statlencheck = _statstr call ISSE_str_Length;
		if (_statlencheck >= 2024) then { //https://dev-heaven.net/issues/52710
			_statchunk = [];
			_statlentot = 0;
			_statlenchunk = 0;
			_sent = false;
			{
				_statstr = format["%1",_x];
				_statlen = _statstr call ISSE_str_Length;
				_statlentot = _statlentot + _statlen;
				_statlenchunk = _statlenchunk + _statlen;
				_statchunk = _statchunk + [_x];
				if (round(_statlenchunk/1024) >= 1) then {
					[format["%1 spawn ClientLoadVar;",_statchunk], owner _spieler] call broadcast_cli;
					_statchunk = [];
					_statlenchunk = 0;
					_sent = true;
				} else {
					_sent = false;
				};
			} foreach _statarray;
			if (!_sent) then {
				[format["%1 spawn ClientLoadVar;",_statchunk], owner _spieler] call broadcast_cli;
			};
			diag_log text format["ServerLoadVar sent large statarray: %1 chars total.",_statlentot];
		} else {
			[format["%1 spawn ClientLoadVar;",_statarray], owner _spieler] call broadcast_cli;
		};
	} else {
		["[] spawn ClientLoadVar;", owner _spieler] call broadcast_cli;
	};
_found
};