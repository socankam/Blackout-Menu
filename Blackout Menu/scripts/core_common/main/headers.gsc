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

#namespace blackoutmenu;

autoexec __init__system__() {

	system::register("blackoutmenu", &__init__, &__post__init__, undefined);
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

    self.GameSettings["Enable Respawns"] = true;
    self.GameSettings["Number Of Lives"] = 5;
    self.GameSettings["Respawn Delay"] = 15;
    self.GameSettings["Enable Blackjack"] = true;
    self.GameSettings["Spawn Zombies"] = true;
    self.GameSettings["Max Amount Of Zombies"] = 999;
    self.GameSettings["Enable Blackjack"] = true;
    self.GameSettings["Enable Snowballs"] = false;
    self.GameSettings["Enable Water Balloons"] = false;

    self.GameSettings["Enable Perks"] = false;
    self.GameSettings["Enable Armor"] = false;
    self.GameSettings["Enable Attachments"] = false;
    self.GameSettings["Enable Health Items"] = false;
}