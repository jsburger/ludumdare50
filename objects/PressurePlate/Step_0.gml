/// @description Insert description here
// You can write your code in this editor

var pickupcheck = instance_place(x, y, Pickup);
if (place_meeting(x, y, hitme) || (instance_exists(pickupcheck) && pickupcheck.z == 0)) {
	if !(depressed) {
		depressed = true
		audio_stop_sound(sndStoneGrind); sound_play(sndStoneGrind)
		for (var i = 0; i < array_length(targets); i++) {
			with targets[i] {
				alarm[0] = 1 + i * 3;
			}
		}
		image_index = 1;
	}
}
else if !alwaysActive {
	if (depressed) {
		depressed = false
		audio_stop_sound(sndStoneGrind); sound_play(sndStoneGrind)
		for (var i = 0; i < array_length(targets); i++){
			with targets[i] {
				alarm[1] = 1 + i * 3;
			}
		}
		image_index = 0;
	}
}


