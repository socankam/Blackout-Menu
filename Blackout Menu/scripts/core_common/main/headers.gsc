#include scripts\core_common\struct;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\math_shared;
#include scripts\core_common\system_shared;
#include scripts\core_common\util_shared;
#include scripts\core_common\hud_util_shared;
#include scripts\core_common\hud_message_shared;
#include scripts\core_common\hud_shared;
#include scripts\core_common\array_shared;
#include scripts\core_common\flag_shared;
#include scripts\core_common\bots\bot;
#include scripts\core_common\player\player_role;
#include scripts\core_common\player\player_stats;
#include scripts\core_common\values_shared;
#include scripts\core_common\spawner_shared;
#include scripts\core_common\flagsys_shared;
#include scripts\core_common\exploder_shared;
#include scripts\core_common\vehicle_shared.gsc;
#include scripts\core_common\rank_shared.gsc;

#using scripts\core_common\ai_shared;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\player\player_stats;

#namespace blackops4menu;

autoexec __init__system__() {

	system::register("blackops4menu", &__init__, &__post__init__, undefined);
    callback::add_callback(#"on_pre_initialization", &on_pre_init, undefined);

    level.CurrentMap = CurrentMapName();

    SetupGameSettings();
    SetGametypeSettings();
}

on_pre_init() {
    return true;
}

__init__() {
    callback::on_start_gametype(&init);
    callback::on_connect(&onPlayerConnect);
    callback::on_spawned(&onPlayerSpawned);
}

__post__init__() {
}

SetupGameSettings(){
    self.GameSettings = undefined;

    // Blackout Settings
    if(Blackout()){
        self.GameSettings["Enable Storm"] = true;
        self.GameSettings["Enable Respawns"] = true;
        self.GameSettings["Number Of Lives"] = 5;
        self.GameSettings["Respawn Delay"] = 5;
        self.GameSettings["Enable Blackjack"] = true;
        self.GameSettings["Spawn Zombies"] = true;
        self.GameSettings["Max Amount Of Zombies"] = 999;
        self.GameSettings["Enable Blackjack"] = true;
        self.GameSettings["Enable Snowballs"] = false;
        self.GameSettings["Enable Water Balloons"] = false;

        self.GameSettings["Enable Perks"] = true;
        self.GameSettings["Enable Armor"] = true;
        self.GameSettings["Enable Attachments"] = true;
        self.GameSettings["Enable Health Items"] = true;

        self.GameSettings["Allow Only Headshots"] = false;
    }

    //Multiplayer Settings
    if(Multiplayer()){
        self.GameSettings["Draft Time"] = 5; // 5 Seconds
    }

    //Zombie Settings
    if(Zombies()){
        //
    }
}