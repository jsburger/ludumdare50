
if active {
	
	with instance_create_layer(x, y, "Instances", RoomTransitionFinisher) {
		lastRoom = room
	}
	room_goto(destination)
}
