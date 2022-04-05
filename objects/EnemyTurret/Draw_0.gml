/// @description Insert description here
// You can write your code in this editor

var scale = 1;
if (gunangle < 180 || gunangle >= 270) scale = -1 else scale = 1

var oldscale = image_xscale;
image_xscale *= scale
draw_self()
image_xscale = oldscale
