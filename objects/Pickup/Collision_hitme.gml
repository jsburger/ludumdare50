/// @description Insert description here
// You can write your code in this editor
if false {
	other.my_health -= 1
	other.hurtFrames = 20
	other.sprite_index = other.spr_hurt
	if other.my_health > 0 sound_play(other.snd_hurt) else sound_play(other.snd_die)
}
