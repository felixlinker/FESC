/*
	Author: Fett_Li

	Description:
	Move a vehicle to a new spawnpoint with fadeout and engine sound. Is invoked
	on spawn point selection. Must be executed in scheduled environment.
*/

params [
	// Vehicle to move - must be local
	["_v", objNull, [objNull]],
	// Respective position (ATL) to move the vehicle to
	["_p", [], [[0,0,0]], [3, 2]]
];

if (!local _v) then {
	["Vehicle is not local to this machine"] call BIS_fnc_error;
};

if (hasInterface && canSuspend) then {
	cutText ["", "BLACK OUT", 1];
	sleep 1;

	playSound "bobcat_engine_start";
};

_v setPosATL _p;

if (hasInterface && canSuspend) then {
	sleep 2;

	cutText ["", "BLACK IN", 1];
};
