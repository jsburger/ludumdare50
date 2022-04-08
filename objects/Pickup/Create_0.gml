/// @description Insert description here
// You can write your code in this editor
team   = 1;
damage = 1;
nearest  = false; // whether or not this pickup is the closest pickup/interactable within player range
right	 = 1;     // if this pickup looks to the right (1) or left (-1)
canright = true;  // if right can be used. if false right cannot be changed
reusable = true;  // if false destroys the pickup on hit
carried  = false; // if this pickup has been carried at some point

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
