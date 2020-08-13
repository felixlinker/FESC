# FESC Phases

This folder provides a framework for setting up phases for a mission that can be adjusted in the mission parameters.
Each phase, starting with the first (indexed by 0), takes a specified amount of time.
When a phase is over, code specified by the user is executed.
Phases only are tracked on the server.

Here are some code examples on how to set up the phases.
Add the following to your `description.ext` (there are predefined templates up to and including `PHASE_5`):

```cpp
class Params {
    #define PHASE_1_DEFAULT 10
    #define PHASE_1_OPTS PHASE_1_DEFAULT,5,1
    #include "FESC\phases\phase1.hpp"
    #define PHASE_2_DEFAULT 60
    #define PHASE_2_OPTS 90,75,PHASE_2_DEFAULT,45,30,1
    #include "FESC\phases\phase2.hpp"
};
```

This code defines two phases.
The first lasts 10 minutes by default and can optionally be set to last 1 or 5 minutes.
The second phase lasts 60 minutes by default.

Now, you might want to add the following code to the `initServer.sqf`:

```sqf
[
    // When the first phase (indexed by 0) is over...
    0,
    // ... give the players a hint
    { "Preperation time is over!" remoteExecCall ["hint"]; }
] call FESC_fnc_onPhase;
[
    // When the second phase (indexed by 1) is over ...
    1,
    // ... end the mission
    { [] remoteExecCall "BIS_fnc_endMission"; }
] call FESC_fnc_onPhase;
```
