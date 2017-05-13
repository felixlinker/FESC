
params [["_unit", objNull, [objNull]], ["_checkLocality", true, [true]]];

if (_checkLocality && { !local _unit }) exitWith {};

_unit switchMove (selectRandom ["Static_Dead", "Acts_InjuredLyingRifle01"]);
_unit setDamage 1;
