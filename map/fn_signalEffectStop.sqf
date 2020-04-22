
params [["_m", "", [""]], ["_handler", -1, [0]]];

[_handler] call CBA_fnc_removePerFrameHandler;
[{ deleteMarkerLocal _this; }, _m] call CBA_fnc_execNextFrame;
