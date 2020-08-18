/*
	AUTHOR: Fett_Li

	Description:
	Reads the variables of a strategic map mission module and turns them into
	an array that can be handed to BIS_fnc_StrategicMapOpen.

	Returns:
	ARRAY - BIS_fnc_StrategicMapOpen parameters
*/

params [
	// Strategic map mission module
	["_module", objNull, [objNull]],
	// All objects to move to a spawnpoint
	["_movables", [], [[]]]
];

if (typeOf _module != "ModuleStrategicMapMission_F") exitWith {
	["_module (%1) is no mission module", _module] call BIS_fnc_error;
};

private _code = _module getVariable ["Code", {}];
if (typeName _code == typeName "") then {
	_code = compile _code;
};

[
	getPosATL _module,
	FESC_fnc_spawnPointSelected,
	_module getVariable ["Title", ""],
	"",													// description
	"",													// mission's player name
	"",													// overview image
	parseNumber (_module getVariable ["Size", "1"]),	// size multiplier
	[_code, _movables]	// args
]

// Other variables of the module:
// _module getVariable ["Image", ""]
// _module getVariable ["Description", ""]
// _module getVariable ["Player", []]
