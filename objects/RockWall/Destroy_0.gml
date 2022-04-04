/// @description Spawn Rocks
// You can write your code in this editor

sound_play(sndBreakWall)
repeat(irandom_range(2, 4)) {
	with instance_create_depth(x, y, depthBase + 1, RockDebris) {
		motion_set(random(360), random_range(2, 5))
	}
}
instance_create_depth(x, y - 6, depth - 200, DustTop)
