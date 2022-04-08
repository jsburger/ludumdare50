/// @description periodic firing
event_inherited();

if carrier != noone && frame++ mod cooldown = 0 {

	image_index = 0;
	sprite_index = spr_fire;
	alarm[1] = 3;
}

