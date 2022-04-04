/// @description Destroy walls and bounce off

if pickupCanCollide(self) {
	motion_set(point_direction(other.x + TileWidth/2, other.y + TileWidth/2, x, y), speed * .3)

	zSpeed += 1
}
