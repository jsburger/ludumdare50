/// @description Insert description here
// You can write your code in this editor
if active {
var _done = true;
for (var i = 0; i < array_length(watching); i++){

	if instance_exists(watching[i]) _done = false;
}

if _done = true{
	//with Player image_blend = c_yellow
	for (var i = 0; i < array_length(targets); i++){

		with targets[i] alarm[1] = 1;
	}
	for (var i = 0; i < array_length(activate); i++){

		with activate[i] alarm[0] = 10;
	}
	instance_destroy(self, true);
}
}
