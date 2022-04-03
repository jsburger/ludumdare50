/// @description Correct Player position

var destX = 0,
	destY = 0,
	found = false;
with RoomTransition {
	if (destination == other.lastRoom) {
		destX = x
		destY = y
		found = true
		break
	}
}

if found {
	with Player {
		x = destX
		y = destY
	}
	instance_destroy()
}
