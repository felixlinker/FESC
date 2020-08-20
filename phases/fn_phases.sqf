if (!isServer) exitWith {};

private _durationNow = [
	format ["Phase%1", FESC_phaseCurrent + 1]
] call BIS_fnc_getParamValue;
if (_durationNow <= 0) exitWith {};
[{
	private _onAct = FESC_phasesCallback select FESC_phaseCurrent;
		[] call (if (isNil "_onAct") then {{}} else {_onAct});
		[_handle] call CBA_fnc_removePerFrameHandler;

		FESC_phaseCurrent = FESC_phaseCurrent + 1;
		[] call FESC_fnc_phases;
}, [], 60 * _durationNow] call CBA_fnc_waitAndExecute;
