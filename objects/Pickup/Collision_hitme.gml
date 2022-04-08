/// @description Insert description here
// You can write your code in this editor
if other.team != team && other.hurtFrames <= 0 && damage > 0 && speed > 0 && carrier == noone && abs(z - other.z) <= 24{
	other.my_health -= damage
	other.hurtFrames = 120
	other.image_index = 0;
	other.sprite_index = other.my_health <= 0 ? other.spr_dead : other.spr_hurt
	var _o = other;
	with instance_create_depth(_o.x, _o.y, _o.depthBase + 4, HitmeHit) {target = _o; sprite_index = _o.spr_hit}
	sound_play(other.my_health <= 0 ? other.snd_die : other.snd_hurt, random_range(.9, 1.1), 1);
	
	if !reusable instance_destroy(self, true);
}

