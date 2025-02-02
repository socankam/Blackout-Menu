PersonalMenu(){
    self createMenu("PersonalMenu", "Personal Menu");
    self addOption("PersonalMenu", "Personal Options", &OpenSubMenu, "PersonalOptions");
    self addOption("PersonalMenu", "Misc. Fun Menu", &OpenSubMenu, "FunOptions");
    if(Multiplayer()){
        self addOption("PersonalMenu", "Specialist Menu", &OpenSubMenu, "SpecialistMenu");
        self addOption("PersonalMenu", "Killstreaks Menu", &OpenSubMenu, "KillstreaksMenu");
    }
    if(Blackout()){
        self addOption("PersonalMenu", "Armor Menu", &OpenSubMenu, "ArmorMenu");
    }
    self addOption("PersonalMenu", "Perk Menu", &OpenSubMenu, "PerkMenu");

    self createMenu("PersonalOptions", "Personal Options");
    self addToggleOption("PersonalOptions", "God Mode", &GodMode, false);
    self addToggleOption("PersonalOptions", "Infinite UAV", &InfiniteUAV, false);
    self addToggleOption("PersonalOptions", "Unlimited Ammo", &UnlimitedAmmo, false);
    self addToggleOption("PersonalOptions", "Walk Out Of Bounds", &WalkOutOfBounds, false);
    if(Blackout() || Multiplayer()){
        self addToggleOption("PersonalOptions", "Unfair Aimbot", &StartUnfairAimbot, false);
    }
    if(Zombies()){
        self addToggleOption("PersonalOptions", "Unfair Aimbot", &ZombiesAimbot, false);
    }
    self addToggleOption("PersonalOptions", "Force Host", &ForceHost, false);
    self addToggleOption("PersonalOptions", "Third Person Mode", &ThirdPerson, false);
    self addToggleOption("PersonalOptions", "Rapid Fire", &RapidFire, false);
    self addToggleOption("PersonalOptions", "Auto Drop Shot", &AutoDropShot, false);

    self createMenu("FunOptions", "Misc. Fun Menu");
    self addOption("FunOptions", "Launch Into The Sky", &LaunchPlayer, []);
    self addOption("FunOptions", "Send Mortar Strike", &MortarStrike, []);
    self addOption("FunOptions", "Give Jetpack (Heavy Metal Heroes)", &SetToPlayer, "specialty_doublejump");
    self addToggleOption("FunOptions", "Dead Ops Arcade", &DeadOpsArcade, false);
    self addToggleOption("FunOptions", "Give Teleport Gun", &StartTeleportGun, false);
    self addToggleOption("FunOptions", "Raining Rockets", &RainingRockets, false);
    self addToggleOption("FunOptions", "Raining Raygun Lasers", &RainingRaygun, false);
    self addOption("FunOptions", "Don't Show On Sensor Darts", &SetToPlayer, "specialty_nottargetedbysensors");
    self addOption("FunOptions", "Clone Yourself", &Clone, []);
    self addOption("FunOptions", "Invisible Weapon", &HideWeapon, []);
    self addOption("FunOptions", "Bare Hands", &GivePlayerWeapon, "bare_hands");

    self createMenu("SpecialistMenu", "Specialist Menu");
    self addOption("SpecialistMenu", "Give Annihilator", &GivePlayerWeapon, "hero_annihilator");
    self addOption("SpecialistMenu", "Give Barricade", &GivePlayerWeapon, "ability_smart_cover");
    self addOption("SpecialistMenu", "Give Sparrow", &GivePlayerWeapon, "hero_bowlauncher");
    self addOption("SpecialistMenu", "Give Flamethrower", &GivePlayerWeapon, "hero_flamethrower");
    self addOption("SpecialistMenu", "Give Tempest", &GivePlayerWeapon, "shock_rifle");
    self addOption("SpecialistMenu", "Give Black Ops 3 Tempest", &GivePlayerWeapon, "hero_lightninggun");
    self addOption("SpecialistMenu", "Give War Machine", &GivePlayerWeapon, "hero_pineapplegun");

    self createMenu("KillstreaksMenu", "Killstreaks Menu");
    self addOption("KillstreaksMenu", "Call In UAV", &GivePlayerWeapon, "uav");
    self addOption("KillstreaksMenu", "Call In Counter UAV", &GivePlayerWeapon, "counteruav");
    self addOption("KillstreaksMenu", "Call In Drone Squadron", &GivePlayerWeapon, "drone_squadron");
    self addOption("KillstreaksMenu", "Call In Snipers Nest", &GivePlayerWeapon, "overwatch_helicopter");
    self addOption("KillstreaksMenu", "Call In Thresher", &GivePlayerWeapon, "straferun");

    self createMenu("ArmorMenu", "Armor Menu");
    self addOption("ArmorMenu", "Set Level 1 Armor", &SetToPlayer, "specialty_armor,Armor");
    self addOption("ArmorMenu", "Set Level 2 Armor", &SetToPlayer, "specialty_armor_tier_two,Armor");
    self addOption("ArmorMenu", "Set Level 3 Armor", &SetToPlayer, "specialty_armor_tier_three,Armor");

    self createMenu("PerkMenu", "Perk Menu");
    if(Blackout()){
        self addOption("PerkMenu", "Give Dead Silence", &SetToPlayer, "specialty_quieter,Perk");
        self addOption("PerkMenu", "Give Brawler", &SetToPlayer, "specialty_brawler,Perk");
        self addOption("PerkMenu", "Give Consumer", &SetToPlayer, "specialty_consumer,Perk");
        self addOption("PerkMenu", "Give Mobility", &SetToPlayer, "specialty_sprintspeed,Perk");
        self addOption("PerkMenu", "Give Outlander", &SetToPlayer, "specialty_outlander,Perk");
        self addOption("PerkMenu", "Give Awareness", &SetToPlayer, "specialty_awareness,Perk");
        self addOption("PerkMenu", "Give Paranoia", &SetToPlayer, "specialty_paranoia,Perk");
        self addOption("PerkMenu", "Give Looter", &SetToPlayer, "specialty_looter,Perk");

    }
    if(Multiplayer() || Zombies()){
        self addOption("PerkMenu", "Give Dead Silence", &SetToPlayer, "specialty_quieter,Perk");
        self addOption("PerkMenu", "Give Fast Reload", &SetToPlayer, "specialty_fastreload,Perk");
        self addOption("PerkMenu", "Give Fast Weapon Switch", &SetToPlayer, "specialty_fastweaponswitch,Perk");
        self addOption("PerkMenu", "Give Fast ADS", &SetToPlayer, "specialty_fastads,Perk");
        self addOption("PerkMenu", "Give Accuracy and Flat Spread", &SetToPlayer, "specialty_accuracyandflatspread,Perk");
        self addOption("PerkMenu", "Give Scavenger", &SetToPlayer, "specialty_scavenger,Perk");
        self addOption("PerkMenu", "Give Bullet Accuracy", &SetToPlayer, "specialty_bulletaccuracy,Perk");
        self addOption("PerkMenu", "Give More Bullet Damage", &SetToPlayer, "specialty_bulletdamage,Perk");
        self addOption("PerkMenu", "Give Fast Speed", &SetToPlayer, "specialty_playeriszombie,Perk");
    }
}

SetToPlayer(argString)
{
    args = strTok(argString, ",");
    perk = args[0];

    self setPerk(perk);

    if (isDefined(args[1]))
    {
        type = args[1];
        if(type == "Perk" || type == "Armor"){
            if(Blackout() || Zombies()){
                self iPrintlnBold("^2 " + type + "^7 set! You won't see it at the bottom.");
            }
            else{
                self iPrintlnBold("^2 " + type + "^7 set!");
            }
        }
        else{
            self iPrintlnBold("^2Enabled!");
        }
    }
}

Godmode()
{
    self.Godmode = isDefined(self.Godmode) ? undefined : true;
 
    if(isDefined(self.Godmode))
    {
        self endon("disconnect");
 
        while(isDefined(self.Godmode)) 
        {
            self EnableInvulnerability();
            wait 0.1;
        }
    }
    else
        self DisableInvulnerability();
}

Clone()
{
    self util::spawn_player_clone(self);
}

HideWeapon() 
{
    self.HideWeapon = isDefined(self.HideWeapon) ? undefined : true;
    if (isDefined(self.HideWeapon))
    {
        setDvar("cg_drawGun", 0);
    } 
    else 
    {
        setDvar("cg_drawGun", 1);
    }
}

RainingRockets()
{
    self.RainingRockets = isDefined(self.RainingRockets) ? undefined : true;
 
    if(isDefined(self.RainingRockets))
    {
        self endon("disconnect");
 
        while(isDefined(self.RainingRockets)) 
        {
            self thread StartRainingRockets();
            wait 0.1;
        }
    }
    else
        self notify("StopRainingRockets");
}

StartRainingRockets()
{
    self endon("disconnect");
    self endon("StopRainingRockets");

    origin = self getOrigin();

    while(isDefined(self.RainingRockets))
    {
        radius = 1000;
        angle = randomfloat(360);
        xOffset = cos(angle) * randomfloat(radius);
        yOffset = sin(angle) * randomfloat(radius);

        ImpactPos = (origin[0] + xOffset, origin[1] + yOffset, origin[2]);

        SpawnPos = (ImpactPos[0], ImpactPos[1], ImpactPos[2] + 1000);

        MagicBullet(GetWeapon("launcher_standard_t8"), SpawnPos, ImpactPos);

        wait 0.3;
    }
}

RainingRaygun()
{
    self.RainingRaygun = isDefined(self.RainingRaygun) ? undefined : true;
 
    if(isDefined(self.RainingRaygun))
    {
        self endon("disconnect");
 
        while(isDefined(self.RainingRaygun)) 
        {
            self thread StartRainingRaygun();
            wait 0.1;
        }
    }
    else
        self notify("StopRainingRaygun");
}

StartRainingRaygun()
{
    self endon("disconnect");
    self endon("StopRainingRaygun");

    origin = self getOrigin();

    while(isDefined(self.RainingRaygun))
    {
        radius = 1000;
        angle = randomfloat(360);
        xOffset = cos(angle) * randomfloat(radius);
        yOffset = sin(angle) * randomfloat(radius);

        ImpactPos = (origin[0] + xOffset, origin[1] + yOffset, origin[2]);

        SpawnPos = (ImpactPos[0], ImpactPos[1], ImpactPos[2] + 1000);

        MagicBullet(GetWeapon("ray_gun"), SpawnPos, ImpactPos);

        wait 0.3;
    }
}

MortarStrike()
{
    self endon("disconnect");

    Look = self GetLookPosition();
    for(a = 0; a < 5; a++)
    {
        MagicBullet(GetWeapon("launcher_standard_t8"), Look, (0, 0, 0));
        wait 0.15;
    }
}

InfiniteUAV()
{
    self.InfiniteUAV = isDefined(self.InfiniteUAV) ? undefined : true;
 
    if(isDefined(self.InfiniteUAV))
    {
        self endon("disconnect");
 
        self setclientuivisibilityflag("g_compassShowEnemies", 1);
    }
    else
        self setclientuivisibilityflag("g_compassShowEnemies", 0);
}

WalkOutOfBounds()
{
    self.WalkOutOfBounds = isDefined(self.WalkOutOfBounds) ? undefined : true;
 
    if(isDefined(self.WalkOutOfBounds))
    {
        self.oobdisabled = 1;
    }
    else
        self.oobdisabled = 0;
}

UnlimitedAmmo() {
    self.UnlimitedAmmo = isDefined(self.UnlimitedAmmo) ? undefined : true;

    if(isDefined(self.UnlimitedAmmo)){
        while(isDefined(self.UnlimitedAmmo))
        {
            self GiveMaxAmmo(self GetCurrentWeapon());
            self SetWeaponAmmoClip(self GetCurrentWeapon(), self GetCurrentWeapon().clipsize);
            wait .05;
        }
    }
}

StartUnfairAimbot()
{
    self.UnfairAimbot = isDefined(self.UnfairAimbot) ? undefined : true;
 
    if(isDefined(self.UnfairAimbot))
    {
        self endon("disconnect");

        while(isDefined(self.UnfairAimbot)) 
        {
            self thread UnfairAimbot();
            wait 0.1;
        }
    }
    else
        self notify("StopUnfairAimbot");
}

UnfairAimbot()
{
    self endon("StopUnfairAimbot");
    self endon("disconnect");

    while (self.UnfairAimbot)
    {
        aimAt = undefined;

        foreach (player in level.players)
        {
            if (!isDefined(player) || player == self || !isAlive(player))
                continue;

            if (level.teamBased && self.pers["team"] == player.pers["team"])
                continue;

            if (isDefined(aimAt))
            {
                if (closer(self getTagOrigin("j_head"), player getTagOrigin("j_head"), aimAt getTagOrigin("j_head")))
                    aimAt = player;
            }
            else
            {
                aimAt = player;
            }
        }

        if (isDefined(aimAt) && isAlive(aimAt) && self adsbuttonpressed())
        {
            targetOrigin = aimAt getTagOrigin("j_head");

            if (isDefined(targetOrigin))
            {
                self setplayerangles(VectorToAngles(targetOrigin - (self getTagOrigin("j_head"))));

                if (self attackbuttonpressed())
                {
                    aimAt thread [[level.callbackplayerdamage]](
                        self,
                        self,
                        100,
                        0,
                        "MOD_HEAD_SHOT",
                        self GetCurrentWeapon(),
                        targetOrigin,
                        (0, 0, 0),
                        "j_head",
                        (self getTagOrigin("j_head")),
                        0,
                        0,
                        (0, 0, 0)
                    );
                }
            }
        }

        wait 0.05;
    }
}

ForceHost()
{
    self.ForceHost = isDefined(self.ForceHost) ? undefined : true;
    if(isDefined(self.ForceHost))
    {
        if(getDvarString("party_connectTimeout") != "0")
        {
            SetDvar("lobbySearchListenCountries", "0,103,6,5,8,13,16,23,25,32,34,24,37,42,44,50,71,74,76,75,82,84,88,31,90,18,35");
            SetDvar("excellentPing", 3);
            SetDvar("goodPing", 4);
            SetDvar("terriblePing", 5);
            SetDvar("migration_forceHost", 1);
            SetDvar("migration_minclientcount", 12);
            SetDvar("party_connectToOthers", 0);
            SetDvar("party_dedicatedOnly", 0);
            SetDvar("party_dedicatedMergeMinPlayers", 12);
            SetDvar("party_forceMigrateAfterRound", 0);
            SetDvar("party_forceMigrateOnMatchStartRegression", 0);
            SetDvar("party_joinInProgressAllowed", 1);
            SetDvar("allowAllNAT", 1);
            SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
            SetDvar("party_mergingEnabled", 0);
            SetDvar("party_neverJoinRecent", 1);
            SetDvar("party_readyPercentRequired", .25);
            SetDvar("partyMigrate_disabled", 1);
        }
    } 
    else 
    {
        SetDvar("lobbySearchListenCountries", "");
        SetDvar("excellentPing", 30);
        SetDvar("goodPing", 100);
        SetDvar("terriblePing", 500);
        SetDvar("migration_forceHost", 0);
        SetDvar("migration_minclientcount", 2);
        SetDvar("party_connectToOthers", 1);
        SetDvar("party_dedicatedOnly", 0);
        SetDvar("party_dedicatedMergeMinPlayers", 2);
        SetDvar("party_forceMigrateAfterRound", 0);
        SetDvar("party_forceMigrateOnMatchStartRegression", 0);
        SetDvar("party_joinInProgressAllowed", 1);
        SetDvar("allowAllNAT", 1);
        SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
        SetDvar("party_mergingEnabled", 1);
        SetDvar("party_neverJoinRecent", 0);
        SetDvar("partyMigrate_disabled", 0);
    }
}

ThirdPerson()
{
    self.ThirdPerson = isDefined(self.ThirdPerson) ? undefined : true;
    if (isDefined(self.ThirdPerson))
        self setclientthirdperson(1);
    else
        self setclientthirdperson(0);
}

AutoDropShot()
{
    self.AutoDropShot = isDefined(self.AutoDropShot) ? undefined : true;
    if(isDefined(self.AutoDropShot))
    {
        self endon("StopAutoDropShot");
        while(isDefined(self.AutoDropShot))
        {
            self waittill("weapon_fired");
            self SetStance("prone");
        }
    }
    else
        self notify("StopAutoDropShot");
}

Rapidfire()
{
    self.Rapidfire = isDefined(self.Rapidfire) ? undefined : true;
    if(isDefined(self.Rapidfire))
    {
        self endon("EndRapidFire");
        while(isDefined(self.Rapidfire))
        {
            self waittill("weapon_fired");

            CurrentWeapon = self GetCurrentWeapon();

            if(!isDefined(CurrentWeapon))
                continue;

            for(a = 0; a < 3; a++)
            {
                MagicBullet(CurrentWeapon, self GetWeaponMuzzlePoint(), BulletTrace(self GetWeaponMuzzlePoint(), self GetWeaponMuzzlePoint() + self GetWeaponForwardDir() * 100, 0, undefined)["position"] + (RandomFloatRange(-5, 5), RandomFloatRange(-5, 5), RandomFloatRange(-5, 5)), self);
                wait 0.05;
            }
        }
    }
    else
         self notify("EndRapidFire");
}

LaunchPlayer()
{
    self SetOrigin(self.origin + (0, 0, 5));
    self SetVelocity(self GetVelocity() + (RandomIntRange(-500, 500), RandomIntRange(-500, 500), RandomIntRange(1500, 5000)));
}

DeadOpsArcade() {
    self.DeadOpsArcade = isDefined(self.DeadOpsArcade) ? undefined : true;
    if(isDefined(self.DeadOpsArcade))
    {
        self endon("EndDeadOpsArcade");
        while(isDefined(self.DeadOpsArcade))
        {
            birdsEyeCamera = spawn("script_model", self.origin + (0, 0, 600));
            birdsEyeCamera.angles = (90, 90, 0);
            birdsEyeCamera setModel("tag_origin");
            self CameraSetLookAt(birdsEyeCamera);
            self CameraSetPosition(birdsEyeCamera);
            self CameraActivate(true);
            
            temporaryOffset = 600;
            for(;;) {
                sightPassed = SightTracePassed(self.origin + (0, 0, 600), self.origin, false, birdsEyeCamera);
                if (sightPassed && birdsEyeCamera.origin[2] - self.origin[2] < 600) {
                    temporaryOffset = birdsEyeCamera.origin[2] - self.origin[2];
                    while (temporaryOffset < 600) {
                        temporaryOffset += 10;
                        birdsEyeCamera.origin = self.origin + (0, 0, temporaryOffset);
                        wait 0.01;
                    }
                }
                while (!SightTracePassed(self.origin + (0, 0, temporaryOffset), self.origin, false, birdsEyeCamera)) {
                    temporaryOffset -= 20;
                    birdsEyeCamera.origin = self.origin + (0, 0, temporaryOffset);
                    wait 0.01;
                }
                self SetPlayerAngles(self GetPlayerAngles() * (0, 1, 0));
                birdsEyeCamera.origin = self.origin + (0, 0, temporaryOffset);
                wait 0.01;
            }
        }
            
    }
    else{
         self notify("EndDeadOpsArcade");
         self CameraActivate(false);
    }
}

StartTeleportGun()
{
    self.TeleportGun = isDefined(self.TeleportGun) ? undefined : true;
    if (isDefined(self.TeleportGun))
    {
        self thread DoTeleportGun();
    } 
    else 
    {
        self notify("StopTeleportGun");
    }
}

DoTeleportGun() 
{
    self endon("StopTeleportGun");
    while(isDefined(self.TeleportGun))
    {
        self waittill("weapon_fired");
        self SetOrigin(bullettrace(self GetTagOrigin("tag_weapon"), self GetTagOrigin("tag_weapon") + vector_scal(AnglesToForward(self GetPlayerAngles()), 10000), 1, self)["position"]);
        wait .1;
    }
    wait .1;
}

vector_scal(vec, scale) 
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}