ZombieMenu()
{
    self createMenu("ZombieMenu", "Zombie Ai Menu");
    self addOption("ZombieMenu", "Zombie Options Menu", &OpenSubMenu, "ZombieOptions");
    self addOption("ZombieMenu", "Zombie Ai Spawner", &OpenSubMenu, "ZombieSpawner");
    self addOption("ZombieMenu", "Change Zombie Eye Colors", &OpenSubMenu, "ZombieEyeColors");

    self createMenu("ZombieEyeColors", "Zombie Eye Colors");
    self addToggleOption("ZombieEyeColors", "Flashing Eye Colors", &FlashingEyeColors, false);
    self addOption("ZombieEyeColors", "Set Eye Colors To Blue", &SetEyeColor, "blue");
    self addOption("ZombieEyeColors", "Set Eye Colors To Green", &SetEyeColor, "green");
    self addOption("ZombieEyeColors", "Set Random Eye Color", &SetEyeColor, "random");
    self addOption("ZombieEyeColors", "Invisible Eyes", &SetEyeColor, "invisible");

    self createMenu("ZombieOptions", "Zombie Options Menu");
    self addOption("ZombieOptions", "Kill All Zombies", &KillZombies, []);

    self createMenu("ZombieSpawner", "Zombie Ai Spawner");
    self addOption("ZombieSpawner", "Spawn Zombie", &SpawnZombie, "zombie");
    self addOption("ZombieSpawner", "Spawn Hell Hound", &SpawnZombie, "hellhound");
    self addOption("ZombieSpawner", "Spawn Brutus", &SpawnZombie, "brutus");
    self addOption("ZombieSpawner", "Spawn Avogadro", &SpawnZombie, "avogadro");

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

KillZombies()
{
    ZombieAI = getaiteamarray(#"world");

    foreach (Zombie in ZombieAI) {
        if (isalive(Zombie)) {
            Zombie kill(undefined, undefined, undefined, undefined, 0, 1);
        }
    }
}