private _durationNow = [
	format ["Phase%1", FESC_phaseCurrent + 1]
] call BIS_fnc_getParamValue;
if (_durationNow <= 0) exitWith {};
FESC_phaseWaitFor = FESC_phaseWaitFor + (60 * _durationNow);
[{
	params ["_args", "_handle"];
	if (time > FESC_phaseWaitFor) then {
		hint format ["p%1", FESC_phaseCurrent];
		private _onAct = FESC_phasesCallback select FESC_phaseCurrent;
		[] call (if (isNil "_onAct") then {{}} else {_onAct});
		[_handle] call CBA_fnc_removePerFrameHandler;

		FESC_phaseCurrent = FESC_phaseCurrent + 1;
		[] call FESC_fnc_phases;
	};
}, 1] call CBA_fnc_addPerFrameHandler;
