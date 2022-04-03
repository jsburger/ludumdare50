/// @description Insert description here
// You can write your code in this editor

//Collide with walls while airborne
if (!instance_exists(carrier) && speed != 0) {
	doWallCollision(collisionType)
}


if (instance_exists(carrier)) {
	x = carrier.x
	y = carrier.y
	z = -carryOffset
}
