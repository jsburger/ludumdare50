/// @description Insert description here
// You can write your code in this editor

time = 0;
maxtime = room_speed * 60 * 5; // 5 mins

textArray = [];
textIndex = 0
textProgress = -1

global.scrapCollected = 0

draw_set_font(fGame);

global.hasNPCPintendo  = false;
global.hasNPCRoboBlor  = false;
global.hasNPCTrimblina = false;
global.hasNPCComedybot = false;
