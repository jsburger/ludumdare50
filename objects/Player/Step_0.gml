/// @description Insert description here
// You can write your code in this editor

if !(throwing) {
	playerMovement()
}

if (speed > 0) {
	// Save last direction to throw with
	throwDir = direction
	
	if !audio_is_playing(walkSound) {
		walkSound = audio_play_sound(sndPlayerMove, 2, true)
	}
	audio_sound_pitch(walkSound, .5 + (speed/maxSpeed)/2)
	
	if dustTime >= 30 {
		repeat(random_range(3, 6)) {
			with instance_create_depth(x, bbox_bottom, depth + 1, SmallDust) {
				depthBase = other.depthBase + 1
				motion_set(other.direction + 180, random_range(1, 2.6))
			}
		}
	}
	if dustTime > 0 {
		dustTime -= 1
	}
	
	var dustChance = dustTime > 0 ? 20 : 10;
	if random(100) <= dustChance {
		with instance_create_depth(x, bbox_bottom, depth + 1, SmallDust) {
			depthBase = other.depthBase + 1
			motion_set(other.direction + 180, random_range(.6, 2))
		}
	}
}
else {
	dustTime = 30
	audio_stop_sound(walkSound)
}


//Pick up objects
if !(instance_exists(carrying)) {
	if instance_exists(Pickup) {
		var n = instance_nearest(x, y, Pickup);
		if distance_to_object(n) <= 4 {
			if button_pressed(inputs.use) {
				sound_play(choose(sndPickup1, sndPickup2))
				carrying = n
				n.carrier = self
				n.z = 0
				n.zspeed = 0
			}
		}
	}	
}


//Throw Objects
else {
	if button_pressed(inputs.use) {
		with carrying {
			motion_set(other.throwDir, 8)
			on_throw(other)
		}
		carrying = noone
		throwing = true
		setPlayerSprites()
		sound_play(choose(sndThrow1, sndThrow2, sndThrow3))
	}
}
//Set Sprites
if !(throwing) {
	setPlayerSprites()
}
