/// @description Injure
// You can write your code in this editor

if other.team != team && other.hurtFrames <= 0 {
	other.my_health -= 1
	other.hurtFrames = 120
	other.sprite_index = other.spr_hurt
	sound_play(other.snd_hurt, random_range(.9, 1.1), 1);
	alarm[0] = 1
}
