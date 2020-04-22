
params ["_eventName", ["_args", []], "_fnc", ["_targets", 0]];

if(isNil "_eventName" || isNil "_fnc") exitWith {};
["FESC_CBA_execEvent", [_args, _fnc, _targets], _eventName] call CBA_fnc_globalEventJIP;
