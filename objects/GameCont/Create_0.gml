/// @description Insert description here
// You can write your code in this editor

time = 0;
maxtime = room_speed * 60 * 6; // 6 mins
timeUp = false
hasSentPrompt = false

fade = -1
fadingOut = false
timerResetting = false


textArray = [];
textIndex = 0
textProgress = -1
lastTextWriter = noone

global.scrapCollected = 0
global.scrapRequired = 2
global.day = 1

draw_set_font(fGame);
draw_set_halign(fa_center)
draw_set_valign(fa_top)


global.hasNPCPintendo  = false;
global.hasNPCRoboBlor  = false;
global.hasNPCTrimblina = false;
global.hasNPCComedybot = false;
