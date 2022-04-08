/// @description Chase Player
if !instance_exists(Player) exit;
var _dir = point_direction(x, y, Player.x, Player.y),
	_dis = point_distance(x, y, Player.x, Player.y);
	if _dis < range && collision_line(x, y, x + lengthdir_x(range, _dir), y + lengthdir_y(range, _dir), ColliderObject, false, true) == noone {

	minspeed = 1;
	motion_add(_dir + random_range(30, -30), 1);

	if tracking alarm[1] = 10 + irandom(10);
}else {
	
	emoteCreate(self, sprEnemyBaffle);
	alarm[2] = 12;
}
