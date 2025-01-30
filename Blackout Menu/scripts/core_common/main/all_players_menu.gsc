AllPlayersMenu()
{
    self createMenu("AllPlayersMenu", "All Players Menu");
    self addOption("AllPlayersMenu", "Lauch All Players Into The Sky", &LaunchAllPlayers, []);
    self addOption("AllPlayersMenu", "Mortar Strike All Players", &MortarStrikeAll, []);
    self addToggleOption("AllPlayersMenu", "Disable Shooting For Everyone", &DisableShooting, false);
    self addToggleOption("AllPlayersMenu", "Freeze Everyone's Controls", &FreezeControls, false);
    self addToggleOption("AllPlayersMenu", "Disable Sliding For Everyone", &DisableSliding, false);
}

LaunchAllPlayers()
{
    foreach (player in level.players) {
        if (player getEntityNumber() != 0) {
            player SetOrigin(player.origin + (0, 0, 5));
            player SetVelocity(player GetVelocity() + (RandomIntRange(-500, 500), RandomIntRange(-500, 500), RandomIntRange(1500, 5000)));
        }
    }
}

DisableShooting()
{
    self.DisableShooting = isDefined(self.DisableShooting) ? undefined : true;
 
    if(isDefined(self.DisableShooting))
    {
        foreach (player in level.players) {
            if (player getEntityNumber() != 0) {
                player disableWeapons();
            }
        }
    }
    else{
        foreach (player in level.players) {
            if (player getEntityNumber() != 0) {
                player enableWeapons(); 
            }
        }
    }
}

DisableSliding()
{
    self.DisableSliding = isDefined(self.DisableSliding) ? undefined : true;
 
    if(isDefined(self.DisableSliding))
    {
        foreach (player in level.players) {
            if (player getEntityNumber() != 0) {
                player allowslide(0);
            }
        }
    }
    else{
        foreach (player in level.players) {
            if (player getEntityNumber() != 0) {
                player allowslide(1); 
            }
        }
    }
}

FreezeControls()
{
    self.FreezeControls = isDefined(self.FreezeControls) ? undefined : true;
 
    if(isDefined(self.FreezeControls))
    {
        foreach (player in level.players) {
            if (player getEntityNumber() != 0) {
                player freezeControls(true);
            }
        }
    }
    else{
        foreach (player in level.players) {
            if (player getEntityNumber() != 0) {
                player freezeControls(false); 
            }
        }
    }
}

MortarStrikeAll()
{
    self endon("disconnect");
    foreach(player in level.players){
        if (player getEntityNumber() != 0) {
            for(a = 0; a < 5; a++)
            {
                MagicBullet(GetWeapon("launcher_standard_t8"), player.origin + (0, 0, 2500), player.origin);
                wait 0.15;
            }
        }
    }
}