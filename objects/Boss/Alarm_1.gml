/// @description Do Steam Attack
// You can write your code in this editor

steamAttackProgress++
if steamAttackProgress == 0 {
	sound_play(sndBossBeginFlamethrower)
	steamSound = audio_play_sound(sndBossFlamethrowerLoop, 1, true)
}
if steamAttackProgress <= 10 {
	for (var i = 0 - steamAttackProgress mod 2; i <= 8; i += 2) {
		with instance_create_depth(x, y + 60, depthBase + 1, WindProjectile) {
			motion_set(i * 45 + other.steamAttackOffset, 3)
		}
	}
	steamAttackOffset += 10 + random(20)
	alarm[1] = 20
}
else {
	audio_stop_sound(steamSound)
	attackCycle = 1
	steamAttackProgress = 0
	sprite_index = sprBossHoleEnd
	attackTimer = attackReset
}
