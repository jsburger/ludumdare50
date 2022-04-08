/// @description Insert description here
// You can write your code in this editor
if other.team != team && other.hurtFrames <= 0 {
	other.my_health -= damage
	other.hurtFrames = 120
	var _o = other;
	with instance_create_depth(_o.x, _o.y, _o.depthBase + 4, HitmeHit) {target = _o; sprite_index = _o.spr_hit}
	sound_play(other.snd_hurt, random_range(.9, 1.1), 1);
}
