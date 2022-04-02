/// @description Insert description here
// You can write your code in this editor

groundFriction = 1
airFriction = .09
friction = groundFriction

on_throw = function (thrower) {
	carrier = noone
	z = -carryOffset
	y -= carryOffset
	zspeed = 10
	friction = airFriction
}

carrier = noone
carryOffset = -24

z = 0
zspeed = 0
