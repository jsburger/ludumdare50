/// @description Marker Attack
// You can write your code in this editor

markerAttackProgress++
var n = 6;
if markerAttackProgress == 1 {
	sound_play(sndBossBeginUpAttack)
}
if markerAttackProgress <= n {
	var xpos = x + lengthdir_x(220 + random(60), markerAttackProgress * 360/n + random(20) + markerAttackOffset),
		ypos = y + lengthdir_y(160 + random(40), markerAttackProgress * 360/n + random(20) + markerAttackOffset) + 80;
	sound_play(sndBossFireScrap)
	with instance_create_depth(xpos, ypos, depthBase - 1, BossMarker) {
		if (other.markerAttackProgress mod 3 == 1) isScrap = true
		if isScrap && (true || globalGet("hasNPCPintendo")) isBowlingBall = irandom(1) == 0
	}
	alarm[2] = 5
}

else {
	markerAttackOffset += 45 + random(180)
	attackCycle = 0
	markerAttackProgress = 0
	sprite_index = sprBossMarkerAttackEnd
	attackTimer = attackReset
}

