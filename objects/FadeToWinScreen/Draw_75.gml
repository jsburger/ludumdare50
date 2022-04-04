/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white)
draw_set_alpha(fade)
fade += .004

draw_rectangle(0, 0,
	camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]),
	false)

draw_set_alpha(1)
draw_set_color(c_white)

if fade >= 1 {
	instance_destroy()
	with Player instance_destroy()
	room_goto(WinScreenRoom)
}
