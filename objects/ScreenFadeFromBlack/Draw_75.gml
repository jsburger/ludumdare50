/// @description Black screen that fades

draw_set_color(c_black)
draw_set_alpha(fade)
fade -= .05

draw_rectangle(0, 0,
	camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]),
	false)

draw_set_alpha(1)
draw_set_color(c_black)

if fade <= 0 instance_destroy()
