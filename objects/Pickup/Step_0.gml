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
if (z > 0 && !instance_exists(carrier)) {
	zSpeed += zChange
	z += zSpeed
	//Landing
	if (z <= 0) {
		squishProgress = 0
		speed = 0
		z = 0
		zSpeed = 0
		friction = groundFriction
		if (!place_meeting(x, y, Hole)) {
			instance_create_depth(x, y, depthBase + 1, DustBottom)
			sound_play(sndScrapThud)
		}
	}
}
