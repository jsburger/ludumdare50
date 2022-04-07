/// @description Insert description here
// You can write your code in this editor
if nearest {
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite(sprite_index, image_index, x + 1, y);
	draw_sprite(sprite_index, image_index, x - 1, y);
	draw_sprite(sprite_index, image_index, x, y + 1);
	draw_sprite(sprite_index, image_index, x, y - 1);
	gpu_set_fog(false, c_white, 0, 0);
}
draw_self();
