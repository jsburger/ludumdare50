// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function doWallCollision(type=COLLISIONS.LOW) {
	var tilemap = layer_tilemap_get_id("Collision");

	var check;
	//Low collisions: Walls, Rock walls, Fences
	if (type == COLLISIONS.LOW) {
		check = function (tilemap, x, y) {
			var tile = tilemap_get_at_pixel(tilemap, x, y);
			return tile == TILETYPE.WALL || tile == TILETYPE.LOW_WALL || position_meeting(x, y, ColliderObject)
		}
	}
	//High Collisions: Walls only
	else if type == COLLISIONS.HIGH {
		check = function (tilemap, x, y) {
			var tile = tilemap_get_at_pixel(tilemap, x, y);
			return tile == TILETYPE.WALL
		}
	}
	else if type == COLLISIONS.WALKING {
		check = function (tilemap, x, y) {
			var tile = tilemap_get_at_pixel(tilemap, x, y);
			return (tile > TILETYPE.NONE && tile != TILETYPE.BOARDS) || position_meeting(x, y, ColliderObject)
		}
	}
	#macro TileWidth 32

	if (hspeed < 0) {
		for (var i = bbox_top; true; i += TileWidth) {
			var yCheck = clamp(i, bbox_top + 1, bbox_bottom - 1),
				xCheck = bbox_left + hspeed;
			if (check(tilemap, xCheck, yCheck)) {
				x += ((xCheck div TileWidth) + 1) * TileWidth  - bbox_left
				hspeed = 0
				break
			}
			if i >= bbox_bottom - 1 break
		}
	}
	else if (hspeed > 0) {
		for (var i = bbox_top; true; i += TileWidth) {
			var yCheck = clamp(i, bbox_top + 1, bbox_bottom - 1),
				xCheck = bbox_right + hspeed;
			if (check(tilemap, xCheck, yCheck)) {
				x += ((xCheck div TileWidth)) * TileWidth - bbox_right
				hspeed = 0
				break
			}
			if i >= bbox_bottom - 1 break
		}
	}
	if (vspeed < 0) {
		for (var i = bbox_left + 1; true; i += TileWidth) {
			var xCheck = clamp(i, bbox_left + 1, bbox_right - 1),
				yCheck = bbox_top + vspeed;
			if (check(tilemap, xCheck, yCheck)) {
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
			if (check(tilemap, xCheck, yCheck)) {
				y += ((yCheck div TileWidth)) * TileWidth - bbox_bottom
				vspeed = 0
				break
			}
			if i >= bbox_right - 1 break
		}
	}
}

function getTileAt (x, y) {
	var tilemap = layer_tilemap_get_id("Collision");
	return tilemap_get_at_pixel(tilemap, x, y)
}

enum COLLISIONS {
	HIGH,
	LOW,
	WALKING
}

enum TILETYPE {
	NONE = 0,
	WALL = 1,
	LOW_WALL = 2,
	PIT = 3,
	BOARDS = 4
}
