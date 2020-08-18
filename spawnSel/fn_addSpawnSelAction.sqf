/*
	Author: Fett_Li

	Description:
	Adds an action for opening a spawn selection screen.

	Returns:
	NUMBER - addAction ID
*/

params [
	// Object the action should be added to
	["_target", objNull, [objNull]],
	// Who can open the selection?
	["_selector", objNull, [objNull]],
	// Object with units synchronized to it. Units the group of synchronized
	// objects can be moved by the spawn selection
	["_movableSource", objNull, [objNull]],
	// Module setting the strategic map
	["_mapModule", objNull, [objNull]],
	// Time after mission start when the action will be removed (in seconds);
	// set 0 to disable.
	["_expiresAfter", 600, [0]]
];

if (player != _selector) exitWith {};
// Might happen by JIP
if (time > _expiresAfter) exitWith {};

private _action = _target addAction [
	"Startpunkt auswählen",
	{
		params ["_target", "_caller", "_id", "_args"];
		_args call FESC_fnc_openSpawnSel;
	},
	[
		_mapModule,
		[_movableSource, player] call FESC_fnc_getSynchedGroups
	]
];

// Guard the spawn selection
if (_expiresAfter > 0) then {
	[{
		params ["_target", "_action"];
		_target removeAction _action;
	}, [_target, _action], _expiresAfter - time] call CBA_fnc_waitAndExecute;
};

_action
