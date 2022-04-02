// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function doWallCollision() {
	var tilemap = layer_tilemap_get_id("Collision");

	#macro TileWidth 32

	if (hspeed < 0) {
		for (var i = bbox_top; true; i += TileWidth) {
			var yCheck = clamp(i, bbox_top, bbox_bottom),
				xCheck = bbox_left + hspeed;
			if (tilemap_get_at_pixel(tilemap, xCheck, yCheck)) {
				x += ((xCheck div TileWidth) + 1) * TileWidth  - bbox_left
				hspeed = 0
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
				x += ((xCheck div TileWidth)) * TileWidth - bbox_right
				hspeed = 0
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
				y += ((yCheck div TileWidth) + 1) * TileWidth - bbox_top
				vspeed = 0
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
				y += ((yCheck div TileWidth)) * TileWidth - bbox_bottom
				vspeed = 0
				break
			}
			if i >= bbox_right - 1 break
		}
	}
}