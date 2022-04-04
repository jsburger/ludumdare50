/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

oldThrow = on_throw

on_throw = function (thrower) {
	oldThrow(thrower)
	speed = 0
}
