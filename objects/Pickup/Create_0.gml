/// @description Insert description here
// You can write your code in this editor
team = 1;
damage = 1;
nearest = false;
right = 1;
reusable = true;

groundFriction = 1
airFriction = .09
friction = groundFriction
depth -= 2

//Goes over obstacles, LowThrow doesn't
collisionType = COLLISIONS.HIGH

on_throw = function (thrower) {
	carrier = noone
	z = -carryOffset
	zSpeed = 10
	friction = airFriction
}

carrier = noone
carryOffset = -18

z = 0
zSpeed = 0
zChange = -.9

squishProgress = 1
