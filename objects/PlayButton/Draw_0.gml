/// @description draw

var index = 0;
if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
	index = 1
}
if clicked {
	index = 2
}
image_index = index
draw_self()
image_index = 0
