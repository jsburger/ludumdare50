// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function canPlaceBoard(tileset, x, y) {
	var xoff, yoff, foundStraight = false;
	for (var i = 0; i <= 3; i++) {
		xoff = lengthdir_x(TileWidth, 90 * i)
		yoff = lengthdir_y(TileWidth, 90 * i)

		var tile = tilemap_get_at_pixel(tileset, x + xoff, y + yoff);
		if tile == TILETYPE.BOARDS {
			//Check perpendicular tiles for boards
			if (tilemap_get_at_pixel(tileset, x - yoff + xoff, y - xoff + yoff) != TILETYPE.BOARDS && tilemap_get_at_pixel(tileset, x + yoff + xoff, y + xoff + yoff)) {
				foundStraight = true
				break
			}
		}
	}
	if foundStraight {
		var c = 1;
		while c <= 10 {
			var testTile = tilemap_get_at_pixel(tileset, x + xoff * c, y + yoff * c);
			if !(testTile == TILETYPE.BOARDS || testTile == TILETYPE.NONE) return false
			if isBoardSupported(tileset, x + xoff * c, y + yoff * c) {
				return true
			}
			c++
		}
	}
	return isBoardSupported(tileset, x, y)
}

function isBoardSupported(tileset, x, y) {
	for (var i = 0; i <= 3; i++) {
		var tile = tilemap_get_at_pixel(tileset, x + lengthdir_x(TileWidth, 90 * i), y + lengthdir_y(TileWidth, 90 * i));
		if tile == TILETYPE.NONE {
			return true
		}
	}
	return false

}
