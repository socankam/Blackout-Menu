SetGametypeSettings()
{
    SetupItemSettings();
    
    setGametypeSetting(#"hash_14019eb043d9e43b", self.GameSettings["Spawn Zombies"]);
    setGametypeSetting(#"hash_3e2d2cf6b1cc6c68", self.GameSettings["Spawn Zombies"]);
    setGametypeSetting(#"wzzombies", self.GameSettings["Spawn Zombies"]);
    setGametypeSetting(#"wzzombiesmaxcount", self.GameSettings["Max Amount Of Zombies"]);

    system::ignore(#"wz_stash_blackjack");
    setgametypesetting(#"wzlootlockers", self.GameSettings["Enable Blackjack"]);
    setGametypeSetting(#"wzenablecontrabandstash", self.GameSettings["Enable Blackjack"]);

    setGametypeSetting(#"wzsnowballsenabled", self.GameSettings["Enable Snowballs"]);

    setGametypeSetting(#"wzwaterballoonsenabled", self.GameSettings["Enable Water Balloons"]);
    system::ignore(#"hash_502d65acd9829223");

    setGametypeSetting(#"wzenablewaverespawn", self.GameSettings["Enable Respawns"]);
    setGametypeSetting(#"waverespawndelay", self.GameSettings["Respawn Delay"]);
    setGametypeSetting(#"playernumlives", self.GameSettings["Number Of Lives"]);
    
	if(self.GameSettings["Enable Perks"] == false)
	{
		setGametypeSetting(self.perkArray[0], 0);
		setGametypeSetting(self.perkArray[1], 0);
		setGametypeSetting(self.perkArray[2], 0);
		setGametypeSetting(self.perkArray[3], 0);
		setGametypeSetting(self.perkArray[4], 0);
		setGametypeSetting(self.perkArray[5], 0);
		setGametypeSetting(self.perkArray[6], 0);
		setGametypeSetting(self.perkArray[7], 0);
		setGametypeSetting(self.perkArray[8], 0);
		setGametypeSetting(self.perkArray[9], 0);
		setGametypeSetting(self.perkArray[10], 0);
		setGametypeSetting(self.perkArray[11], 0);
		setGametypeSetting(self.perkArray[12], 0);
		setGametypeSetting(self.perkArray[13], 0);
		setGametypeSetting(self.perkArray[14], 0);
	}

	if(self.GameSettings["Enable Armor"] == false)
	{
		setGametypeSetting(self.armorSettings[0], 0);
		setGametypeSetting(self.armorSettings[1], 0);
		setGametypeSetting(self.armorSettings[2], 0);
		setGametypeSetting(self.armorSettings[3], 0);
	}

	if(self.GameSettings["Enable Attachments"] == false)
	{
		setGametypeSetting(self.attachmentSettings[0], 0);
		setGametypeSetting(self.attachmentSettings[1], 0);
		setGametypeSetting(self.attachmentSettings[2], 0);
		setGametypeSetting(self.attachmentSettings[3], 0);
		setGametypeSetting(self.attachmentSettings[4], 0);
		setGametypeSetting(self.attachmentSettings[5], 0);
		setGametypeSetting(self.attachmentSettings[6], 0);
		setGametypeSetting(self.attachmentSettings[7], 0);
		setGametypeSetting(self.attachmentSettings[8], 0);
		setGametypeSetting(self.attachmentSettings[9], 0);
		setGametypeSetting(self.attachmentSettings[10], 0);
		setGametypeSetting(self.attachmentSettings[11], 0);
		setGametypeSetting(self.attachmentSettings[12], 0);
		setGametypeSetting(self.attachmentSettings[13], 0);
		setGametypeSetting(self.attachmentSettings[14], 0);
		setGametypeSetting(self.attachmentSettings[15], 0);
	}

	if(self.GameSettings["Enable Health Items"] == false)
	{
		setGametypeSetting(self.healthItemSettings[0], 0);
		setGametypeSetting(self.healthItemSettings[1], 0);
		setGametypeSetting(self.healthItemSettings[2], 0);
	}
}

SetupItemSettings()
{
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