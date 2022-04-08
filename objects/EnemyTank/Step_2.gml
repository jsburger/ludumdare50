/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
doWallCollision(COLLISIONS.WALKING)
if sprite_index != spr_hurt{
	
	sprite_index = spr_idle;
}
if speed = 0 && sprite_index = spr_idle image_speed = 0 else image_speed = 1;
if speed > 0 && !irandom(10) instance_create_depth(x, y, depthBase+3, SmallDust);

if my_health <= 0{

	instance_destroy(self, true);
}
