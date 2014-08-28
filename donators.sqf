_uid = _this select 0;
_option = _this select 1;
_name = "";

if (count _this == 3) then {
  _name = _this select 2;
};

_startingMoney = 50000;
_paycheckMoney = 0;
_chaos = false;

// cav Expires On 2013-02-09
if (_uid == "6315712") then {
  _startingMoney = 999999;
  _paycheckMoney = 30000;
};
// Staan Expires On 2013-02-23
if (_uid == "43874246") then {
  _startingMoney = 250000;
  _paycheckMoney = 6000;
};
// Theboss Expires On 2013-02-24
if (_uid == "8119878") then {
  _startingMoney = 550000;
  _paycheckMoney = 18000;
};
// Xhoundz Expires On 2013-02-27
if (_uid == "72093062") then {
  _startingMoney = 550000;
  _paycheckMoney = 18000;
};
// Inception Expires On 2013-02-27
if (_uid == "28053574") then {
  _startingMoney = 550000;
  _paycheckMoney = 18000;
};
// Alexei Expires On 2013-02-28
if (_uid == "86591110") then {
  _startingMoney = 850000;
  _paycheckMoney = 30000;
};
// kingphil Expires On 2013-03-01
if (_uid == "98241926") then {
  _startingMoney = 650000;
  _paycheckMoney = 22000;
};
// predator Expires On 2013-03-01
if (_uid == "19050310") then {
  _startingMoney = 999999;
  _paycheckMoney = 30000;
};
// Philex Expires On 2013-03-01
if (_uid == "98763270") then {
  _startingMoney = 650000;
  _paycheckMoney = 22000;
};
// DOA Expires On 2018-01-25
if (_uid == "76561197997334191") then {
  _startingMoney = 250000;
  _paycheckMoney = 10000;
};
// Foster Expires On 2018-12-31
if (_uid == "10036422") then {
  _startingMoney = 2500000;
  _paycheckMoney = 50000;
};
// Predreus Expires On 2018-12-31
if (_uid == "4581632") then {
  _startingMoney = 250000;
  _paycheckMoney = 10000;
};
// Mash Expires On 2018-12-31
if (_uid == "62534854") then {
  _startingMoney = 250000;
  _paycheckMoney = 10000;
};
// Zargero Expires On 2018-12-31
if (_uid == "11004934") then {
  _startingMoney = 250000;
  _paycheckMoney = 10000;
};
// Decoy Expires On 2018-12-31
if (_uid == "18623046") then {
  _startingMoney = 250000;
  _paycheckMoney = 10000;
};
// Amerine Expires On 2018-12-31
if (_uid == "5804480") then {
  _startingMoney = 350000;
  _paycheckMoney = 12000;
};
// Durandal Expires On 2018-12-31
if (_uid == "33314758") then {
  _startingMoney = 350000;
  _paycheckMoney = 12000;
};
// Romans Expires On 2018-12-31
if (_uid == "322624") then {
  _startingMoney = 450000;
  _paycheckMoney = 10000;
};

//Normandy DEV
if (_uid == "76561198007109594") then {
  _startingMoney = 450000;
  _paycheckMoney = 10000;
};

//dcthehole DEV
if (_uid == "76561198059558795") then {
  _startingMoney = 450000;
  _paycheckMoney = 10000;
};
		//dcthehole 		 //normandy			//doa                             //amerine                      //durandal
if (_uid == "76561198059558795" or _uid == "76561198007109594" or _uid == "76561197997334191" or _uid == "76561197971985443" or _uid == "76561197993516950" or _uid == "10036422" or _uid == "5804480" or _uid == "33314758" or _uid == "11004934") then {_chaos = true;}; // amerine can add a column to donators NYI

_i = -1;
{
  _found = _x find _name;
  if (_found == 0) then {_i = _forEachIndex};
} forEach cashCache;

if (_i >= 0) then {
  _konto = (cashCache select _i) select 1;
  if (!(isNil "_konto")) then {
    _startingMoney = (cashCache select _i) select 1;
  };
};

if (_option == "load") then {
  [_name,"Kontostand",_startingMoney] call ServerSavePVar;
  [_name,"donatorcashbonus",_paycheckMoney] call ServerSavePVar;
  if (!(_name in loaded)) then {
  	[_name,"PlayerUID",[_uid]] call ServerSavePVar;
  	[_name,"chaos",_chaos] call ServerSavePVar;
  };
  loaded = loaded + [_name];
  diag_log text format["loaded donator for %1",_name];  
};

if (_option == "save") then {
	if (_name in loaded) then {
	  diag_log text format["saving donator for %1",_name];
	  _konto = [_name, "kontostand"] call ServerGetVar;

	  if (!(isNil "_konto")) then {
	    _i = -1;
	    {
	      _found = _x find _name;
	      if (_found == 0) then {_i = _forEachIndex};
	    } forEach cashCache;

	    if (_i >= 0) then {
	      (cashCache select _i) set [1, _konto];
	    } else {
	      cashCache = cashCache + [[_name, _konto]];
	    };
	  };
	  loaded = loaded - [_name];
	} else {
		diag_log text format["NOT saving donator for %1",_name];
	};
};
