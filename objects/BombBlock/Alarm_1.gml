/// @description Fire projectile
with instance_create_depth(x, y + carryOffset, depthBase, ExplosiveProjectile) {
	
	team = other.team;
	motion_set(other.gunangle, 5);
}
repeat(6) with instance_create_depth(x, y, depthBase - 6, SmallSmoke) motion_add(other.gunangle + random_range(-20, 20), random_range(4, 8))
