// Amerine <mark@amerine.net> for Chaos Life
currentTables = [];

/* Table structure
  0 - int Table number
  1 - Array players
    1 - 0 player
    1 - 1 Array Player Cards
  2 - Array Deck
  3 - int deckIndex
  4 - boolean gameDealed
  5 - Array dealerCards
*/

testTable = [100, [], [], 0, false, []];
currentTables set [0, testTable];

GC_FNC_SRV_GetDeck = {
  private ["_temp", "_deck"];

  _deck = [];
  for "_i" from 1 to 52 do {
    _deck set [count _deck, _i];
  };

  for [{_i=count _deck-1}, {_i > 0}, {_i=_i-1}] do {
    _j = floor((random 1) * _i);
    _temp = _deck select _i;
    _deck set [_i, _deck select _j];
    _deck set [_j, _temp];
  };

  _deck;
};

GC_FNC_SRV_GetTable = {
  _player = _this select 0;
  _table = _player call GC_FNC_SRV_FindTable;
  [[_table select 0], "GC_FNC_SetTable", _player, false] spawn BIS_fnc_MP;
};

GC_FNC_SRV_FindTableById = {
  private["_table", "_tableId"];
  _tableId = _this;
  {
    if (_x select 0 == _tableId) then {
      _table = _x;
    };
  } forEach currentTables;

  _table;
};

GC_FNC_SRV_GetHand = {
  private ["_tableId", "_player", "_table", "_playerHand"];
  _tableId    = _this select 0;
  _player     = _this select 1;
  _table      = nil;
  _playerHand = nil;

  {
    if (_x select 0 == _tableId) then {
      _table = _x;
    };
  } forEach currentTables;


  if (!isNil("_table")) then {
    if (_table call GC_FNC_TableDealt) then {
      {
        if ((_x select 0) == _player) then {
          _playerHand = _x select 1;
        };
      } forEach (_table select 1);
    } else {
      _table call GC_FNC_DealTable;
      waitUntil { !!(_table call GC_FNC_TableDealt) };
      {
        if ((_x select 0) == _player) then {
          _playerHand = (_x select 1);
        };
      } forEach (_table select 1);
    };

    [[_playerHand], "GC_FNC_SetHand", _player, false] spawn BIS_fnc_MP;
  };
};

GC_FNC_SRV_FindTable = {
  _player = _this;
  _foundTable = nil;

  {
    _players = _x select 1;
    if (_player in _players) then {
      _foundTable = _x;
    };
  } forEach currentTables;

  if (isNil("_foundTable")) then {
    _randomTable = currentTables call BIS_fnc_selectRandom;
    _currentPlayers = _randomTable select 1;
    _currentPlayers set [count _currentPlayers, [_player, []]];
    _randomTable set [1, _currentPlayers];

    _foundTable = _randomTable;
  };

  _foundTable;
};

GC_FNC_TableDealt = {
  _table = _this;
  !!(_table select 4);
};

GC_FNC_DealTable = {
  _table = _this;
  _table set [2, call GC_FNC_SRV_GetDeck];
  _table call GC_FNC_DistributeCards;
  _table set [4, true]; // Table dealt
};

GC_FNC_DistributeCards = {
  _table = _this;
  _players = _table select 1;

  // Players
  {
    _x set[1, ([_table, _x select 1] call GC_FNC_AddCard)];
  } forEach _players;

  // Dealer
  _table set [5, ([_table, _table select 5] call GC_FNC_AddCard)];

  // Players Again
  {
    _x set[1, ([_table, _x select 1] call GC_FNC_AddCard)];
  } forEach _players;

  // Dealer Again
  _table set [5, ([_table, _table select 5] call GC_FNC_AddCard)];
};

GC_FNC_AddCard = {
  _table        = _this select 0;
  _currentCards = _this select 1;
  _cardIndex    = _table select 3;
  _nextCard     = (_table select 2) select _cardIndex;

  _cardIndex = _cardIndex + 1;
  _table set [3, _cardIndex];

  _currentCards set [count _currentCards, _nextCard];
  _currentCards;
};

GC_FNC_SRV_HitPlayer = {
  private["_tableId", "_player", "_table"];
  _tableId = _this select 0;
  _player  = _this select 1;
  _table   = (_tableId call GC_FNC_SRV_FindTableById);

  if (!isNil("_table")) then {
    {
      if ((_x select 0) == _player) then {
        _x set[1, ([_table, _x select 1] call GC_FNC_AddCard)];
        _playerHand = (_x select 1);
        diag_log format ["Player Hand: %1", _playerHand];
        [[_playerHand], "GC_FNC_SetHand", _player, false] spawn BIS_fnc_MP;
      };
    } forEach (_table select 1);
  };
};