class FESC {
	tag = "FESC";
	class ambient {
		file = "FESC\ambient";
		class disableAllDoors {};
		class setAmbientDead {};
	};
	class events {
		file = "FESC\events";
		class cbaEvent {};
		class endPersistentEvent {};
		class executePersistentEvent {};
		class preInit { preInit = 1; };
	};
	class map {
		file = "FESC\map";
		class signalEffect {};
		class signalEffectStop {};
	};
	class misc {
		file = "FESC\misc";
		class DLCIdToName {};
		class getPersonUsedDLCs {};
		class getSynchedGroups {};
		class moveAnimated {};
		class toggleMapIDs {};
	};
	class phases {
		file = "FESC\phases";
		class onPhase {};
		class phases { postInit = 1; };
		class phasesDefines { preInit = 1; };
	};
	class spawnSel {
		file = "FESC\spawnSel";
		class addSpawnSelAction {};
		class openSpawnSel {};
		class readSpawnSelModule {};
		class spawnPointSelected {};
	};
	class tasks {
		file = "FESC\tasks";
		class createSynchedTask {};
		class createSynchedTaskWithArea {};
		class querySynchedTasks {};
		class setSynchedTaskState {};
		class storeSynchedTask {};
		class taskPostInit { postInit = 1; };
		class taskPreInit { preInit = 1; };
	};
	class vehicles {
		file = "FESC\vehicles";
		class clearVehicleInventory {};
		class timedRestock {};
	};
};
