/// @description Insert description here
// You can write your code in this editor
event_inherited();
team = -1;

repeat(12){

	with instance_create_depth(x, y, depth, SmallSmoke){
	
		motion_add(random(360), random_range(3, 6));
	}
}

instance_create_depth(x, y, depth + 20, ScorchMark);
