/// @description Insert description here
// You can write your code in this editor
if object_index != Board && damage > 0 && other.team != team && other.hurtFrames <= 0 {
	other.my_health -= 1
	other.hurtFrames = 20
	if other.my_health > 0 sound_play(other.snd_hurt) else sound_play(other.snd_die)
}
