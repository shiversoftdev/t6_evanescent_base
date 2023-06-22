/*
	Created by SeriousHD-
*/

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;

init()
{
	precacheshader("white");
	level.menu_initialized = 0;
	level.page_offset = [];
	level.menu_controls_menu = -3;
	level.menu_sliderOffsetAlign = -100;
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
	level.Evanescence.ClientVariables[ self GetName() ] = [];
	level.page_offset[ self GetName() ] = 0;
    self endon("disconnect");
	level endon("game_ended");
    self waittill("spawned_player");
    if( self isHost() )
    {
    	level thread InitializeMenu();
    	level thread SmartOverflowEngine();
    }
    while( !level.menu_initialized )
    	wait .25;
    self thread LoadMenu();
    self thread VerificationMonitor();
}









