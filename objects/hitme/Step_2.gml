/// @description Insert description here
// You can write your code in this editor

if hurtFrames > 0 {
	hurtFrames -= 1
}
if hurtFrames < 0 hurtFrames = 0

var _spr = spr_idle;
if speed > 0 _spr = spr_walk;
