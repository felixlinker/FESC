
params ["_eventName", ["_args", []], "_fnc", ["_targets", 0]];

if(isNil "_eventName" || isNil "_fnc") exitWith {};
_args remoteExec [_fnc, _targets, _eventName];
