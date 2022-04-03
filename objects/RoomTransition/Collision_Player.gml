
if active {
	
	with instance_create_layer(x, y, "Instances", RoomTransitionFinisher) {
		lastRoom = room
	}
	active = false
	room_goto(destination)
}
