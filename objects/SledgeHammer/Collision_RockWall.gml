/// @description Destroy walls and bounce off

if !instance_exists(carrier) {
	motion_set(point_direction(other.x + TileWidth/2, other.y + TileWidth/2, x, y), speed * .3)

	zSpeed += 1

	with other instance_destroy()
}
