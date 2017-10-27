
/*

        Will create locally a marker that flashes like a signal.
        You can stop it from flashing via the CBA perFrameHandler ID returned.

        PARAMS:
            0 <ARRAY format position> - The position where the marker should be created.
            1 <SCALAR> default: 200 - Maximum radius for the marker to have.
            2 <SCALAR> default: 1 - Time the marker takes to flash one time.
            3 <STRING> default: "ColorGreen- Marker color.
            4 <STRING> default: "SolidBorder" - The marker's brush.

        RETURNS:
            <ARRAY>
                0 - The marker name
                1 - The CBA perFrameHandler ID that handles the flashing.

        AUTHOR: [W] Fett_Li

*/

params [["_pos", [], [[]], [2, 3]], ["_radius", 200, [0]], ["_periodTime", 1, [0]], ["_color", "ColorGreen", [""]], ["_brush", "SolidBorder", [""]]];

private _name = (_pos joinString ".") + "_" + str diag_tickTime;
private _m = createMarkerLocal [_name, _pos];
_m setMarkerColorLocal _color;
_m setMarkerAlphaLocal 1;
_m setMarkerShapeLocal "ELLIPSE";
_m setMarkerSizeLocal [0,0];
_m setMarkerBrushLocal _brush;

private _handler = [{

    params ["_args"];
    _args params ["_m", "_radius", "_periodTime", "_startTime"];
    private _progress = ((time - _startTime) mod _periodTime) / _periodTime;
    _m setMarkerSizeLocal [_radius * _progress, _radius * _progress];
    _m setMarkerAlphaLocal (1 - _progress);

}, 0, [_m, _radius, _periodTime, time]] call CBA_fnc_addPerFrameHandler;

[_m, _handler]
