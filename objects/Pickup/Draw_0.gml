/// @description Insert description here
// You can write your code in this editor

y -= z
var curve = animcurve_channel_evaluate(animcurve_get_channel(CurveSquish, "curve1"), squishProgress);
image_yscale = curve + 1
draw_self()
image_yscale = 1
y += z

//image_alpha = .5
//draw_self()
//image_alpha = 1
