/// @description Insert description here
// You can write your code in this editor
if nearest {
	gpu_set_fog(true, c_yellow, 0, 0);
	draw_sprite(sprite_index, image_index, x + 2, y);
	draw_sprite(sprite_index, image_index, x - 2, y);
	draw_sprite(sprite_index, image_index, x, y + 2);
	draw_sprite(sprite_index, image_index, x, y - 2);
	gpu_set_fog(false, c_white, 0, 0);
}
draw_self();
