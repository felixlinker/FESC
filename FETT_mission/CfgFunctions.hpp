class FETT_mission {
	tag = "FETT";
	class tasks {
		file = "FETT_mission/tasks";
		class createSynchedTask {};
		class createSynchedTaskWithArea {};
		class querySynchedTasks {};
		class setSynchedTaskState {};
		class storeSynchedTask {};
		class taskPostInit { postInit = 1; };
		class taskPreInit { preInit = 1; };
	};
	class ambient {
		file = "FETT_mission/ambient";
		class setAmbientDead {};
	};
};
