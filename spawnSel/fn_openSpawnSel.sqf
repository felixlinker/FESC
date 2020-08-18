/*
	AUTHOR: Fett_Li

	Description:
	Should not be invoked by user. Opens the strategic map as a spawn point
	selection.
*/

params [
	// Strategic map module to read settings from; does not need to be the
	// actual module - can be any object with strategic map mission modules
	// synchronized to it
	["_mapObject", objNull, [objNull]],
	// All objects to move to a spawnpoint
	["_movables", [], [[]]]
];

private _missionObjects = [];
{
	if (_x isKindOf "ModuleStrategicMapMission_F") then {
		_missionObjects pushBack _x;
	};
} forEach (synchronizedObjects _mapObject);

[
	nil,
	getPosATL _mapObject,
	_missionObjects apply {
		[_x, _movables] call FESC_fnc_readSpawnSelModule
	},
	[],							// ORBAT groups
	[],							// custom markers
	[],							// custom images
	0,							// density of clouds in range [0, 1]
	false,						// night vision?
	1,							// automatic map scale coeficient
	true,						// enable simulation?
	"Startpunkt auswählen"		// bottom bar label
] call BIS_fnc_StrategicMapOpen;
