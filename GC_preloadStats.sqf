private ["_i","_pair","_writepairs","_storage","_read","_output","_oldslot","_newkeys","_keys","_inv","_lic","_bldg","_weps","_mags","_q_output","_w_output","_foreachindex","_s_output","_item","_itemType","_availkey","_pendkey","_ap_output","_items","_queue","_workerskey","_fid","_facname","_facs","_player","_owner","_name","_uid","_tls","_slot","_epoch","_a3","_"];
_player = _this select 0;
_owner = owner _player;
_name = name _player;
if (isMultiplayer) then {
	_uid = [_name, "PlayerUID"] call ServerGetVar;
	if (isnil "_uid") exitWith {
		diag_log text format ["%1 EXITWITH Name: %2 PlayerID: %3",__FILE__,_name,(getPlayerUID _player)];
		[_player] call ServerLoadVar;
	};
	_uid = _uid select 0;
} else {
	_uid = (getPlayerUID _player);
};

diag_log text format ["%1 %2 ClientID: %3 PlayerID: %4 Name: %5 UID: %6 @ %7",__LINE__,__FILE__,_owner,_player,_name,_uid,diag_ticktime];
for [{_i=1}, {_i <= civscount}, {_i=_i+1}] do {
	call compile format ["
		if(kopfcash_civ%1 > 0)then{_owner publicVariableClient ""kopfcash_civ%1""};
		if(civ%1_arrest > 0)then{_owner publicVariableClient ""civ%1_arrest""};
		if(civ%1_wanted > 0)then{_owner publicVariableClient ""civ%1_wanted""};
		if(count civ%1_reason > 0)then{_owner publicVariableClient ""civ%1_reason""};
	", _i];
};

_owner publicvariableClient "INV_itemstocks";
_owner publicvariableClient "life_objects";
_owner publicVariableClient "gangsarray";
_owner publicVariableClient "INV_ServerVclArray";
_owner publicvariableClient "workplacejob_taxi_serverarray";
_owner publicvariableClient "workplacejob_hostage_serverarray";
_owner publicvariableClient "workplacejob_assassin_serverarray";
_owner publicvariableClient "publicarbeiterarctionarray";

if (!isMultiplayer) exitwith{};

_read = format["R|%1|%2|%3",_uid,".","TLS"];
_tls = "gc" callExtension _read;
_writepairs = [];
if (_tls != "") then {
	[_name, "TLS", _tls] call ServerSavePVar;
};

_slot = format["%1",_player];
_epoch = "gc" callExtension "epoch";
_pair = ["Slot",[_slot]];
_writepairs = _writepairs + [_pair];
_pair = ["TC",_epoch];
_writepairs = _writepairs + [_pair];

_storage = [_name, "private_storage"] call ServerGetVar;
if (isnil "_storage") then {
	_read = format["R|%1|%2|%3",_uid,_name,"private_storage"];
	_output = "gc" callExtension _read;
	if (_output != "") then {
		_storage = call compile _output;
		_pair = ["private_storage",_storage];
		_writepairs = _writepairs + [_pair];
	};
};

_a3 = [_name, "GC_A3"] call ServerGetVar;
if (isnil "_a3") then {
	_read = format["R|%1|%2|%3",_uid,_name,"GC_A3"];
	_output = "gc" callExtension _read;
	if (_output != "") then {
		_a3 = call compile _output;
		_pair = ["GC_A3",_a3];
		_writepairs = _writepairs + [_pair];
	};
};

_bags = [_name, "INV_Tragfaehigkeit"] call ServerGetVar;
if (isnil "_bags") then {
	_read = format["R|%1|%2|%3",_uid,_name,"INV_Tragfaehigkeit"];
	_output = "gc" callExtension _read;
	if (_output != "") then {
		_bags = call compile _output;
		_pair = ["INV_Tragfaehigkeit",_bags];
		_writepairs = _writepairs + [_pair];
	};
};

_oldslot = [_name, "oldSlot"] call ServerGetVar;
if (isnil "_oldslot") then {
	_read = format["R|%1|%2|%3",_uid,_name,"oldSlot"];
	_output = "gc" callExtension _read;
	if (_output != "") then {
		_oldslot = call compile _output;
		_pair = ["oldSlot",_oldslot];
		_writepairs = _writepairs + [_pair];
	};
};

_keys = [_name, "INV_VehicleArray"] call ServerGetVar;
if (isnil "_keys") then {
	_read = format["R|%1|%2|%3",_uid,_name,"INV_VehicleArray"];
	_output = "gc" callExtension _read;
	if (_output != "") then {
		_keys = call compile _output;
		_newkeys = [];
		{
			if (!isnil "_x") then {
if (_x in INV_ServerVclArray) then {
				_newkeys = _newkeys + [_x];
};
			};
		} foreach _keys;
		_pair = ["INV_VehicleArray",_newkeys];
		_writepairs = _writepairs + [_pair];
	};
};

//GC Skills & last position
{
	_skill = [_name, _x] call ServerGetVar;
	if (isnil "_skill") then {
		_read = format["R|%1|%2|%3",_uid,_name,_x];
		_output = "gc" callExtension _read;
		if (_output != "") then {
			_skill = call compile _output;
			_pair = [_x,_skill];
			_writepairs = _writepairs + [_pair];
		};
	};
} foreach GC_Skills + ["GC_LastPos"];

//only load this stuff for donators
//donator = [_name, "donatorcashbonus"] call ServerGetVar;
//if (!isnil "_donator") then {
//	if (_donator > 0) then {
		_inv = [_name, "INV"] call ServerGetVar;
		if (isnil "_inv") then {
			_read = format["R|%1|%2|%3",_uid,_name,"INV"];
			_output = "gc" callExtension _read;
			if (_output != "") then {
				_inv = call compile _output;
				//[_name, "INV", _inv] call ServerSavePVar;
				_pair = ["INV",_inv];
				_writepairs = _writepairs + [_pair];
			};
		};
		_lic = [_name, "INV_LizenzOwner"] call ServerGetVar;
		if (isnil "_lic") then {
			_read = format["R|%1|%2|%3",_uid,_name,"INV_LizenzOwner"];
			_output = "gc" callExtension _read;
			if (_output != "") then {
				_lic = call compile _output;
				//[_name, "INV_LizenzOwner", _lic] call ServerSavePVar;
				_pair = ["INV_LizenzOwner",_lic];
				_writepairs = _writepairs + [_pair];
			};
		};
		_bldg = [_name, "BuildingsOwnerArray"] call ServerGetVar;
		if (isnil "_bldg") then {
			_read = format["R|%1|%2|%3",_uid,_name,"BuildingsOwnerArray"];
			_output = "gc" callExtension _read;
			if (_output != "") then {
				_bldg = call compile _output;
				//[_name, "BuildingsOwnerArray", _bldg] call ServerSavePVar;
				_pair = ["BuildingsOwnerArray",_bldg];
				_writepairs = _writepairs + [_pair];
			};
		};
		_weps = [_name, "playerweapons"] call ServerGetVar;
		if (isnil "_weps") then {
			_read = format["R|%1|%2|%3",_uid,_name,"playerweapons"];
			_output = "gc" callExtension _read;
			if (_output != "") then {
				_weps = call compile _output;
				//[_name, "playerweapons", _weps] call ServerSavePVar;
				_pair = ["playerweapons",_weps];
				_writepairs = _writepairs + [_pair];
			};
		};
		_mags = [_name, "playermagazines"] call ServerGetVar;
		if (isnil "_mags") then {
			_read = format["R|%1|%2|%3",_uid,_name,"playermagazines"];
			_output = "gc" callExtension _read;
			if (_output != "") then {
				_mags = call compile _output;
				//[_name, "playermagazines", _mags] call ServerSavePVar;
				_pair = ["playermagazines",_mags];
				_writepairs = _writepairs + [_pair];
			};
		};
		_facs = [_name, "INV_Fabrikowner"] call ServerGetVar;
		if (isnil "_facs") then {
			_read = format["R|%1|%2|%3",_uid,_name,"INV_Fabrikowner"];
			_output = "gc" callExtension _read;
			if (_output != "") then {
				_facs = call compile _output;
				{
					_facname = _x;
					{
						_fid = _x select 1;
						if (_fid == _facname) then {
							_items = _x select 5;
							_storage = _x select 7;
							_queue = _x select 8;
							_read = format["R|%1|%2|%3_%4",_uid,_name,_facname,"queue"];
							_output = "gc" callExtension _read;
							if (_output != "") then {
								_q_output = call compile _output;
								//[_name,_queue,_q_output] call ServerSavePVar;
								_pair = [_queue,_q_output];
								_writepairs = _writepairs + [_pair];
							};
							_workerskey = format['%1workers',_queue];
							_read = format["R|%1|%2|%3_%4",_uid,_name,_facname,"workers"];
							_output = "gc" callExtension _read;
							if (_output != "") then {
								_w_output = call compile _output;
								//[_name,_workerskey,_w_output] call ServerSavePVar;
								_pair = [_workerskey,_w_output];
								_writepairs = _writepairs + [_pair];
							};
							_read = format["R|%1|%2|%3_%4",_uid,_name,_facname,"storage"];
							_output = "gc" callExtension _read;
							if (_output != "") then {
								_s_output = call compile _output;
								//[_name,_storage,_s_output] call ServerSavePVar;
								{
									_item = _x select 0;
									_itemType = _item call INV_getitemKindOf;
									if (_itemType == "bomb" or _itemType == "static" or _itemType == "cash") then {
										_s_output set [_foreachindex, ""];
										_s_output = _s_output - [""];
									};
								} foreach _s_output;
								_pair = [_storage,_s_output];
								_writepairs = _writepairs + [_pair];
							};
							{
								_read = format["R|%1|%2|%3_%4",_uid,_name,_facname,_x];
								_output = "gc" callExtension _read;
								if (_output != "") then {
									_ap_output = call compile _output;
									if (count _ap_output > 1) then {
										_availkey = format['%1avail',_x];
										_pendkey = format['%1pend',_x];
										_pair = [_availkey,(_ap_output select 0)];
										_writepairs = _writepairs + [_pair];
										_pair = [_pendkey,(_ap_output select 1)];
										_writepairs = _writepairs + [_pair];
									};
								};
							} forEach _items;
						};
					} foreach INV_ItemFabriken;
				} foreach _facs;
				_pair = ["INV_Fabrikowner",_facs];
				_writepairs = _writepairs + [_pair];
			};
		};
//	};

//};
"gc" callExtension format["D|%1|%2",_uid,_name];
{
	[_player,(_x select 0),(_x select 1)] call ServerSaveVar;
} foreach _writepairs;
[_player] call ServerLoadVar;

diag_log text format ["LOADED %1 %2 ClientID: %3 PlayerID: %4 Name: %5 UID: %6 @ %7",__LINE__,__FILE__,_owner,_player,_name,_uid,diag_ticktime];
