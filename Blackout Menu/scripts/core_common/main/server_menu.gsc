ServerMenu(){
    self createMenu("ServerMenu", "Server Menu");
    self addOption("ServerMenu", "Lobby Settings", &OpenSubMenu, "LobbyMenu");
    self addOption("ServerMenu", "Change Map", &OpenSubMenu, "MapMenu");
    self addOption("ServerMenu", "Restart Map", &RestartMap, []);
    if(Blackout() || Multiplayer()){
        self addOption("ServerMenu", "Change Game Mode", &OpenSubMenu, "GameModeMenu");
    }

    self createMenu("LobbyMenu", "Lobby Settings");
    self addOption("LobbyMenu", "Fun Lobby Options", &OpenSubMenu, "FunLobbyOptions");
    if(Blackout() || Multiplayer()){
        self addOption("LobbyMenu", "Bot Options Menu", &OpenSubMenu, "BotMenu");
    }

    self createMenu("FunLobbyOptions", "Fun Lobby Options");
    self addToggleOption("FunLobbyOptions", "Super Jump", &SuperJump, false);
    self addToggleOption("FunLobbyOptions", "Super Speed", &SuperSpeed, false);
    self addToggleOption("FunLobbyOptions", "Low Gravity", &LowGravity, false);
    self addToggleOption("FunLobbyOptions", "Floating Dead Bodies", &FloatingBodies, false);

    self createMenu("BotMenu", "Bot Options Menu");
    self addOption("BotMenu", "Add Bot", &AddBotsToGame, "1");
    self addOption("BotMenu", "Add Max Amount Of Bots", &AddBotsToGame, "11");
    
    self createMenu("MapMenu", "Change Map");
    if(Blackout()){
        self addOption("MapMenu", "Default Map", &ChangeMap, "wz_open_skyscrapers");
        self addOption("MapMenu", "Alcatraz", &ChangeMap, "wz_escape");
        self addOption("MapMenu", "Alcatraz (Night)", &ChangeMap, "wz_escape_alt");
    }

    if(Multiplayer()){
        self addOption("MapMenu", "Der Schatten", &ChangeMap, "mp_austria");
        self addOption("MapMenu", "Havana", &ChangeMap, "mp_cairo");
        self addOption("MapMenu", "Casino", &ChangeMap, "mp_casino");
        self addOption("MapMenu", "Launch", &ChangeMap, "mp_cosmodrome");
        self addOption("MapMenu", "Elevation", &ChangeMap, "mp_elevation");
        self addOption("MapMenu", "Masquerade", &ChangeMap, "mp_embassy");
        self addOption("MapMenu", "Firing Range", &ChangeMap, "mp_firingrange2");
        self addOption("MapMenu", "Firing Range Night", &ChangeMap, "mp_firingrange2_alt");
        self addOption("MapMenu", "Frequency", &ChangeMap, "mp_frenetic");
        self addOption("MapMenu", "Artifact", &ChangeMap, "mp_geothermal");
        self addOption("MapMenu", "Gridlock", &ChangeMap, "mp_gridlock");
        self addOption("MapMenu", "Grind", &ChangeMap, "mp_grind");
        self addOption("MapMenu", "Hacienda", &ChangeMap, "mp_hacienda");
        self addOption("MapMenu", "Hacienda Twilight", &ChangeMap, "mp_hacienda_alt");
        self addOption("MapMenu", "Icebreaker", &ChangeMap, "mp_icebreaker");
        self addOption("MapMenu", "Jungle Flooded", &ChangeMap, "mp_jungle2");
        self addOption("MapMenu", "Jungle", &ChangeMap, "mp_jungle2_alt");
        self addOption("MapMenu", "Madagascar", &ChangeMap, "mp_madagascar");
        self addOption("MapMenu", "Lair", &ChangeMap, "mp_maldives");
        self addOption("MapMenu", "Militia", &ChangeMap, "mp_militia");
        self addOption("MapMenu", "Morocco", &ChangeMap, "mp_morocco");
        self addOption("MapMenu", "Summit", &ChangeMap, "mp_mountain2");
        self addOption("MapMenu", "Nuketown", &ChangeMap, "mp_nuketown_4");
        self addOption("MapMenu", "Contraband", &ChangeMap, "mp_offshore");
        self addOption("MapMenu", "Contraband Hurricane", &ChangeMap, "mp_offshore_alt");
        self addOption("MapMenu", "WMD", &ChangeMap, "mp_russianbase");
        self addOption("MapMenu", "Seaside", &ChangeMap, "mp_seaside");
        self addOption("MapMenu", "Seaside Sunset", &ChangeMap, "mp_seaside_alt");
        self addOption("MapMenu", "Payload", &ChangeMap, "mp_silo");
        self addOption("MapMenu", "Slums", &ChangeMap, "mp_slums2");
        self addOption("MapMenu", "Lockup", &ChangeMap, "mp_station");
        self addOption("MapMenu", "Arsenal", &ChangeMap, "mp_urban");
        self addOption("MapMenu", "Arsenal Sandstorm", &ChangeMap, "mp_urban_alt");
        self addOption("MapMenu", "Remnant", &ChangeMap, "mp_zombie_museum");
    }

    if(Zombies()){
        self addOption("MapMenu", "IX", &ChangeMap, "zm_towers");
        self addOption("MapMenu", "Blood Of The Dead", &ChangeMap, "zm_escape");
        self addOption("MapMenu", "Voyage of Despair", &ChangeMap, "zm_zodt8");
        self addOption("MapMenu", "Dead of The Night", &ChangeMap, "zm_mansion");
        self addOption("MapMenu", "Ancient Evil", &ChangeMap, "zm_red");
        self addOption("MapMenu", "Alpha Omega", &ChangeMap, "zm_white");
        self addOption("MapMenu", "Classified", &ChangeMap, "zm_office");
        self addOption("MapMenu", "Tag Der Toten", &ChangeMap, "zm_orange");
    }

    self createMenu("GameModeMenu", "Change Game Mode");
    if(Multiplayer()){
        self addToggleOption("GameModeMenu", "Roll The Dice", &initrollthedice, false);
    }
    if(level.CurrentMap == "wz_open_skyscrapers"){
        self addOption("GameModeMenu", "Solo", &ChangeMode, "warzone_solo");
        self addOption("GameModeMenu", "Duos", &ChangeMode, "warzone_duo");
        self addOption("GameModeMenu", "Quads", &ChangeMode, "warzone_quad");
        self addOption("GameModeMenu", "Heavy Metal Heroes", &ChangeMode, "warzone_heavy_metal_heroes");
        self addOption("GameModeMenu", "Hot Pursuit", &ChangeMode, "warzone_hot_pursuit");
        self addOption("GameModeMenu", "Ground War", &ChangeMode, "warzone_bigteam_dbno_quad");
        self addOption("GameModeMenu", "Pandemic", &ChangeMode, "warzone_pandemic_quad");
    }
    if (level.CurrentMap == "wz_escape" || level.CurrentMap == "wz_escape_alt"){
        self addOption("GameModeMenu", "Solo", &ChangeMode, "warzone_escape_solo");
        self addOption("GameModeMenu", "Duos", &ChangeMode, "warzone_escape_duo_dbno");
        self addOption("GameModeMenu", "Quads", &ChangeMode, "warzone_escape_quad_dbno");
    }
}

SuperJump()
{
   self.SuperJump = isDefined(self.SuperJump) ? undefined : true;
    if(isDefined(self.SuperJump))
    {
        foreach(player in level.players)
            player thread AllSuperJump();
    }
    else
        self SetVelocity(self GetVelocity() + (0, 0, 15));
}

AllSuperJump()
{
    self endon("disconnect");
    
    while(isDefined(self.SuperJump))
    {
        if(self JumpButtonPressed())
        {
            for(i=0;i<5;i++)
                self SetVelocity(self GetVelocity() + (0, 0, 140));

            while(!self IsOnGround())
                wait .05;
        }
        wait .05; 
    }
}

SuperSpeed()
{
    self.SuperSpeed = isDefined(self.SuperSpeed) ? undefined : true;
 
    if(isDefined(self.SuperSpeed))
    {
        self endon("disconnect");
 
        while(isDefined(self.SuperSpeed)) 
        {
            setDvar("g_speed", 500);
            wait 0.1;
        }
    }
    else
        setDvar("g_speed", 200);
}

LowGravity()
{
    self.LowGravity = isDefined(self.LowGravity) ? undefined : true;
    if(isDefined(self.LowGravity))
        SetDvar("bg_gravity", 100);
    else 
        SetDvar("bg_gravity", 350);
}

FloatingBodies()
{
    if(!isDefined(self.FloatingBodies))
    {
        self.FloatingBodies = true;
        setDvar("phys_gravity", 100);
    }
    else 
    {
        self.FloatingBodies = undefined;
        setDvar("phys_gravity", 800);
    }
}