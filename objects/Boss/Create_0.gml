/// @description Insert description here
// You can write your code in this editor

sprite_index = sprBossHoleOut

hp = 100
maxhealth = health

steamSound = -1

lastSprite = sprBossIdle
image_index = 0

attackTimer = -1
attackReset = 120
attackCycle = 0

steamAttackProgress = 0
steamAttackOffset = 0
markerAttackProgress = 0
markerAttackOffset = 0

hasLasered = false
goingToLaser = false
isLasering = false
laserAttackProgress = 0
laserSound = -1

sound_play(sndMusicBoss, 1, .7)

dieTimer = 0
