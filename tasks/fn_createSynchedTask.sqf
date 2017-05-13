
if (!isServer) exitWith {};

params [
	["_targets", sideUnknown, [true, objNull, grpNull, sideUnknown, []]],
	["_name", "", ["", []], [1, 2]],
	["_description", "", ["", [], configNull], [3]],
	["_destination", [], ["", objNull, []], [2, 3]],
	["_state", true, [true, "", []]],
	["_priority", 0, [0]],
	["_showNotification", true, [true]],
	["_type", "", [""]],
	["_visible", false, [true]]
];

private _args = +_this;
_args remoteExecCall ["BIS_fnc_taskCreate"];

_args set [6, false]; // disable notification for JIP

[_args] call FETT_task_fnc_storeSynchronized;
