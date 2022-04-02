// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function button_pressed(inputName) {
	return getInput(inputName, inputTypes.pressed);
}

function button_check(inputName) {
	return getInput(inputName, inputTypes.check);
}

function button_released(inputName) {
	return getInput(inputName, inputTypes.released);
}

function getInput(inputName, inputType) {
	var keys = [];
	switch (inputName) {
		case (inputs.use):
			keys = ["E", vk_enter, vk_space]
			break
		case (inputs.up):
			keys = ["W", vk_up]
			break
		case (inputs.down):
			keys = ["S", vk_down]
			break
		case (inputs.right):
			keys = ["D", vk_right]
			break
		case (inputs.left):
			keys = ["A", vk_left]
			break
	}
	var func;
	switch(inputType) {
		case(inputTypes.pressed):
			func = keyboard_check_pressed
			break
		case(inputTypes.check):
			func = keyboard_check
			break
		case(inputTypes.released):
			func = keyboard_check_released
			break
	}
	for (var i = 0; i < array_length(keys); i++) {
		if is_string(keys[i]) {
			if func(ord(keys[i])) return true
		}
		else {
			if func(keys[i]) return true
		}
	}
	return false
}

enum inputs {
	up,
	down,
	left,
	right,
	use
}

enum inputTypes {
	pressed,
	check,
	released
}
