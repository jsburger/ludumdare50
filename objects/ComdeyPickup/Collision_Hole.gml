/// @description Fall into hole

if pickupCanCollide(self) {
	with instance_create_layer(x, y, "Instances", ScrapFall) {
		motion_set(other.direction, other.speed/3)
		sound_play(sndItemFall, random_range(.8, 1.2), 1);
		goalX = Hole.x
		goalY = Hole.y
		comedy = true
		sprite_index = other.sprite_index
	}
	instance_destroy()
	
}

