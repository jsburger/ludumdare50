/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
doWallCollision(COLLISIONS.WALKING)
if sprite_index != spr_hurt{
	
	if speed > 0 sprite_index = spr_walk else sprite_index = spr_idle;
}
if speed > 0 && !irandom(10) instance_create_depth(x, y, depthBase+3, SmallDust);
if hspeed != 0 image_xscale = hspeed > 0 ? -1 : 1;

if my_health <= 0{
	with instance_create_depth(x, y, depthBase, Corpse) sprite_index = other.spr_dead;
	instance_destroy(self, true);
}
