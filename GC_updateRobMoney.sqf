if(robpoolsafe1 < maxinsafe)then{robpoolsafe1 = robpoolsafe1 + round random 3000; publicvariable "robpoolsafe1"} else {publicvariable "robpoolsafe1"};
if(robpoolsafe2 < maxinsafe)then{robpoolsafe2 = robpoolsafe2 + round random 3000; publicvariable "robpoolsafe2"} else {publicvariable "robpoolsafe2"};
if(robpoolsafe3 < maxinsafe)then{robpoolsafe3 = robpoolsafe3 + round random 3000; publicvariable "robpoolsafe3"} else {publicvariable "robpoolsafe3"};		
{
	_randomamount = ceil ((random 250) + 250);

	call compile format["
		if (%1money < maxstationmoney) then {
			%1money = %1money + _randomamount;
			if (%1money > maxstationmoney) then {
				%1money = maxstationmoney;
			};
		};

		publicvariable ""%1money"";
	", _x];
} forEach robbable;	
