ZombieMenu()
{
    self createMenu("ZombieMenu", "Zombies Menu");
    if(Zombies()){
        self addOption("ZombieMenu", "Zombie Options Menu", &OpenSubMenu, "ZombieOptions"); 
    }
    if(Blackout()){
        self addOption("ZombieMenu", "Zombie Ai Spawner", &OpenSubMenu, "ZombieSpawner");
        self addOption("ZombieMenu", "Change Zombie Eye Colors", &OpenSubMenu, "ZombieEyeColors");

        self createMenu("ZombieEyeColors", "Zombie Eye Colors");
        self addToggleOption("ZombieEyeColors", "Flashing Eye Colors", &FlashingEyeColors, false);
        self addOption("ZombieEyeColors", "Set Eye Colors To Blue", &SetEyeColor, "blue");
        self addOption("ZombieEyeColors", "Set Eye Colors To Green", &SetEyeColor, "green");
        self addOption("ZombieEyeColors", "Set Random Eye Color", &SetEyeColor, "random");
        self addOption("ZombieEyeColors", "Invisible Eyes", &SetEyeColor, "invisible");

        self createMenu("ZombieSpawner", "Zombie Ai Spawner");
        self addOption("ZombieSpawner", "Spawn Zombie", &SpawnZombie, "zombie");
        self addOption("ZombieSpawner", "Spawn Hell Hound", &SpawnZombie, "hellhound");
        self addOption("ZombieSpawner", "Spawn Brutus", &SpawnZombie, "brutus");
        self addOption("ZombieSpawner", "Spawn Avogadro", &SpawnZombie, "avogadro");
    }
    self createMenu("ZombieOptions", "Zombie Options Menu");
    self addOption("ZombieOptions", "Spawn Luna Wolf (Protector)", &SpawnLunaWolf, []);
    self addOption("ZombieOptions", "Kill All Zombies", &KillAllZombies, []);
    self addOption("ZombieOptions", "Open All Doors", &OpenAllDoors, []);
    self addOption("ZombieOptions", "Teleport All Zombies To You", &TeleportAllZombies, []);
    self addToggleOption("ZombieOptions", "Free Mystery Box", &FreeMysteryBox, false);
    self addToggleOption("ZombieOptions", "Mystery Box Doesn't Move", &FreezeMysteryBox, false);
}

ZombiesAimbot()
{
    self endon("disconnect");
    self endon("StopAimbot");

    self.Aimbot = isDefined(self.Aimbot) ? undefined : true;
 
    if(isDefined(self.Aimbot)){
        while(isDefined(self.Aimbot))
        {
            ClosestZombie = Array::get_all_closest(self.origin, GetAITeamArray(level.zombie_team));
            
            if(self isFiring() && ClosestZombie.size > 0 && isAlive(ClosestZombie[0]) && !self IsMeleeing())
            {
                Loc = ClosestZombie[0] gettagorigin("tag_origin");
                
                self setplayerangles(VectorToAngles((Loc) - (self gettagorigin("tag_origin"))));
                wait .05;
                ClosestZombie[0] dodamage(ClosestZombie[0].maxhealth + 666, ClosestZombie[0].origin, self);
            }
            wait .05;
        }
    }
    else{
        self notify("StopAimbot");
    }
}

SpawnLunaWolf()
{
    spawnactor(#"hash_3f174b9bcc408705", self.origin, self.angles, "wolf_protector", 1);
}

KillAllZombies() {
    if (!isdefined(level.zombie_team)) {
        return;
    }
    foreach(zombie in getaiteamarray(level.zombie_team)) 
    {
        if (isdefined(zombie)) {
            zombie dodamage(zombie.maxhealth + 666, zombie.origin, self);
        }
    }
}

SpawnZombie(ZombieType)
{
    self.ZombieTypes = undefined;
    
    self.ZombieTypes["zombie"] = #"spawner_boct_zombie_wz";
    self.ZombieTypes["hellhound"] = #"spawner_boct_zombie_dog_wz";
    self.ZombieTypes["brutus"] =  #"spawner_boct_brutus_wz";
    self.ZombieTypes["avogadro"] =  #"spawner_boct_avogadro";

    Look = self GetLookPosition();
    ZombieAi = spawnactor(self.ZombieTypes[ZombieType], Look, (0, 0, 0));
}

SetEyeColor(EyeColor)
{
    Random = randomIntRange(1, 4);
    
    if (!isdefined(level.var_5b357434)) 
    {
        return;
    }

    self.EyeColors = undefined;
    
    self.EyeColors["invisible"] = 0;
    self.EyeColors["default"] = 1;
    self.EyeColors["blue"] = 2;
    self.EyeColors["green"] = 3;
    self.EyeColors["random"] = Random;

    ZombieAI = getaiteamarray(#"world");

    foreach (Zombie in ZombieAI) {
        if (isalive(Zombie)) {
            Zombie clientfield::set("zombie_has_eyes_col", self.EyeColors[EyeColor]);
        }
    }
}

FlashingEyeColors()
{
    self.FlashingEyeColors = isDefined(self.FlashingEyeColors) ? undefined : true;
 
    if(isDefined(self.FlashingEyeColors))
    {
        self endon("disconnect");
        self endon("StopFlashingEyes");

        ZombieAI = getaiteamarray(#"world");

        while(isDefined(self.FlashingEyeColors)) 
        {
            Random = randomIntRange(1, 4);
            foreach (Zombie in ZombieAI) {
                if (isalive(Zombie)) {
                    Zombie clientfield::set("zombie_has_eyes_col", Random);
                }
            }
            wait 0.1;
        }
    }
    else{
        self notify("StopFlashingEyes");
    }
}

OpenAllDoors() // From Lucy Menu
{
	setdvar(#"zombie_unlock_all", 1);
	level flag::set("power_on");
	level clientfield::set("zombie_power_on", 1);
	power_trigs = getentarray("use_elec_switch", "targetname");
	foreach(trig in power_trigs)
	{
		if(isdefined(trig.script_int))
		{
			level flag::set("power_on" + trig.script_int);
			level clientfield::set("zombie_power_on", trig.script_int + 1);
		}
	}
	players = getplayers();
	zombie_doors = getentarray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(!(isdefined(zombie_doors[i].has_been_opened) && zombie_doors[i].has_been_opened))
		{
			zombie_doors[i] notify(#"trigger", {#activator:players[0]});
		}
		if(isdefined(zombie_doors[i].power_door_ignore_flag_wait) && zombie_doors[i].power_door_ignore_flag_wait)
		{
			zombie_doors[i] notify(#"power_on");
		}
		waitframe(1);
	}
	zombie_airlock_doors = getentarray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
		waitframe(1);
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		if(isdefined(zombie_debris[i]))
		{
			zombie_debris[i] notify(#"trigger", {#activator:players[0]});
		}
		waitframe(1);
	}
	wait(1);
	setdvar(#"zombie_unlock_all", 0);
    self iPrintLnBold("Doors ^2Opened");
}

TeleportAllZombies() 
{
    foreach(zombie in getaiteamarray(level.zombie_team))  
    {
        if (isDefined(zombie)) zombie ForceTeleport(self.origin + (+40, 0, 0));
    }
}

FreeMysteryBox()
{
    self.FreezeBox = isDefined(self.FreezeBox) ? undefined : true;
 
    if(isDefined(self.FreezeBox))
    {
        self endon("disconnect");
 
        foreach(chest in level.chests) chest.zombie_cost = 0;
    }
    else
        foreach(chest in level.chests) chest.zombie_cost = 950;
}

FreezeMysteryBox()
{
    self.FreezeBox = isDefined(self.FreezeBox) ? undefined : true;
 
    if(isDefined(self.FreezeBox))
    {
        self endon("disconnect");
 
        level.chests[level.chest_index].no_fly_away = true;
    }
    else
        level.chests[level.chest_index].no_fly_away = false;
}