/*
	Author: Fett_Li

	Description:
	Get all vehicles of all group-members of synchronized objects to a source
	and optionally their position relative to another object.

	Returns:
	ARRAY - Vehicles of units of groups of synchronized objects with 2D position
	relative to the other object
*/

params [
	// Source object
	["_source", objNull, [objNull]],
	// (Optional) Object to get the relative 2D position to
	["_relObj", objNull, [objNull]]
];

private _groupVs = [];
{
	private _grp = group vehicle _x;
	if (isNull _grp) then {
		_groupVs pushBackUnique vehicle _x;
	} else {
		{
			_groupVs pushBackUnique (vehicle _x);
		} forEach (units _grp);
	};
} forEach (synchronizedObjects _source);

if (!isNull _relObj) then {
	_groupVs apply { [_x, _source worldTomodel (getPos _x) ] }
} else {
	_groupVs
}
