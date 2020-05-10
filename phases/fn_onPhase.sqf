/*
	Author: Fett_Li

	Description:
	Define code to be executed when a phase is completed.
*/

params [
	// Phase index; phase one's index is 0
	["_phase", -1, [0]],
	// Code to execute on phase completion
	["_onAct", {}, []]
];

if (!isServer) exitWith {};
if (_phase < 0) exitWith {
	["No phase ID given"] call BIS_fnc_error;
};

FESC_phasesCallback set [_phase, _onAct];
