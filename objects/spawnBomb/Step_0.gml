/// @description Insert description here
// You can write your code in this editor
if active = true && !instance_exists(created){

	created = instance_create_depth(x, y, depthBase, Bomb);
	instance_create_depth(x, y, depthBase + 1, DustBottom);
	active = false;
}

if !instance_exists(created) && !active {

	if --timer < 0 {
	
		active = true;
	}
}
