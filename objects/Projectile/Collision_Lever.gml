/// @description trigger lever
// You can write your code in this editor
if speed > 0 && other.cooldown <= 0 with other {
	alarm[0] = 1;
	cooldown = room_speed;
	with instance_create_depth(x, y, depthBase + 4, HitmeHit) {target = other; sprite_index = other.spr_hit}
}
instance_destroy(self, true);
