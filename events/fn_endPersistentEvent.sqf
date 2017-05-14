
params ["_eventName", ["_args", []], "_fnc", ["_targets", 0]];

if (isNil "_eventName") exitWith {};
remoteExec ["", _eventName];
if (isNil "_fnc") exitWith {};
_args remoteExec [_fnc, _targets];
