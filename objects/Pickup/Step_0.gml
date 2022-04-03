/// @description Insert description here
// You can write your code in this editor

//Travel through rooms when carried
if instance_exists(carrier) {
	persistent = true
}
else persistent = false

//Animation
if squishProgress < 1 {
	squishProgress += .1
}

//Arcing
if (z > 0) {
	zSpeed += zChange
	z += zSpeed
	//Landing
	if (z <= 0) {
		squishProgress = 0
		speed = 0
		z = 0
		zSpeed = 0
		friction = groundFriction
		instance_create_depth(x, y, depth + 1, DustBottom)
		sound_play(sndScrapThud)
	}
}
