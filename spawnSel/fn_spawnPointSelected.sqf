/*
	Author: Fett_Li

	Description:
	Should not be invoked by user. Is invoked whenever a spawnpoint is selected.
*/

params ["_pos"];
(_this select 9) params ["_code", "_movables"];

// Execute default on activation
_this call _code;

// Move objects and remote execute move command for each remote machine
private _vs = [];
{
	_x params ["_v", "_relPos"];

	// Get position to move the object to
	private _p = _pos vectorAdd _relPos;
	// Set position to ground level
	_p set [2, 0];

	[_v, _p] remoteExec ["FESC_fnc_moveAnimated", _v];
} forEach _movables;
