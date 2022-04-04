
draw_set_color(c_black)
draw_set_alpha(fade)
fade += .01

draw_rectangle(0, 0,
	camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]),
	false)

draw_set_alpha(1)
draw_set_color(c_black)

if fade >= 1 {
	with Player instance_destroy()
	instance_destroy()
	room_goto(RoomGameOver)
}
