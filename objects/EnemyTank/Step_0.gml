/// @description Insert description here
// You can write your code in this editor
frame++;
speed = clamp(speed, minspeed, maxspeed);
if speed > 0 && irandom(2) > 0 && frame mod 60 == 0{
	sound_play(sndStoneGrind, random_range(.6, .8), .6);
}
