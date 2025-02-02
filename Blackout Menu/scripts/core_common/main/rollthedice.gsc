initrollthedice()
{
    self.dicegame = isDefined(self.dicegame) ? undefined : true;

    if (isDefined(self.dicegame))
    {
        foreach(player in level.players)
        {
            player iPrintLnBold("[{+frag}] ^2Roll ^3The ^2Dice^3! [{+frag}]");
            player thread startrollthedice(player);
        }
    }
    else
    {
        foreach (player in level.players)
        {
            player notify("83f68f92ea00b17aa5684488a2732bfc");
        }
    }
}

startrollthedice(player)
{
    player endon("disconnect");
    player endon("83f68f92ea00b17aa5684488a2732bfc");

    player DoDamage(player.health + 1, player.origin);

    dicefunctions = [];
    dicefunctions[0] = "deadopsarcade";
    dicefunctions[1] = "onfire";
    dicefunctions[2] = "thirdperson";
    dicefunctions[3] = "superjump";
    dicefunctions[4] = "obesewalk";
    dicefunctions[5] = "professionalcamper";
    dicefunctions[6] = "anticamp";
    dicefunctions[7] = "godmode";
    dicefunctions[8] = "juggernaut";
    dicefunctions[9] = "drunk";
    dicefunctions[10] = "rockets";
    dicefunctions[11] = "iceskating";
    dicefunctions[12] = "rapidfire";
    dicefunctions[13] = "raygun";
    dicefunctions[14] = "supersprint";
    dicefunctions[15] = "superfast";

    player.usedFunctions = [];

    while(isDefined(self.dicegame))
    {
        player waittill("spawned_player"); 

        for(a=0; a<9; a++)
            player iPrintln("");

        player thread resetspawnvars(player);

        if (player.usedFunctions.size == dicefunctions.size)
        {
            player iPrintLnBold("^3You've rolled everything!");
            break;
        }

        player iPrintLnBold("^2Rolling the dice.....");
        wait 2;

        rollSuccessful = false;

        while(!rollSuccessful)
        {
            rollIndex = randomInt(dicefunctions.size);
            functionName = dicefunctions[rollIndex];

            if (!isDefined(player.usedFunctions[functionName]))
            {
                player.usedFunctions[functionName] = true;
                player thread startFunction(player, functionName);
                rollSuccessful = true;
            }
        }

        wait 1;
    }
}

startFunction(player, functionName)
{
    switch (functionName)
    {
        case "deadopsarcade":
            player iPrintLnBold("^2Dead Ops Arcade!");
            player iPrintLn("^2Tip: ^3You will have the 'Dead Ops Arcade' camera view until you respawn.");
            player thread birdseyeview();
            break;
        case "onfire":
            player iPrintLnBold("^1You're on fire!");
            player iPrintLn("^2Tip: ^3Your vision will return to normal when you respawn.");
            player thread firevision();
            break;
        case "thirdperson":
            player iPrintLnBold("^3Third person mode!");
            player iPrintLn("^2Tip: ^3You will return to first person mode when you respawn.");
            player thread dothirdperson();
            break;
        case "superjump":
            player iPrintLnBold("^2Super Jump!");
            player iPrintLn("^2Tip: ^3You will have super jump until you respawn.");
            player thread bouncemode();
            break;
        case "obesewalk":
            player iPrintLnBold("^2Morbidly Obese!");
            player iPrintLn("^2Tip: ^3When you walk, you trigger an earthquake.");
            player thread obesewalk();
            break;
        case "professionalcamper":
            player iPrintLnBold("^5Professional camper!");
            player iPrintLn("^2Tip: ^3Stay still to be able to use your weapons!");
            player thread camperpro();
            break;
        case "anticamp":
            player iPrintLnBold("^2Anti-camp!");
            player iPrintLn("^2Tip: ^3If you camp / stand still, your health decreases.");
            player thread doanticamp();
            break;
        case "godmode":
            player iPrintLnBold("^3You have god mode for 15 seconds!");
            player iPrintLn("^2Tip: ^3You will be invincible for the next 15 seconds.");
            player thread dogodmode();
            break;
        case "juggernaut":
            player iPrintLnBold("^3You're a ^5juggernaut!");
            player iPrintLn("^2Tip: ^3You have a large amount of health, but the bad part is you move slow.");
            player thread dojuggernaut();
            break;
        case "drunk":
            player iPrintLnBold("^5You're drunk!");
            player iPrintLn("^2Tip: ^3You've had too many drinks! You will sober up when you respawn.");
            player thread drunkmovement();
            break;
        case "rockets":
            player iPrintLnBold("^5It's Raining rockets!");
            player iPrintLn("^2Tip: ^3It's raining rockets! Take cover inside to stay safe.");
            player thread meteorShower();
            break;
        default:
        case "iceskating":
            player iPrintLnBold("^5Ice skating!");
            player iPrintLn("^2Tip: ^3The ground is ice!");
            player thread doiceskating();
            break;
        case "rapidfire":
            player iPrintLnBold("^5Rapid fire!");
            player iPrintLn("^2Tip: ^3You have rapid fire! Your guns will shoot much faster.");
            player thread dorapidfire();
            break;
        case "raygun":
            player iPrintLnBold("^5Zombie slayer!");
            player iPrintLn("^2Tip: ^3You have a Ray-gun until you respawn.");
            player thread doraygun();
            break;
        case "supersprint":
            player iPrintLnBold("^5Super Sprint!");
            player iPrintLn("^2Tip: ^3You will have super sprint until you respawn.");
            player setPerk("specialty_playeriszombie");
            break;
        case "superfast":
            player iPrintLnBold("^5Super Fast!");
            player iPrintLn("^2Tip: ^3Everything you do will be fast until you respawn. (ADS, Speed, Rel;oad, etc.)");
            player setPerk("specialty_playeriszombie");
            player setPerk("specialty_fastads");
            player setPerk("specialty_fastweaponswitch");
            player setPerk("specialty_fastreload");
            break;
        default:
            player iPrintLnBold("^1Unknown dice function: " + functionName);
            break;
    }
}

resetspawnvars(player)
{
    player ForceSlick(0);
    player SetBlur(0, .01);
    player CameraActivate(false);
    player setPlayerAngles(player.angles + (0,0,0));
}

doiceskating()
{
    self endon("death");
    self ForceSlick(1);
}

doraygun() 
{
    playerweapon = self getCurrentWeapon();
    self TakeWeapon(playerweapon);
    wait .5;
    self TakeWeapon(playerweapon);
    self giveWeapon(getWeapon("ray_gun"));
    wait .1;
    self switchToWeapon(getWeapon("ray_gun"));
} 

meteorShower()
{
    self endon("death");

    self.health = 250;
    while(true)
    {
        target = self.origin + (0, 0, 3500);

        for(a = -1; a < 2; a += 2)
            for(b = 0; b < 5; b++)
            {
                MagicBullet(GetWeapon("launcher_standard_t8"), target, target - (0, b * (a * 25), 2500), self);
                wait 0.25;
            }

        for(a = -1; a < 2; a += 2)
            for(b = 0; b < 5; b++)
            {
                MagicBullet(GetWeapon("launcher_standard_t8"), target, target - (b * (a * 25), 0, 2500), self);
                wait 0.25;
            }
    }
}

birdseyeview() {
    self endon("death");

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

firevision()
{
    self endon("death");
    for(;;) {
        self clientfield::set("burn", 1);
        self waittill("death");
        self clientfield::set("burn", 0);
    }
}

dothirdperson()
{
    self endon("death");
    for(;;) {
        self setclientthirdperson(true);
        self waittill("death");
        self setclientthirdperson(false);
    }
}

obesewalk()
{
    self endon("death");
	for(;;)
	{
		if(self isMoving() && self isOnGround())
		{
			earthquake(0.3,0.25,self getTagOrigin("j_spinelower"),180);
		}
		wait 0.2;
    }
}

doanticamp()
{
    self endon("disconnect");
    self endon("death");

    for(;;)
    {
        wait(0.1); 

        if(!self isMoving())
        {
            self.health -= 5;
            self iPrintLnBold("^1Stop camping!");
        }

        if (self.health <= 0)
        {
            self DoDamage(self.health + 999, self.origin);
        }
    }
}

dorapidfire()
{
    self endon("death");
    for(;;)
    {
        self waittill("weapon_fired");

        weapon = self GetCurrentWeapon();

        for(a = 0; a < 3; a++)
        {
            MagicBullet(weapon, self GetWeaponMuzzlePoint(), BulletTrace(self GetWeaponMuzzlePoint(), self GetWeaponMuzzlePoint() + self GetWeaponForwardDir() * 100, 0, undefined)["position"] + (RandomFloatRange(-5, 5), RandomFloatRange(-5, 5), RandomFloatRange(-5, 5)), self);
            wait 0.05;
        }
    }
}

dojuggernaut()
{
	self endon("disconnect");
    self endon("death");

	self.health = 1000;

	self takeAllWeapons();
	self giveWeapon(getWeapon("lmg_heavy_t8"));

    wait .5;
    self switchToWeapon(getWeapon("lmg_heavy_t8"));

	self allowSprint(false);
}

dogodmode()
{
	self EnableInvulnerability();
	wait 15;
	self DisableInvulnerability();
	self iPrintlnBold("^2God mode ^1OFF");
}

camperpro()
{
	self endon("disconnect");
    self endon("death");

	for(;;)
	{
		if(self isMoving())
		{
			self disableWeapons();
			while(self isMoving())
				wait 0.05;
		}
		if(!self isMoving())
		{
			self enableWeapons();
			while(!self isMoving())
				wait 0.05;
		}
		wait 0.1;
	}
}

bouncemode()
{
    self endon("death");
	self setPerk("specialty_fallheight");

    for(;;) {
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

drunkmovement()
{
	self endon("disconnect");
    self endon("death");

	for(;;)
	{
		self setPlayerAngles(self.angles+(0,0,0));
        wait 0.1;
        self setstance("prone");
        wait 0.1;
        self SetBlur(10.3,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,5));
        wait 0.1;
        self setstance("stand");
        wait 0.1;
        self SetBlur(9.1,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,10));
        wait 0.1;
        self setstance("prone");
        wait 0.1;
        self SetBlur(6.2,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,15));
        wait 0.1;
        self setBlur(5.2,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,20));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,25));
        wait 0.1;
        self setBlur(4.2,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,30));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,35));
        wait 0.1;
        self setBlur(3.2,1.0);
        wait 0.1;
        self setstance("crouch");
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,30));
        wait 0.1;
        self setstance("prone");
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,25));
        wait 0.1;
        self setBlur(2.2,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,20));
        wait 0.1;
        self setstance("crouch");
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,15));
        wait 0.1;
        self setBlur(1.2,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,10));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,5));
        wait 0.1;
        self setBlur(0.5,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-5));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-10));
        wait 0.1;
        self setBlur(0,1.0);
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-15));
        wait 0.1;
        self setstance("prone");
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-20));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-25));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-30));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-35));
        wait 0.1;
        self setstance("stand");
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-30));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-25));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-20));
        wait 0.1;
        self setstance("crouch");
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-15));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-10));
        wait 0.1;
        self setPlayerAngles(self.angles+(0,0,-5));
        wait 0.1;
	}
}

isMoving()
{
	if(self getVelocity() == (0,0,0))
	{
		return false;
	}
	return true;
}

isOnGround()
{
    return self getStance() == "stand" || self getStance() == "crouch" || self getStance() == "prone";
}