/// @description Activation
if !active{
	sprite_index = sprLeverOn
	for (var i = 0; i < array_length(targets); i++) {
		with targets[i] {
			alarm[0] = 1 + i * 3;
		}
	}
}else{
	sprite_index = sprLeverOff
	for (var i = 0; i < array_length(targets); i++) {
		with targets[i] {
			alarm[1] = 1 + i * 3;
		}
	}
}
