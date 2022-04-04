/// @description Do shit


move_towards_point(goalX, goalY, 1)

timer += 1
if timer >= 10 {
	timer = 0
	image_angle += 80 + random(80)
	fallProgress += choose(.1, .2)
	image_xscale = 1 - fallProgress
	image_yscale = image_xscale
	image_blend = merge_color(c_white, merge_color(c_blue, c_black, fallProgress), fallProgress)
}
if fallProgress >= 1 {
	instance_destroy()
}
