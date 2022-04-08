/// @description Insert description here
// You can write your code in this editor
if sprite_index = spr_fire sprite_index = spr_idle
if sprite_index = spr_hurt{
	if my_health <= 0{
		repeat(irandom_range(3, 6)) {
			with instance_create_depth(x, y, depthBase + 10, GuroDebris) {
				z = 14;
				zspeed = 8 + irandom(6);
				motion_set(random(360), random_range(1, 3))
			}
		}
		instance_destroy(self, true);
	}
}
