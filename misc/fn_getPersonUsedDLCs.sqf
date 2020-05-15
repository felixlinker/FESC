params [["_o", player, [objNull]]];

(getPersonUsedDLCs _o) apply {
	[_x] call FESC_fnc_DLCIdToName;
}
