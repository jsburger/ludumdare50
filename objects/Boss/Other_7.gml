/// @description Insert description here
// You can write your code in this editor


switch(sprite_index) {
	case sprBossHoleOut:
		sprite_index = sprBossHoleHold
		image_index = 0
		alarm[0] = 40
		break
	
	case sprBossHoleEnd:
	case sprBossMarkerAttackEnd:
		sprite_index = sprBossIdle
		image_index = 0
		break

	case sprBossHurt:
		sprite_index = lastSprite
		image_index = lastIndex
		break

	case sprBossAttack1Start:
		sprite_index = sprBossAttack1Loop
		image_index = 0
		alarm[1] = 10
		break

	case sprBossMarkerAttackStart:
		alarm[2] = 10
		sprite_index = sprBossMarkerAttackLoop
		image_index = 0
		break
	
}
