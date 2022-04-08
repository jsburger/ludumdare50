/// @description Check for Player

if instance_exists(Player){

	var _dir = point_direction(x, y, Player.x, Player.y),
		_dis = point_distance(x, y, Player.x, Player.y);
	if _dis < range && collision_line(x, y, x + lengthdir_x(range, _dir), y + lengthdir_y(range, _dir), ColliderObject, false, true) == noone {
	
		if tracking = false{
			
			emoteCreate(self, sprEnemyNotice);
			tracking = true;
			alarm[1] = 30;
		}
		
		alarm[0] = 10;
	}else{
		tracking = false;
		alarm[0] = 10;
		minspeed = 0;
	}
}else{

	tracking = false;
	alarm[0] = 10;
	minspeed = 0;
}
