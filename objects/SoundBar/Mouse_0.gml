/// @description Insert description here
// You can write your code in this editor

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
	var dif = clamp((mouse_x - bbox_left)/(bbox_right - bbox_left), 0, 1)
	global.volumeScale = dif
}

