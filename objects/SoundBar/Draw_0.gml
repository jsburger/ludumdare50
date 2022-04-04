/// @description Insert description here
// You can write your code in this editor

var yy = (bbox_top + bbox_bottom)/2;
draw_line_width_color(bbox_left - 1, yy, bbox_right + 1, yy, 32, c_white, c_white)
draw_line_width_color(bbox_left, yy, bbox_right, yy, 30, c_black, c_black)
draw_sprite(sprite_index, 0, bbox_left + global.volumeScale * (bbox_right - bbox_left), yy)
