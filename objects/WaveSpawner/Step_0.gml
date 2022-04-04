/// @description Insert description here
// You can write your code in this editor
var _done = true;
for (var i = 0; i < array_length(watching) - 1; i++){

	if instance_exists(watching[i]) _done = false;
}

if _done = true{

	for (var i = 0; i < array_length(targets) - 1; i++){

		with targets[i] alarm[1] = 3;
	}
	instance_destroy(self, true);
}
