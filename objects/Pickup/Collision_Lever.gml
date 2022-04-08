/// @description trigger lever
if speed > 0 && other.cooldown <= 0 with other {
	alarm[0] = 1;
	cooldown = room_speed;
	with instance_create_depth(x, y, depthBase + 4, HitmeHit) {target = other}
	
	if !other.reusable instance_destroy(other, true);
}
