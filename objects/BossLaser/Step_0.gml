/// @description Insert description here
// You can write your code in this editor

if image_xscale < 1 {
	image_xscale = min(1, image_xscale + .05)
}

if instance_exists(tracking) {
	move_towards_point(tracking.x, tracking.bbox_bottom, 5)
}
else {
	speed = 0
}


