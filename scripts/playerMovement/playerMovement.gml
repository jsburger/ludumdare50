// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerMovement(){

	var up = button_check(inputs.up),
		down = button_check(inputs.down),
		left = button_check(inputs.left),
		right = button_check(inputs.right);

	var playerSpeed = maxSpeed,
		playerAcceleration = friction + .45;

	var vChange = 0,
		hChange = 0;
	
	if (up && !down) {
		vChange -= playerAcceleration
	}
	else if (down && !up) {
		vChange += playerAcceleration
	}
	if (left && !right) {
		hChange -= playerAcceleration
	}
	else if (right && !left) {
		hChange += playerAcceleration
	}

	var magnitude = clamp(sqrt(vChange * vChange + hChange * hChange), 0, playerAcceleration),
		dir = point_direction(0, 0, hChange, vChange);

	motion_add(dir, magnitude)
	speed = min(playerSpeed, abs(speed)) * sign(speed)

}