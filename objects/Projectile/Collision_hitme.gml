/// @description Injure
// You can write your code in this editor

if other.team != team && other.hurtFrames <= 0 {
	other.my_health -= 1
	other.hurtFrames = 20
	alarm[0] = 1
}
