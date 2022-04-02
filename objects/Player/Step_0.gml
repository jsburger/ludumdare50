/// @description Insert description here
// You can write your code in this editor

playerMovement()

// Player animations:
if (speed > 0){
	sprite_index = sprPlayerWalk;
}
else{
	sprite_index = sprPlayerIdle;
}
// Check if moving left:
if (hspeed != 0) image_xscale = -sign(hspeed);
