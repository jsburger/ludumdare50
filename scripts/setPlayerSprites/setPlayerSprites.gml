// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setPlayerSprites(){
	var is_carrying = instance_exists(carrying),
		is_walking = abs(speed) > 0,
		left = sign(dcos(throwDir)) == -1,
		is_throwing = throwing == true;
	
	if hurtFrames > 110 {
		var s = left ? sprPlayerHurtLeft : sprPlayerHurtLeft;
		if sprite_index != s {
			image_index = 0
		}
		sprite_index = s
		exit
	}
	
	if is_throwing {
		sprite_index = left ? sprPlayerThrowLeft : sprPlayerThrowRight
		image_index = 0
		exit
	}
	if is_walking {
		if is_carrying {
			sprite_index = left ? sprPlayerWalkCarryLeft : sprPlayerWalkCarryRight
		}
		else {
			sprite_index = left ? sprPlayerWalkLeft : sprPlayerWalkRight
		}
	}
	else {
		if is_carrying {
			sprite_index = left ? sprPlayerIdleCarryLeft : sprPlayerIdleCarryRight
		}
		else {
			sprite_index = left ? sprPlayerIdleLeft : sprPlayerIdleRight
		}
	}
}