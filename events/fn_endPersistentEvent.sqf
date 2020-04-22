
params ["_eventName", ["_args", []], "_fnc", ["_targets", 0]];

if (isNil "_eventName") exitWith {};
["", 0, _eventName] call CBA_fnc_globalEventJIP;
if (isNil "_fnc") exitWith {};
["FESC_CBA_execEvent", [_args, _fnc, _targets]] call CBA_fnc_globalEvent;
