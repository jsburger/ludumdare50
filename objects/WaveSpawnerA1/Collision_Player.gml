/// @description Insert description here
// You can write your code in this editor
if !active{
	
	active = true;
	for (var i = 0; i < array_length(targets); i++){

		with targets[i]{
			
			alarm[0] = 2;
		}
	}

	for (var i = 0; i < array_length(wave1); i++){

		var _s = instance_create_depth(wave1[i].x, wave1[i].y, depthBase, wave1[i].enemy);
		array_push(watching, _s);
		instance_destroy(wave1[i]);
	}
}
