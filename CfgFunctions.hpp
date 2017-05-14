class FESC {
	tag = "FESC";
	class ambient {
		file = "FESC\ambient";
		class setAmbientDead {};
	};
	class events {
		file = "FESC\events";
		class endPersistentEvent {};
		class executePersistentEvent {};
	};
	class misc {
		file = "FESC\misc";
		class toggleMapIDs {};
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
};
