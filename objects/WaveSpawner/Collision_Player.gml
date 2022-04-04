/// @description Insert description here
// You can write your code in this editor
active = true;
for (var i = 0; i < array_length(targets) - 1; i++){

	with targets[i] alarm[0] = 3;
}

for (var i = 0; i < array_length(wave1) - 1; i++){

	var _s = instance_create_depth(wave1[i].x, wave1[i].y, baseDepth, wave1[i].enemy);
	array_push(watching, _s);
	instance_destroy(wave1[i]);
}

