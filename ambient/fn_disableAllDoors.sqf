params [["_building", objNull, [objNull]]];

if (isNull _building) exitWith {};

private _doorEntries = "(configName _x) find 'Door_' == 0" configClasses (
	configFile >> "CfgVehicles" >> (typeOf _building) >> "AnimationSources"
);
// private _doorNames = _doorEntries apply { configName _x };
private _doorNames = _doorEntries apply {
	private _parts = (configName _x) splitString "_";
	format ["%1_%2", _parts select 0, _parts select 1]
};

private _names = [];
{
	private _v = format ["bis_disabled_%1", _x];
	_names pushBack _v;
	_building setVariable [_v, 1];
} forEach _doorNames;
