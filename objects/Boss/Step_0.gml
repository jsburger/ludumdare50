/// @description Behavior

if attackTimer > 0 {
	attackTimer -= 1
}

if attackTimer == 0 {
	if goingToLaser {
		sprite_index = sprBossLaserStart
		image_index = 0
		//setTextPrompt(["ENOUGH."])
	}
	else {
		//Bullet Hell attack
		if attackCycle == 0 {
			//Starts steam attack
			sprite_index = sprBossAttack1Start
			image_index = 0
		}
		//Markers/Scrap attack
		if attackCycle == 1 {
			sprite_index = sprBossMarkerAttackStart
			image_index = 0
		}
	}
	attackTimer = -1
}

if hp <= 50 && !hasLasered {
	hasLasered = true
	goingToLaser = true
}

if isLasering {
	if !instance_exists(BossLaser) {
		instance_create_layer(x, y - 20, "Instances", BossLaser)
	}
	laserAttackProgress++
	if laserAttackProgress >= 180 {
		goingToLaser = false
		isLasering = false
		with BossLaser instance_destroy()
		sprite_index = sprBossLaserEnd
		image_index = 0
		attackTimer = 120
	}
}

if hp <= 0 {
	dieTimer++
	with Projectile if object_index != Explosion instance_destroy()
	if sprite_index != sprBossDieLoop {
		sprite_index = sprBossDieLoop
		image_index = 0
	}
	with ScorchMark {
		depthBase = other.depthBase + 10
	}
	if dieTimer mod 10 == 0 {
		with instance_create_depth(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), depth - 100, Explosion) {
			team = 1
		}
	}
	if dieTimer == 1 instance_create_depth(0, 0, 0, FadeToWinScreen)
}

