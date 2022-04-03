/// @description Insert description here
// You can write your code in this editor
if active = true && !instance_exists(created){

	created = instance_create_depth(x, y, depthBase, Bomb);
	active = false;
}

if !instance_exists(created) && !active {

	if --timer < 0 {
	
		active = true;
	}
}
