/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(carrier) && speed != 0) {
	doWallCollision()
}

if (z > 0) {
	zspeed -= .9
	z += zspeed
	
	if (z <= 0) {
		speed = 0
		z = 0
		zspeed = 0
		friction = groundFriction
		instance_create_depth(x, y + 6, depth + 1, DustBottom)
	}
}
