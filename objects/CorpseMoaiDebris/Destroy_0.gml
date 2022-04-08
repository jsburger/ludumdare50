/// @description Insert description here
// You can write your code in this editor
with instance_create_depth(x, y - z, depthBase - 1, Glint){sprite_index = sprHit}
with instance_create_depth(x, y, depthBase + 10, GuroDebris) {
	sprite_index = sprMoaiDebris;
	image_speed = 0;
	image_index = irandom(image_number - 1);
	motion_set(random(360), random_range(1, 3))
}
