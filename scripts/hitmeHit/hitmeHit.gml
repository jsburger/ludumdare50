// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hitmeHit(target){
	
	if (target.team != team && target.hurtFrames <= 0 && damage > 0){
		
		target.my_health -= target.object_index == Player ? 1 : damage;
		target.hurtFrames = target.object_index == Player ? 120 : 40;
		
		target.sprite_index = target.my_health <= 0 ? target.spr_dead : target.spr_hurt;
		target.image_index = 0;

		with instance_create_depth(target.x, target.y, target.depthBase + 4, HitmeHit) {target = target; sprite_index = target.spr_hit}
		sound_play(target.my_health <= 0 ? target.snd_die : target.snd_hurt, random_range(.9, 1.1), 1);
		
		return true;
	}
	return false;
}