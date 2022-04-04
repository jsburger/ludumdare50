/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
doWallCollision(COLLISIONS.WALKING)
if (gunangle < 180 || gunangle >= 270) image_xscale = -1 else image_xscale = 1

if my_health <= 0{
	repeat(irandom_range(3, 6)) {
		with instance_create_depth(x, y, depthBase + 10, GuroDebris) {
			motion_set(random(360), random_range(1, 3))
		}
	}
	instance_destroy(self, true);
}
