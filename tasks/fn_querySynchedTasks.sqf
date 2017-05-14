
params ["_player"];

{
	private _args = +_x;
	private _dest = _args select 3;
	if (_dest isEqualTypeParams [[], 0, 0, 0, false]) then {
		_args set [3, _dest select 0];
	};
	_args remoteExecCall ["BIS_fnc_taskCreate", _player];
} forEach (FESC_synchronizedTasks select 1);
