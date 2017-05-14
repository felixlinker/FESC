
if (!isServer) exitWith {};

params ["_args"];

_args params ["", ["_name", "", ["", []], [1, 2]]];
if (_name isEqualType []) then {
	_name = _name select 0;
};

private _index = (FESC_synchronizedTasks select 0) pushBackUnique _name;
(FESC_synchronizedTasks select 1) set [_index, +_args];
