//Thanks to ATE for the camo values, etc.
WeaponsMenu(){
    self createMenu("WeaponOptions", "Weapons Menu");
    self addOption("WeaponOptions", "Ammo Modifications Menu", &OpenSubMenu, "AmmoModifications");
    self addOption("WeaponOptions", "Give Weapon", &OpenSubMenu, "WeaponsMenu");
    self addOption("WeaponOptions", "Camo Menu", &OpenSubMenu, "CamoMenu");
    
    self createMenu("AmmoModifications", "Ammo Modifications");
    self addToggleOption("AmmoModifications", "Enable Ammo Modifier", &AmmoModifier, false);
    self addOption("AmmoModifications", "Shoot Rockets", &SetAmmoMod, "launcher_standard_t8");
    self addOption("AmmoModifications", "Shoot Raygun Ammo", &SetAmmoMod, "ray_gun");
    self addOption("AmmoModifications", "Shoot Paladin HB50 Ammo", &SetAmmoMod, "sniper_powerbolt_t8");
    self addOption("AmmoModifications", "Shoot Savage Impaler Ammo", &SetAmmoMod, "ww_crossbow_impaler_t8");
    self addOption("AmmoModifications", "Shoot Blundergat Ammo", &SetAmmoMod, "ww_blundergat_t8");
    if (level.CurrentMap == "wz_escape" || level.CurrentMap == "wz_escape_alt"){
        self addOption("AmmoModifications", "Shoot Give Raygun MK2 Ammo", &SetAmmoMod, "ray_gun_mk2");
        self addOption("AmmoModifications", "Shoot Give Raygun MK2 X Ammo", &SetAmmoMod, "ray_gun_mk2x");
        self addOption("AmmoModifications", "Shoot Give Raygun MK2 Y Ammo", &SetAmmoMod, "ray_gun_mk2y");
        self addOption("AmmoModifications", "Shoot Give Raygun MK2 Z Ammo", &SetAmmoMod, "ray_gun_mk2z");
        
    }

    self createMenu("WeaponsMenu", "Give Weapon");
    self addOption("WeaponsMenu", "Special Weapons", &OpenSubMenu, "SpecialWeapons");
    self addOption("WeaponsMenu", "Assault Rifles", &OpenSubMenu, "AssaultRifles");
    self addOption("WeaponsMenu", "Sub Machine Guns", &OpenSubMenu, "SubMachineGuns");
    self addOption("WeaponsMenu", "Tactical Rifles", &OpenSubMenu, "TacticalRifles");
    self addOption("WeaponsMenu", "Sniper Rifles", &OpenSubMenu, "SniperRifles");
    self addOption("WeaponsMenu", "Light Machine Guns", &OpenSubMenu, "LightMachineGuns");
    self addOption("WeaponsMenu", "Shotguns", &OpenSubMenu, "Shotguns");
    self addOption("WeaponsMenu", "Pistols", &OpenSubMenu, "Pistols");

    self createMenu("SpecialWeapons", "Special Weapons");
    self addOption("SpecialWeapons", "Raygun Varients", &OpenSubMenu, "Rayguns");
    self addOption("SpecialWeapons", "Other Wonder Weapons", &OpenSubMenu, "WonderWeapons");

    self createMenu("Rayguns", "Raygun Varients");
    self addOption("Rayguns", "Give Raygun", &GivePlayerWeapon, "ray_gun");
    if (level.CurrentMap == "wz_escape" || level.CurrentMap == "wz_escape_alt"){
        self addOption("Rayguns", "Give Raygun MK2", &GivePlayerWeapon, "ray_gun_mk2");
        self addOption("Rayguns", "Give Raygun MK2 X", &GivePlayerWeapon, "ray_gun_mk2x");
        self addOption("Rayguns", "Give Raygun MK2 Y", &GivePlayerWeapon, "ray_gun_mk2y");
        self addOption("Rayguns", "Give Raygun MK2 Z", &GivePlayerWeapon, "ray_gun_mk2z");
    }

    self createMenu("WonderWeapons", "Other Wonder Weapons");
    if (level.CurrentMap == "wz_escape" || level.CurrentMap == "wz_escape_alt"){
        //Add Alcatraz specific weapons here
    }
    self addOption("WonderWeapons", "Blundergat", &GivePlayerWeapon, "ww_blundergat_t8");
    self addOption("WonderWeapons", "Savage Impaler", &GivePlayerWeapon, "ww_crossbow_impaler_t8");

    self createMenu("AssaultRifles", "Assault Rifles");
    self addOption("AssaultRifles", "Give ICR-7", &GivePlayerWeapon, "ar_accurate_t8");
    self addOption("AssaultRifles", "Give Maddox RFB", &GivePlayerWeapon, "ar_fastfire_t8");
    self addOption("AssaultRifles", "Give AN-94", &GivePlayerWeapon, "ar_an94_t8");
    self addOption("AssaultRifles", "Give Peacekeeper", &GivePlayerWeapon, "ar_peacekeeper_t8");
    self addOption("AssaultRifles", "Give Echohawk", &GivePlayerWeapon, "ar_doublebarrel_t8");
    self addOption("AssaultRifles", "Give Rampart 17", &GivePlayerWeapon, "ar_damage_t8");
    self addOption("AssaultRifles", "Give Vapr-XKG", &GivePlayerWeapon, "ar_stealth_t8");
    self addOption("AssaultRifles", "Give KN-57", &GivePlayerWeapon, "ar_modular_t8");
    self addOption("AssaultRifles", "Give Swat RFT", &GivePlayerWeapon, "ar_standard_t8");
    self addOption("AssaultRifles", "Give Grav", &GivePlayerWeapon, "ar_galil_t8");

    self createMenu("SubMachineGuns", "Sub Machine Guns");
    self addOption("SubMachineGuns", "Give VMP", &GivePlayerWeapon, "smg_vmp_t8");
    self addOption("SubMachineGuns", "Give MicroMG", &GivePlayerWeapon, "smg_minigun_t8");
    self addOption("SubMachineGuns", "Give MP-40", &GivePlayerWeapon, "smg_mp40_t8");
    self addOption("SubMachineGuns", "Give MX9", &GivePlayerWeapon, "smg_standard_t8");
    self addOption("SubMachineGuns", "Give Saug 9mm", &GivePlayerWeapon, "smg_handling_t8");
    self addOption("SubMachineGuns", "Give Spitfire", &GivePlayerWeapon, "smg_fastfire_t8");
    self addOption("SubMachineGuns", "Give Cordite", &GivePlayerWeapon, "smg_capacity_t8");
    self addOption("SubMachineGuns", "Give GKS", &GivePlayerWeapon, "smg_accurate_t8");
    self addOption("SubMachineGuns", "Give Daemon 3XB", &GivePlayerWeapon, "smg_fastburst_t8");
    self addOption("SubMachineGuns", "Give Switchblade X9", &GivePlayerWeapon, "smg_folding_t8");

    self createMenu("TacticalRifles", "Tactical Rifles");
    self addOption("TacticalRifles", "Give Auger DMR", &GivePlayerWeapon, "tr_powersemi_t8");
    self addOption("TacticalRifles", "Give Swordfish", &GivePlayerWeapon, "tr_longburst_t8");
    self addOption("TacticalRifles", "Give ABR .223", &GivePlayerWeapon, "tr_midburst_t8");
    self addOption("TacticalRifles", "Give S6 Stingray", &GivePlayerWeapon, "tr_flechette_t8");
    self addOption("TacticalRifles", "Give M16", &GivePlayerWeapon, "tr_damageburst_t8");

    self createMenu("LightMachineGuns", "Light Machine Guns");
    self addOption("LightMachineGuns", "Give Hades", &GivePlayerWeapon, "lmg_spray_t8");
    self addOption("LightMachineGuns", "Give Tigershark", &GivePlayerWeapon, "lmg_stealth_t8");
    self addOption("LightMachineGuns", "Give Titan", &GivePlayerWeapon, "lmg_standard_t8");
    self addOption("LightMachineGuns", "Give VKM 750", &GivePlayerWeapon, "lmg_heavy_t8");

    self createMenu("Shotguns", "Shotguns");
    self addOption("Shotguns", "Give MOG 12", &GivePlayerWeapon, "shotgun_pump_t8");
    self addOption("Shotguns", "Give SG12", &GivePlayerWeapon, "shotgun_semiauto_t8");
    self addOption("Shotguns", "Give Rampage", &GivePlayerWeapon, "shotgun_fullauto_t8");
    self addOption("Shotguns", "Give Argus", &GivePlayerWeapon, "shotgun_precision_t8");

    self createMenu("SniperRifles", "Sniper Rifles");
    self addOption("SniperRifles", "Give Paladin HB50", &GivePlayerWeapon, "sniper_powerbolt_t8");
    self addOption("SniperRifles", "Havelina AA50", &GivePlayerWeapon, "sniper_damagesemi_t8");
    self addOption("SniperRifles", "Give Locus", &GivePlayerWeapon, "sniper_locus_t8");
    self addOption("SniperRifles", "Give Vendetta", &GivePlayerWeapon, "sniper_mini14_t8");
    self addOption("SniperRifles", "Give Koshka", &GivePlayerWeapon, "sniper_quickscope_t8");
    self addOption("SniperRifles", "Give Outlaw", &GivePlayerWeapon, "sniper_fastrechamber_t8");
    self addOption("SniperRifles", "Give SDM", &GivePlayerWeapon, "sniper_powersemi_t8");

    self createMenu("Pistols", "Pistols");
    self addOption("Pistols", "Give Strife", &GivePlayerWeapon, "pistol_standard_t8");
    self addOption("Pistols", "Give KAP-45", &GivePlayerWeapon, "pistol_fullauto_t8");
    self addOption("Pistols", "Give RK 7 Garrison", &GivePlayerWeapon, "pistol_burst_t8");
    self addOption("Pistols", "Give Mozu", &GivePlayerWeapon, "pistol_revolver_t8");

    self createMenu("CamoMenu", "Camo Menu");
    self addOption("CamoMenu", "Mastery Camos", &OpenSubMenu, "MasteryCamos");
    self addOption("CamoMenu", "Pack-A-Punch Camos", &OpenSubMenu, "PAPCamos");
    self addOption("CamoMenu", "Reactive Camos", &OpenSubMenu, "ReactiveCamos");

    self createMenu("MasteryCamos", "Mastery Camos");
    self addOption("MasteryCamos", "Apply Gold Camo", &ApplyCamo, "43");
    self addOption("MasteryCamos", "Apply Diamond Camo", &ApplyCamo, "44");
    self addOption("MasteryCamos", "Apply Dark Matter Camo", &ApplyCamo, "45");
    self addOption("MasteryCamos", "Apply Diamond Camo (Last tier)", &ApplyCamo, "199");
    self addOption("MasteryCamos", "Apply Dark Matter Camo (Last tier)", &ApplyCamo, "192");

    self createMenu("PAPCamos", "Pack-A-Punch Camos");
    self addOption("PAPCamos", "Apply Voyage Of Despair Purple Camo", &ApplyCamo, "146");
    self addOption("PAPCamos", "Apply Voyage Of Despair Red Camo", &ApplyCamo, "147");
    self addOption("PAPCamos", "Apply Voyage Of Despair Green Camo", &ApplyCamo, "148");
    self addOption("PAPCamos", "Apply Voyage Of Despair Yellow Camo", &ApplyCamo, "149");
    self addOption("PAPCamos", "Apply Voyage Of Despair Pink Camo", &ApplyCamo, "150");
    self addOption("PAPCamos", "Apply IX Blue Camo", &ApplyCamo, "151");
    self addOption("PAPCamos", "Apply IX Red Camo", &ApplyCamo, "152");
    self addOption("PAPCamos", "Apply IX Green Camo", &ApplyCamo, "153");
    self addOption("PAPCamos", "Apply IX Purple Camo", &ApplyCamo, "154");
    self addOption("PAPCamos", "Apply IX Orange Camo", &ApplyCamo, "155");
    self addOption("PAPCamos", "Apply Blood Of The Dead Yellow Camo", &ApplyCamo, "156");
    self addOption("PAPCamos", "Apply Blood Of The Dead Red Camo", &ApplyCamo, "157");
    self addOption("PAPCamos", "Apply Blood Of The Dead Green Camo", &ApplyCamo, "159");
    self addOption("PAPCamos", "Apply Blood Of The Dead Purple Camo", &ApplyCamo, "160");
    self addOption("PAPCamos", "Apply Classified 1 Camo", &ApplyCamo, "161");
    self addOption("PAPCamos", "Apply Classified 2 Camo", &ApplyCamo, "162");
    self addOption("PAPCamos", "Apply Classified 3 Camo", &ApplyCamo, "163");
    self addOption("PAPCamos", "Apply Classified 4 Camo", &ApplyCamo, "164");
    self addOption("PAPCamos", "Apply Classified 5 Camo", &ApplyCamo, "165");
    self addOption("PAPCamos", "Apply Dead Of The Night Green Camo", &ApplyCamo, "280");
    self addOption("PAPCamos", "Apply Dead Of The Night Purple Camo", &ApplyCamo, "281");
    self addOption("PAPCamos", "Apply Dead Of The Night Red Camo", &ApplyCamo, "282");
    self addOption("PAPCamos", "Apply Dead Of The Night Blue Camo", &ApplyCamo, "283");
    self addOption("PAPCamos", "Apply Dead Of The Night Orange Camo", &ApplyCamo, "284");
    self addOption("PAPCamos", "Apply Ancient Evil Purple Camo", &ApplyCamo, "74");
    self addOption("PAPCamos", "Apply Ancient Evil Blue Camo", &ApplyCamo, "75");
    self addOption("PAPCamos", "Apply Ancient Evil Orange Camo", &ApplyCamo, "76");
    self addOption("PAPCamos", "Apply Ancient Evil Yellow Camo", &ApplyCamo, "77");
    self addOption("PAPCamos", "Apply Ancient Evil Green Camo", &ApplyCamo, "78");

    self createMenu("ReactiveCamos", "Reactive Camos");
    self addOption("ReactiveCamos", "Apply D-Day Camo", &ApplyCamo, "298");
    self addOption("ReactiveCamos", "Apply Roadtrip Camo", &ApplyCamo, "300");
    self addOption("ReactiveCamos", "Apply Masked Camo", &ApplyCamo, "310");
    self addOption("ReactiveCamos", "Apply Bobine Camo", &ApplyCamo, "52");
    self addOption("ReactiveCamos", "Apply Search Camo", &ApplyCamo, "57");
    self addOption("ReactiveCamos", "Apply Strip Camo", &ApplyCamo, "62");
    self addOption("ReactiveCamos", "Apply Rave Camo", &ApplyCamo, "67");
    self addOption("ReactiveCamos", "Apply Nebula Camo", &ApplyCamo, "89");
    self addOption("ReactiveCamos", "Apply Roadtrip Camo", &ApplyCamo, "300");
    self addOption("ReactiveCamos", "Apply After Life Camo", &ApplyCamo, "90");
    self addOption("ReactiveCamos", "Apply Roadtrip Camo", &ApplyCamo, "300");
    self addOption("ReactiveCamos", "Apply Postluminescence Camo", &ApplyCamo, "119");
    self addOption("ReactiveCamos", "Apply 115 Camo", &ApplyCamo, "129");
    self addOption("ReactiveCamos", "Apply Grey Matter Camo", &ApplyCamo, "131");
    self addOption("ReactiveCamos", "Apply Denied Access (Waifu) Camo", &ApplyCamo, "167");
    self addOption("ReactiveCamos", "Apply Skull Camo", &ApplyCamo, "168");
    self addOption("ReactiveCamos", "Apply Solar Eruption Camo", &ApplyCamo, "381");
    self addOption("ReactiveCamos", "Apply Vision Of The Future Camo", &ApplyCamo, "387");
    self addOption("ReactiveCamos", "Apply Pestilence Camo", &ApplyCamo, "389");
    self addOption("ReactiveCamos", "Apply Crypted Camo", &ApplyCamo, "286");
    self addOption("ReactiveCamos", "Apply Judas Camo", &ApplyCamo, "357");
    self addOption("ReactiveCamos", "Apply Incandescent Camo", &ApplyCamo, "359");
    self addOption("ReactiveCamos", "Apply Encoded Camo", &ApplyCamo, "363");
}

GivePlayerWeapon(Weapon)
{
    self giveWeapon(getWeapon(Weapon));
    wait .1;
    self giveMaxAmmo(getWeapon(Weapon));
    wait .1;
    self switchToWeapon(getWeapon(Weapon));
}

ApplyCamo(Camo) 
{
    Weapon = self getcurrentweapon();
    self setcamo(Weapon, Int(Camo));
} 

AmmoModifier()
{
    self.AmmoModifier = isDefined(self.AmmoModifier) ? undefined : true;
 
    if(isDefined(self.AmmoModifier))
    {
        self endon("disconnect");
        self endon("StopAmmoModifier");
 
        while(isDefined(self.AmmoModifier)) 
        {
            self.AmmoModifier = true;
            wait .15;
        }
    }
    else
        self notify("StopAmmoModifier");
        self.AmmoModifier = undefined;
}

SetAmmoMod(AmmoType){
    if(!isDefined(self.AmmoModifier))
    {
        self iPrintlnBold("Please enable the ammo modifier.");
        return;
    }
    
    self notify("StopAmmoModifier");
    wait 0.05;

    self endon("disconnect");
    self endon("StopAmmoModifier");
    
    while(isDefined(self.AmmoModifier)) 
    {
        self waittill(#"weapon_fired");

        MagicBullet(getWeapon(AmmoType), self getPlayerCameraPos(), BulletTrace(self getPlayerCameraPos(), self getPlayerCameraPos() + anglesToForward(self getPlayerAngles())  * 100000, false, self)["position"], self);
        wait .25;
    }
}