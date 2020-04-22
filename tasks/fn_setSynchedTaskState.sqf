
if (!isServer) exitWith {};

params [
	["_name", "", [""]],
	["_state", "", [""]],
	["_showHint", true, [true]]
];

private _taskIndex = (FESC_synchronizedTasks select 0) find _name;
if (_taskIndex < 0) exitWith {};
private _task = (FESC_synchronizedTasks select 1) select _taskIndex;
_task set [4, _state];

private _destination = _task select 3;

if (_destination isEqualTypeParams [[], 0, 0, 0, true]) then {
	{
		_showHint = _x inArea _destination;
		[_name, _state, _showHint] remoteExecCall ["BIS_fnc_taskSetState", _x];
	} forEach allPlayers;
} else {
	[_name, _state, _showHint] remoteExecCall ["BIS_fnc_taskSetState"];
};

