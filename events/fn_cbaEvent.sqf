params ["_args", "_fnc", "_targets"];

if !(_targets isEqualType []) then {
    _targets = [_targets];
};

private _exec = false;
{
    switch typeName _x do {
        case "SCALAR": {
            if (_x >= 0) then {
                _exec = _x == 0 || clientOwner == _x;
            } else {
                _exec = clientOwner != _x;
            };
        };
        case "OBJECT": {
            _exec = local _x;
        };
        case "STRING": {
            private _o = missionNamespace getVariable _x;
            if (!isNil "_o" && {_o isEqualType objNull}) then {
                _exec = local _o;
            } else {
                if (!isNil "_o" && {_o isEqualType grpNull}) then {
                    _exec = !isNull player && {group player == _o};
                };
            };
        };
        case "SIDE": {
            _exec = !isNull player && {side player == _x};
        };
        case "GROUP": {
            _exec = !isNull player && {group player == _x};
        };
        case "CODE": {
            _exec = nil call _code;
        };
    };

    if (_exec) exitWith {};
} forEach _targets;

if (!_exec) exitWith {};

_args call (missionNamespace getVariable _fnc);
