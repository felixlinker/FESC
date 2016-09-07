class FETT_mission {
	tag = "FETT";
	class ambient {
		file = "FETT_mission\ambient";
		class setAmbientDead {};
	};
	class misc {
		file = "FETT_mission\misc";
		class toggleMapIDs {};
	}
	class tasks {
		file = "FETT_mission\tasks";
		class createSynchedTask {};
		class createSynchedTaskWithArea {};
		class querySynchedTasks {};
		class setSynchedTaskState {};
		class storeSynchedTask {};
		class taskPostInit { postInit = 1; };
		class taskPreInit { preInit = 1; };
	};
};
