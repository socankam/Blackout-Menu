ServerMenu(){
    self createMenu("ServerMenu", "Server Menu");
    self addOption("ServerMenu", "Lobby Settings", &OpenSubMenu, "LobbyMenu");
    self addOption("ServerMenu", "Change Map", &OpenSubMenu, "MapMenu");
    self addOption("ServerMenu", "Change Game Mode", &OpenSubMenu, "GameModeMenu");

    self createMenu("LobbyMenu", "Lobby Settings");
    self addOption("LobbyMenu", "Fun Lobby Options", &OpenSubMenu, "FunLobbyOptions");
    self addOption("LobbyMenu", "Bot Options Menu", &OpenSubMenu, "BotMenu");

    self createMenu("FunLobbyOptions", "Fun Lobby Options");
    self addToggleOption("FunLobbyOptions", "Super Jump", &SuperJump, false);
    self addToggleOption("FunLobbyOptions", "Super Speed", &SuperSpeed, false);
    self addToggleOption("FunLobbyOptions", "Low Gravity", &LowGravity, false);
    self addToggleOption("FunLobbyOptions", "Floating Dead Bodies", &FloatingBodies, false);

    self createMenu("BotMenu", "Bot Options Menu");
    self addOption("BotMenu", "Add Bot", &AddBotsToGame, "1");
    self addOption("BotMenu", "Add Max Amount Of Bots", &AddBotsToGame, "11");

    self createMenu("MapMenu", "Change Map");
    self addOption("MapMenu", "Default Map", &ChangeMap, "wz_open_skyscrapers");
    self addOption("MapMenu", "Alcatraz", &ChangeMap, "wz_escape");
    self addOption("MapMenu", "Alcatraz (Night)", &ChangeMap, "wz_escape_alt");

    self createMenu("GameModeMenu", "Change Game Mode");
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

ChangeMap(map) {
    map(map);
    wait(1);
    switchmap_switch();
}

ChangeMode(mode) {
    map = util::get_map_name();
    switchmap_load(map, mode);
    wait(1);
    switchmap_switch();
}

AddBotsToGame(Amount) 
{
    for (i = 0; i < int(Amount); i++) {
        AddTestClient();
        wait 0.2;
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