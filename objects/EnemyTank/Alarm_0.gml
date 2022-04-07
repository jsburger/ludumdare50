/// @description Insert description here
// You can write your code in this editor

if instance_exists(Player){

	var _dir = point_direction(x, y, Player.x, Player.y),
		_dis = point_distance(x, y, Player.x, Player.y);
	if _dis < range && collision_line(x, y, x + lengthdir_x(range, _dir), y + lengthdir_y(range, _dir), ColliderObject, false, true) == noone {
	
		minspeed = 1;
		motion_add(_dir + random_range(30, -30), 1);
		alarm[0] = 10 + irandom(10);
	}else{

		alarm[0] = 10;
		minspeed = 0;
	}
}else{

	alarm[0] = 10;
	minspeed = 0;
}
