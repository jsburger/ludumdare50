/// @description Insert description here
// You can write your code in this editor
team = 1;
damage = 1;

groundFriction = 1
airFriction = .09
friction = groundFriction
depth -= 2

//Goes over obstacles, LowThrow doesn't
collisionType = COLLISIONS.HIGH

on_throw = function (thrower) {
	carrier = -4
	z = -carryOffset
	zSpeed = 10
	friction = airFriction
}

carrier = -4
carryOffset = -18

z = 0
zSpeed = 0
zChange = -.9

squishProgress = 1
