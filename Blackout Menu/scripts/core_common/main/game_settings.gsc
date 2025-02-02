SetGametypeSettings()
{
    if(Blackout()){
        SetupItemSettings();

        system::ignore(#"wz_stash_blackjack");
        system::ignore(#"hash_502d65acd9829223");

        setGametypeSetting(#"wzzombies", self.GameSettings["Spawn Zombies"]);
        setGametypeSetting(#"deathcircle", self.GameSettings["Enable Storm"]);
        setgametypesetting(#"wzlootlockers", self.GameSettings["Enable Blackjack"]);
        setGametypeSetting(#"onlyheadshots", self.GameSettings["Allow Only Headshots"]);
        setGametypeSetting(#"playernumlives", self.GameSettings["Number Of Lives"]);
        setGametypeSetting(#"waverespawndelay", self.GameSettings["Respawn Delay"]);
        setGametypeSetting(#"wzzombiesmaxcount", self.GameSettings["Max Amount Of Zombies"]);
        setGametypeSetting(#"wzsnowballsenabled", self.GameSettings["Enable Snowballs"]);
        setGametypeSetting(#"wzenablewaverespawn", self.GameSettings["Enable Respawns"]);
        setGametypeSetting(#"hash_14019eb043d9e43b", self.GameSettings["Spawn Zombies"]);
        setGametypeSetting(#"hash_3e2d2cf6b1cc6c68", self.GameSettings["Spawn Zombies"]);
        setGametypeSetting(#"wzwaterballoonsenabled", self.GameSettings["Enable Water Balloons"]);
        setGametypeSetting(#"wzenableblackjackstash", self.GameSettings["Enable Blackjack"]);
        setGametypeSetting(#"wzenablecontrabandstash", self.GameSettings["Enable Blackjack"]);
        
    
        if(self.GameSettings["Enable Perks"] == false)
        {
            foreach (PerkKey, Perk in self.perkArray)
            {
                setGametypeSetting(Perk, 0);
            }
        }

        if(self.GameSettings["Enable Armor"] == false)
        {
        foreach (ArmorKey, Armor in self.armorSettings)
            {
                setGametypeSetting(Armor, 0);
            }
        }

        if(self.GameSettings["Enable Attachments"] == false)
        {
            setGametypeSetting(#"disableattachments", 1);
        }

        if(self.GameSettings["Enable Health Items"] == false)
        {
            foreach (HealthKey, Health in self.healthItemSettings)
            {
                setGametypeSetting(Health, 0);
            }
        }
    }

    if(Multiplayer()){
        setGametypeSetting(#"drafttime", self.GameSettings["Draft Time"]);
    }
}

SetupItemSettings()
{
    if(Blackout()){
        self.perkArray = array();
        self.perkArray[0] = #"wzenableperkparanoia";
        self.perkArray[1] = #"wzenableperkconsumer";
        self.perkArray[2] = #"wzenableperkironlungs";
        self.perkArray[3] = #"wzenableperkbrawler";
        self.perkArray[4] = #"wzenableperkawareness";
        self.perkArray[5] = #"wzenableperklooter";
        self.perkArray[6] = #"wzenableperksquadlink";
        self.perkArray[7] = #"wzenableperkreinforced";
        self.perkArray[8] = #"wzenableperkmedic";
        self.perkArray[9] = #"hash_78e459ad87509a46";
        self.perkArray[10] = #"wzenableperkdeadsilence";
        self.perkArray[11] = #"wzenableperkstimulant";
        self.perkArray[12] = #"wzenableperkmobility";
        self.perkArray[13] = #"wzenableperkengineer";
        self.perkArray[14] = #"wzenableperkoutlander";

        self.armorSettings = array();
        self.armorSettings[0] = #"wzenablelv3armor";
        self.armorSettings[1] = #"wzenablelv2armor";
        self.armorSettings[2] = #"wzenablelv1armor";
        self.armorSettings[3] = #"wzenablearmorplate";

        self.attachmentSettings = array();
        self.attachmentSettings[0] = #"wzenable4xscope";
        self.attachmentSettings[1] = #"wzenable3xscope";
        self.attachmentSettings[2] = #"wzenable2xscope";
        self.attachmentSettings[3] = #"wzenableextfastmag";
        self.attachmentSettings[4] = #"wzenableextmag";
        self.attachmentSettings[5] = #"wzenableextbarrel";
        self.attachmentSettings[6] = #"wzenablefastmag";
        self.attachmentSettings[7] = #"wzenableforegrip";
        self.attachmentSettings[8] = #"wzenableholo";
        self.attachmentSettings[9] = #"wzenablelasersight";
        self.attachmentSettings[10] = #"wzenablepistolgrip";
        self.attachmentSettings[11] = #"wzenablereflex";
        self.attachmentSettings[12] = #"wzenablesniperscope";
        self.attachmentSettings[13] = #"wzenablestock";
        self.attachmentSettings[14] = #"wzenablesuppressor";
        self.attachmentSettings[15] = #"wzenableelo";

        self.healthItemSettings = array();
        self.healthItemSettings[0] = #"wzenablebandages";
        self.healthItemSettings[1] = #"wzenablemedkit";
        self.healthItemSettings[2] = #"wzenabletraumakit";
    }
}

Blackout() {
    return sessionmodeiswarzonegame();
}

Zombies() {
    return sessionmodeiszombiesgame();
}

Multiplayer() {
    return sessionmodeismultiplayergame();
}

ChangeMap(Map) {
    if (level.CurrentMap == Map){
        self iPrintLnBold("Map is already loaded!");
    }
    else{
        if(Multiplayer() || Zombies()){
            setDvar("ls_mapname", Map);
            setDvar("mapname", Map);
            setDvar("party_mapname", Map);
            setDvar("ui_mapname", Map);
            setDvar("ui_currentmap", Map);
            setDvar("ui_previewmap", Map);
            setDvar("ui_showmap", Map);
        }
        map(Map);
        wait(1);
        switchmap_switch();
    }
}

ChangeMode(Mode) {
    Map = util::get_map_name();
    switchmap_load(Map, Mode);
    wait(1);
    switchmap_switch();
}

RestartMap()
{
    map_restart(0);
}