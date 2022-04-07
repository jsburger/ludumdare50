/// @description Insert description here
// You can write your code in this editor

y -= z
var curve = animcurve_channel_evaluate(animcurve_get_channel(CurveSquish, "curve1"), squishProgress);
image_yscale = curve + 1
if nearest {
	gpu_set_fog(true, c_yellow, 0, 0);
	draw_sprite(sprite_index, image_index, x + 2, y);
	draw_sprite(sprite_index, image_index, x - 2, y);
	draw_sprite(sprite_index, image_index, x, y + 2);
	draw_sprite(sprite_index, image_index, x, y - 2);
	gpu_set_fog(false, c_white, 0, 0);
}
draw_self()
image_yscale = 1
y += z

//image_alpha = .5
//draw_self()
//image_alpha = 1
