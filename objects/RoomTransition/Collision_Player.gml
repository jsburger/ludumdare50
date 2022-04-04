
if active {
	
	with instance_create_layer(x, y, "Instances", RoomTransitionFinisher) {
		lastRoom = room
	}
	active = false
	if !GameCont.timeUp {
		room_goto(destination)
	}
	else room_goto(BossRoom)
}
