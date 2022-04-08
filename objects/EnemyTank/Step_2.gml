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
	with instance_create_depth(x, y, depthBase, Corpse){
		damage = 2;
		sprite_index = other.spr_dead;
		
		zChange = -.3

		on_throw = function (thrower) {
			carrier = noone
			z = -carryOffset
			y -= carryOffset
			zSpeed = 3
			friction = airFriction
		}
		collisionType = COLLISIONS.LOW
	}
	repeat (4 + irandom(2)) with instance_create_depth(x, y, depthBase + 10, GuroDebris) {
		
		image_speed = 0;
		sprite_index = sprMoaiDebris;
		motion_set(random(360), random_range(3, 6))
	}
	repeat (4 + irandom(2)) with instance_create_depth(x, y, depthBase, CorpseMoaiDebris) {
		
		zspeed = 12 + irandom(8);
		z = 40;

		motion_set(random(360), random_range(7, 9))
	}
	instance_destroy(self, true);
}
