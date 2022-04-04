/// @description Insert description here
// You can write your code in this editor
with instance_create_depth(x, y, depthBase, WindProjectile) {
			motion_set(other.gunangle, 3)
		}
repeat(12) with instance_create_depth(x, y, depthBase + 1, SmallDust) motion_add(random(360), random_range(2, 4))
