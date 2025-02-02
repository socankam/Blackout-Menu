VehicleMenu()
{
    init_vehicles();

    self createMenu("VehicleMenu", "Vehicle Menu");
    if(Blackout()){
        if(level.CurrentMap == "wz_open_skyscrapers"){
            self addOption("VehicleMenu", "Muscle Cars", &OpenSubMenu, "SpawnMuscleCars");
            self addOption("VehicleMenu", "Motorcycles", &OpenSubMenu, "SpawnMotorcycles");
            self addOption("VehicleMenu", "Helicopters", &OpenSubMenu, "SpawnHelicopters");
            self addOption("VehicleMenu", "Tanks", &OpenSubMenu, "SpawnTanks");
            self addOption("VehicleMenu", "ATVs", &OpenSubMenu, "SpawnATVs");
            self addOption("VehicleMenu", "Cargo Trucks", &OpenSubMenu, "SpawnCargoTrucks");
            self addOption("VehicleMenu", "SUVs", &OpenSubMenu, "SpawnSUVs");
        }
        self addOption("VehicleMenu", "Boats", &OpenSubMenu, "SpawnBoats");

        self createMenu("SpawnMuscleCars", "Muscle Cars");
        self addOption("SpawnMuscleCars", "Spawn Heist Muscle Car", &SpawnVehicleModel, "HMC");
        self addOption("SpawnMuscleCars", "Spawn Blue Muscle Car", &SpawnVehicleModel, "BMC");
        self addOption("SpawnMuscleCars", "Spawn Green Muscle Car", &SpawnVehicleModel, "GMC");
        self addOption("SpawnMuscleCars", "Spawn Orange Muscle Car", &SpawnVehicleModel, "OMC");
        self addOption("SpawnMuscleCars", "Spawn Red Muscle Car", &SpawnVehicleModel, "RMC");
        self addOption("SpawnMuscleCars", "Spawn White Muscle Car", &SpawnVehicleModel, "WMC");
        self addOption("SpawnMuscleCars", "Spawn Yellow Muscle Car", &SpawnVehicleModel, "RMC");
        self addOption("SpawnMuscleCars", "Spawn Black Muscle Car", &SpawnVehicleModel, "BMC2");

        self createMenu("SpawnMotorcycles", "Motorcycles");
        self addOption("SpawnMotorcycles", "Spawn White Motorcycle", &SpawnVehicleModel, "WM1");
        self addOption("SpawnMotorcycles", "Spawn Grey Motorcycle", &SpawnVehicleModel, "GM1");
        self addOption("SpawnMotorcycles", "Spawn Green Motorcycle", &SpawnVehicleModel, "GM2");
        self addOption("SpawnMotorcycles", "Spawn Dark Motorcycle", &SpawnVehicleModel, "DM1");
        self addOption("SpawnMotorcycles", "Spawn Light Grey Motorcycle", &SpawnVehicleModel, "LG1");

        self createMenu("SpawnHelicopters", "Helicopters");
        self addOption("SpawnHelicopters", "Spawn Helicopter 1", &SpawnVehicleModel, "H1");
        self addOption("SpawnHelicopters", "Spawn Helicopter 2", &SpawnVehicleModel, "H2");
        self addOption("SpawnHelicopters", "Spawn Helicopter 3", &SpawnVehicleModel, "H3");
        self addOption("SpawnHelicopters", "Spawn Helicopter 4", &SpawnVehicleModel, "H4");

        self createMenu("SpawnTanks", "Tanks");
        self addOption("SpawnTanks", "Spawn Dark Grey Tank", &SpawnVehicleModel, "TankDarkGrey");
        self addOption("SpawnTanks", "Spawn Green Tank", &SpawnVehicleModel, "TankGreen");
        self addOption("SpawnTanks", "Spawn Light Grey Tank", &SpawnVehicleModel, "TankLightGrey");
        self addOption("SpawnTanks", "Spawn White Tank", &SpawnVehicleModel, "TankWhite");

        self createMenu("SpawnATVs", "ATVs");
        self addOption("SpawnATVs", "Spawn ATV 1", &SpawnVehicleModel, "ATV1");
        self addOption("SpawnATVs", "Spawn ATV 2", &SpawnVehicleModel, "ATV2");
        self addOption("SpawnATVs", "Spawn Green ATV", &SpawnVehicleModel, "ATVGreen");
        self addOption("SpawnATVs", "Spawn Police ATV", &SpawnVehicleModel, "ATVPolice");

        self createMenu("SpawnCargoTrucks", "Cargo Trucks");
        self addOption("SpawnCargoTrucks", "Spawn Dark Cargo Truck", &SpawnVehicleModel, "CargoDark");
        self addOption("SpawnCargoTrucks", "Spawn Green Cargo Truck", &SpawnVehicleModel, "CargoGreen");
        self addOption("SpawnCargoTrucks", "Spawn Grey Cargo Truck", &SpawnVehicleModel, "CargoGrey");

        self createMenu("SpawnSUVs", "SUVs");
        self addOption("SpawnSUVs", "Spawn Police SUV", &SpawnVehicleModel, "SUVPolice");
        self addOption("SpawnSUVs", "Spawn Black SUV", &SpawnVehicleModel, "SUVBlack");
        self addOption("SpawnSUVs", "Spawn Grey SUV", &SpawnVehicleModel, "SUVGrey");
        self addOption("SpawnSUVs", "Spawn Silver SUV", &SpawnVehicleModel, "SUVSilver");
        self addOption("SpawnSUVs", "Spawn White SUV", &SpawnVehicleModel, "SUVWhite");
        self addOption("SpawnSUVs", "Spawn Black Light SUV", &SpawnVehicleModel, "SUVBlackLight");

        self createMenu("SpawnBoats", "Boats");
        self addOption("SpawnBoats", "Black Raft", &SpawnVehicleModel, "BlackRaft");
        self addOption("SpawnBoats", "Grey Raft", &SpawnVehicleModel, "GreyRaft");
        
        if(level.CurrentMap == "wz_open_skyscrapers"){
            self addOption("SpawnBoats", "Tan Military Boat", &SpawnVehicleModel, "TanBoat");
            self addOption("SpawnBoats", "Tan Military Boat", &SpawnVehicleModel, "BlackBoat");
            self addOption("SpawnBoats", "Police Military Boat", &SpawnVehicleModel, "PoliceBoat");
        }
    }
}

init_vehicles()
{
    self.VehicleHashMap = undefined;

    //Muscle Cars
    self.VehicleHashMap["HMC"] = #"hash_4e73f59c7e21ce5a";
    self.VehicleHashMap["BMC"] = #"hash_2f8f4f949bf9ac15";
    self.VehicleHashMap["GMC"] = #"hash_15ddcb948d817b45";
    self.VehicleHashMap["OMC"] = #"hash_516b7a9466fa5c12";
    self.VehicleHashMap["RMC"] = #"hash_25efdc944e4cca5b";
    self.VehicleHashMap["WMC"] = #"hash_cd755944056a13d";
    self.VehicleHashMap["YMC"] = #"hash_56e75c94213b20da";
    self.VehicleHashMap["BMC2"] = #"hash_2f8f41949bf9944b";

     //Motorcycles
    self.VehicleHashMap["WM1"] = #"hash_6125436f40323d0c";
    self.VehicleHashMap["GM1"] = #"hash_27cb5ec4239072e2";
    self.VehicleHashMap["GM2"] = #"hash_1420be7cd22fba24";
    self.VehicleHashMap["DM1"] = #"hash_7450e3a35eaf7c7d";
    self.VehicleHashMap["LG1"] = #"hash_187ccca8e5fca987";
    self.VehicleHashMap["DM2"] = #"hash_7709d71ab3699f7e";

     //Helicopters
    self.VehicleHashMap["H1"] = #"hash_371dca31a8d2a390";
    self.VehicleHashMap["H2"] = #"hash_1f38eb47b13ae0a2";
    self.VehicleHashMap["H3"] = #"hash_7473bb4a4fe9a17f";
    self.VehicleHashMap["H4"] = #"hash_a32b2557c188dbe";

    // Tanks
    self.VehicleHashMap["TankDarkGrey"] = #"hash_660785b539889002";
    self.VehicleHashMap["TankGreen"] = #"hash_54bf3cd56e8c5c4a";
    self.VehicleHashMap["TankLightGrey"] = #"hash_6fdb3b0114439974";
    self.VehicleHashMap["TankWhite"] = #"hash_327d1f9834b6b91e";

    //ATVs
    self.VehicleHashMap["ATV1"] = #"hash_232aa3a4e81249c6";
    self.VehicleHashMap["ATV2"] = #"hash_1d6e04a52d9a5fe2";
    self.VehicleHashMap["ATVGreen"] = #"hash_7acdf9a4d20bca08";
    self.VehicleHashMap["ATVPolice"] = #"hash_2c40642bbbab460d";

    // Cargo Trucks
    self.VehicleHashMap["CargoDark"] = #"hash_50df12a3f608295f";
    self.VehicleHashMap["CargoGreen"] = #"hash_2321fdb723c1833e";
    self.VehicleHashMap["CargoGrey"] = #"hash_1207be62f5586002";

    // SUVs
    self.VehicleHashMap["SUVPolice"] = #"hash_54469210eb79f8fa";
    self.VehicleHashMap["SUVBlack"] = #"hash_fd30bfe9c72da01";
    self.VehicleHashMap["SUVGrey"] = #"hash_762e82fe8e052b0e";
    self.VehicleHashMap["SUVSilver"] = #"hash_6a5a5607b259798f";
    self.VehicleHashMap["SUVWhite"] = #"hash_6d35ebfe40e6564f";
    self.VehicleHashMap["SUVBlackLight"] = #"hash_2e86e4a61f2237f6";

    //Boats
    self.VehicleHashMap["BlackRaft"] =  #"vehicle_boct_mil_boat_tactical_raft_wz_blk";
    self.VehicleHashMap["GreyRaft"] =  #"vehicle_boct_mil_boat_tactical_raft_wz_blk";
    self.VehicleHashMap["GreenRaft"] =  #"vehicle_boct_mil_boat_tactical_raft_wz_gry";
    self.VehicleHashMap["GreenRaft"] =  #"vehicle_boct_mil_boat_tactical_raft_wz_gry";
    self.VehicleHashMap["TanBoat"] =  #"vehicle_boct_mil_boat_pbr_wz_tan";
    self.VehicleHashMap["PoliceBoat"] =  #"vehicle_boct_mil_boat_pbr_wz_police";
    self.VehicleHashMap["BlackBoat"] =  #"vehicle_boct_mil_boat_pbr_wz_black";
}

SpawnVehicleModel(VehicleItem) 
{
    AssetLoaded = isassetloaded("vehicle", VehicleItem);

    Look = self GetLookPosition();
    
    Vehicle = spawnvehicle(self.VehicleHashMap[VehicleItem], Look, (0, 0, 0));
    Vehicle makeusable();

    if (isairborne(Vehicle)) {
        Vehicle setrotorspeed(1.0);
    }
}

GetLookPosition()
{
    return self GetLookTrace()["position"];
}

GetLookTrace()
{
    eyePos = self geteye();
    aimDir = AnglesToForward(self GetPlayerAngles());

    maxDistance = 10000;

    return bullettrace(eyePos, eyePos + vectorscale(aimDir, maxDistance), true, self);
}