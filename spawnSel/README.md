# FESC Spawn Point Selection

Allows players to select a spawn point for her and her subordinates to be moved to upon selection.
This module is intended to be used at mission start but may be used at any point during a mission.

## Setup

First, place the `Strategic Map` module and sync it with some `Mission` modules in the same module-category.
The missions are where the player can choose to spawn.
It is recommended to at least specify the `Name` attribute of each mission module.
You may optionally specify:

- `On Activation`: Will be executed when the spawn point is selected
- `Icon Size`

Synchronize each `Mission` module with the respective `Strategic Map` module.

Now, place a game logic and synchronize it with each group-leader and vehicle that shall be moved upon spawn point selection.
You don't necessarily have to use a game logic but we suggest you to do so.

To add the spawn point selection to a map of Altis in front of the leader, execute:
```sqf
[
    // variable name of the map
    map_of_altis,
    // variable name of the player that can open the selection
    my_leader,
    // object to read movable units from
    game_logic,
    // module that defines selectable spawn points
    strategic_map,
    // optional: 600 seconds after mission start, the selection action will be
    // removed.
    600
] call FESC_fnc_addSpawnSelAction;
```
