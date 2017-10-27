
/*

        This function will repair and/or restock a list of vehicles with a given rate.
        It will stop refueling/repairing when both is done.
        You can also stop the process manually calling CBA_fnc_removePerFrameHandler;

        PARAMS:
            0 <OBJECT/ARRAY> - The vehicle or a crew member of the vehicle (or an array of that) that should be repaired/restocked.
            1 <SCALAR> - Refuel-/repair-rate per second.
            2 <STRING/ARRAY> - "refuel" or "repair" (or both as an array) telling the script, what to do.

        RETURNS:
            <ARRAY> - For each vehicle repaired/refueled, there is an array containing the vehicle and the respective CBA perFrameHandler that handles respective refueling/repairing.

        AUTHOR: [W] Fett_Li
*/

params [["_list", [], [objNull, []]], ["_rate", 0.05, [0]], ["_types", [], ["", []]]];

if (_list isEqualType objNull) then {
    _list = [_list];
};

if (_types isEqualType "") then {
    _types = [_types];
};

_types = _types arrayIntersect ["refuel", "repair"];
if (_types isEqualTo []) exitWith {};

private _v = _list apply { vehicle _x; };
_v = _v arrayIntersect _v;

_v apply {
    if (_x isKindOf "AllVehicles" && local _x) then {
        private _configs = [];

        if ("refuel" in _types) then {
            _configs pushBack [
                {
                    params ["_v", "_val"];
                    _v setFuel _val;
                    _val >= 1
                },
                fuel _x
            ];
        };
        if ("repair" in _types) then {
            _configs pushBack [
                {
                    params ["_v", "_val"];
                    _val = 1 - _val;
                    _v setDamage _val;
                    _val <= 0
                },
                1 - damage _x
            ];
        };

        _configs = _configs apply {
            _x params ["_code", "_val"];
            [_code, /* startAt: */ time - (_val / _rate)]
        };
        private _duration = 1 / _rate;

        private _handle = [{
            params ["_args", "_handler"];
            _args params ["_v", "_configs", "_duration"];

            private _results = _configs apply {
                _x params ["_code", "_startAt"];
                private _val = 1 min (1 * ((time - _startAt) / _duration));
                [_v, _val] call _code
            };

            if (!(false in _results) || {!alive _v || isNull _v}) then {
                [_handler] call CBA_fnc_removePerFrameHandler;
            };
        }, 0, [_x, _configs, _duration]] call CBA_fnc_addPerFrameHandler;

        [_x, _handle]
    } else {
        [_x, -1]
    };
};
