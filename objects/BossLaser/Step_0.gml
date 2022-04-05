/// @description Insert description here
// You can write your code in this editor

if image_xscale < 1 {
	image_xscale = min(1, image_xscale + .1)
}

if instance_exists(tracking) {
	move_towards_point(tracking.x, tracking.y, 5)
}


