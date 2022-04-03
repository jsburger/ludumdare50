/// @description Change on_throw
// Inherit the parent event
event_inherited();

zChange = -.3

on_throw = function (thrower) {
	carrier = noone
	z = -carryOffset
	y -= carryOffset
	zSpeed = 3
	friction = airFriction
}

collisionType = COLLISIONS.LOW
