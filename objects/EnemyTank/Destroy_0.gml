/// @description Create corpses and debris
event_inherited();

repeat (4 + irandom(2)) with instance_create_depth(x, y, depthBase + 10, GuroDebris) {
		
	image_speed = 0;
	sprite_index = sprMoaiDebris;
	motion_set(random(360), random_range(3, 6))
}

