//remove stale taxi ai
for [{_i=0}, {_i < (count workplacejob_taxi_serverarray)}, {_i=_i+1}] do {
	if (isNull ((workplacejob_taxi_serverarray select _i) select 0)) then {
		if (!(isNull ((workplacejob_taxi_serverarray select _i) select 1))) then {	
			deleteVehicle ((workplacejob_taxi_serverarray select _i) select 1);
		};
		workplacejob_taxi_serverarray set [_i,""];
		workplacejob_taxi_serverarray = workplacejob_taxi_serverarray - [""];
	};				

};