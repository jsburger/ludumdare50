/// @description Fall into hole

if pickupCanCollide(self) {
	with instance_create_layer(x, y, "Instances", ScrapFall) {
		motion_set(other.direction, other.speed/3)
		goalX = Hole.x
		goalY = Hole.y
	}
	instance_destroy()
}

