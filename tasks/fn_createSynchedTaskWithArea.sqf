
if (!isServer) exitWith {};

params [
	["_targets", sideUnknown, [true, objNull, grpNull, sideUnknown, []]],
	["_name", "", ["", []], [1, 2]],
	["_description", "", ["", [], configNull], [3]],
	["_area", [], [[], objNull], [5]],
	["_state", true, [true, "", 0]],
	["_priority", 0, [0]],
	["_showNotification", true, [true]],
	["_type", "", [""]],
	["_visible", false, [true]]
];

if (_area isEqualType objNull) then {
	private _trigger = _area;
	_area = [getPosATL _trigger];
	private _triggerArea = triggerArea _trigger;
	_triggerArea resize 4;
	_area append _triggerArea;
};

private _args = +_this;
_args set [3, _area];
_args set [6, false]; // disable notification for JIP

[_args] call FESC_fnc_storeSynchedTask;

_args set [3, _area select 0];
_args set [6, _showNotification];
_args remoteExecCall ["BIS_fnc_taskCreate"];
