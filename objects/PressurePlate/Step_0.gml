/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, hitme) || place_meeting(x, y, Pickup)){

	for (var i = 0; i < array_length(targets); i++){

		with targets[i]{
		
			if !active{
			
				active = true;
				sprite_index = sprToggleWallLower;
				alarm[0] = 20;
			}
		}
	}
	
	image_index = 1;
}else {

	for (var i = 0; i < array_length(targets); i++){

		with targets[i]{
		
			if active{
			
				active = false;
				sprite_index = sprToggleWallRaise;
				alarm[9] = 20;
			}
		}
	}
	image_index = 0;
}


