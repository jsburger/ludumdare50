/// @description Insert description here
// You can write your code in this editor

playerMovement()

// Player animations:
if (speed > 0){
	sprite_index = sprPlayerWalk;
}
else{
	sprite_index = sprPlayerIdle;
}
// Check if moving left:
if (hspeed != 0) image_xscale = -sign(hspeed);

image_blend = c_white
var tilemap = layer_tilemap_get_id("Collision");

#macro TileWidth 32

if (hspeed < 0) {
	for (var i = bbox_top; true; i += TileWidth) {
		var yCheck = clamp(i, bbox_top, bbox_bottom),
			xCheck = bbox_left + hspeed;
		if (tilemap_get_at_pixel(tilemap, xCheck, yCheck)) {
			image_blend = c_green
			hspeed = ((xCheck div TileWidth) + 1) * TileWidth  - bbox_left
			break
		}
		if i <= bbox_bottom break
	}
}
else if (hspeed > 0) {
	for (var i = bbox_top; true; i += TileWidth) {
		var yCheck = clamp(i, bbox_top, bbox_bottom),
			xCheck = bbox_right + hspeed;
		if (tilemap_get_at_pixel(tilemap, xCheck, yCheck)) {
			image_blend = c_green
			hspeed = ((xCheck div TileWidth)) * TileWidth - bbox_right
			break
		}
		if i <= bbox_bottom break
	}
}
if (vspeed < 0) {
	for (var i = bbox_left + 1; true; i += TileWidth) {
		var xCheck = clamp(i, bbox_left + 1, bbox_right - 1),
			yCheck = bbox_top + vspeed;
		if (tilemap_get_at_pixel(tilemap, xCheck, yCheck)) {
			image_blend = c_green
			vspeed = ((yCheck div TileWidth) + 1) * TileWidth - bbox_top
			break
		}
		if i >= bbox_right - 1 break
	}
}
else if (vspeed > 0) {
	for (var i = bbox_left + 1; true; i += TileWidth) {
		var xCheck = clamp(i, bbox_left + 1, bbox_right - 1),
			yCheck = bbox_bottom + vspeed;
		if (tilemap_get_at_pixel(tilemap, xCheck, yCheck)) {
			image_blend = c_green
			vspeed = ((yCheck div TileWidth)) * TileWidth - bbox_bottom
			break
		}
		if i >= bbox_right - 1 break
	}
}
