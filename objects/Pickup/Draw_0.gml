/// @description Insert description here
// You can write your code in this editor

y -= z
var curve = animcurve_channel_evaluate(animcurve_get_channel(CurveSquish, "curve1"), squishProgress);
image_yscale = curve + 1
var _xscale = image_xscale
if instance_exists(carrier) && canright && carrier.hspeed != 0 right = carrier.hspeed > 0 ? -1 : 1;
image_xscale = right;
if nearest {
	gpu_set_fog(true, c_yellow, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x + 2, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x - 2, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y + 2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y - 2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	gpu_set_fog(false, c_white, 0, 0);
}
draw_self()
image_yscale = 1
image_xscale = _xscale;
y += z

//image_alpha = .5
//draw_self()
//image_alpha = 1
