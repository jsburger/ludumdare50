/// @description Insert description here
// You can write your code in this editor

if !clicked && point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
	clicked = true
	sound_play(sndThrow1, 1.5)
	alarm[0] = 40
	instance_create_depth(0, 0, 0, ScreenFadeToBlack)
}

