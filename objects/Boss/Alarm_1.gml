/// @description Do Steam Attack
// You can write your code in this editor

steamAttackProgress++
if steamAttackProgress <= 10 {
	for (var i = 0 - steamAttackProgress mod 2; i <= 8; i += 2) {
		with instance_create_depth(x, y + 60, depthBase + 1, WindProjectile) {
			motion_set(i * 45 + other.steamAttackOffset, 3)
		}
	}
	steamAttackOffset += 10 + random(20)
	alarm[1] = 15
}
else {
	attackCycle = 1
	steamAttackProgress = 0
	sprite_index = sprBossHoleEnd
	attackTimer = attackReset
}
