/// @description Insert description here
// You can write your code in this editor

playerMovement()

// Player animations:
if (speed > 0){
	sprite_index = sprPlayerWalk;
	throwDir = direction
}
else{
	sprite_index = sprPlayerIdle;
}
// Check if moving left:
if (hspeed != 0) image_xscale = -sign(hspeed);

doWallCollision()

if !(instance_exists(carrying)) {
	if instance_exists(Pickup) {
		var n = instance_nearest(x, y, Pickup);
		if distance_to_object(n) <= 4 {
			if button_pressed(inputs.use) {
				carrying = n
				n.carrier = self
				n.z = 0
				n.zspeed = 0
			}
		}
	}	
}
else {
	if button_pressed(inputs.use) {
		with carrying {
			motion_set(other.throwDir, 8)
			on_throw(other)
		}
		carrying = noone
	}
}
