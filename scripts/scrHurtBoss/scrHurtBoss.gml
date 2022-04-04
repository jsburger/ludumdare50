// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrHurtBoss(damage) {
	with Boss {
		hp -= damage
		lastSprite = sprite_index
		lastIndex = image_index
		sprite_index = sprBossHurt
		image_index = 0
		sound_play(sndBossHurt)
	}
}

function globalGet(name) {
	return variable_global_exists(name) && variable_global_get(name)
}
