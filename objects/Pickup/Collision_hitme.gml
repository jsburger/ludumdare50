/// @description Insert description here
// You can write your code in this editor
if other.team != team && other.hurtFrames <= 0 && damage > 0 && speed > 0 && carrier == noone{
	other.my_health -= damage
	other.hurtFrames = 120
	other.image_index = 0;
	other.sprite_index = other.my_health <= 0 ? other.spr_dead : other.spr_hurt
	sound_play(other.my_health <= 0 ? other.snd_die : other.snd_hurt, random_range(.9, 1.1), 1);
}
