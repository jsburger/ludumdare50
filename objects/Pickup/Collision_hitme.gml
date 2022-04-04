/// @description Insert description here
// You can write your code in this editor
if damage > 0 && other.team != team && other.hurtFrames <= 0 {
	other.my_health -= 1
	other.hurtFrames = 20
}
