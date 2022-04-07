/// @description Check for player

if waitTime > 0 {
	alarm[0] = 1
	exit
}

if sprite_index != spr_hurt{
	
	if instance_exists(Player) {

		var _dir = point_distance(x, y, Player.x, Player.y);	
		if collision_line(x, y, x + lengthdir_x(range, _dir), y + lengthdir_y(range, _dir), ColliderObject, false, true) == noone && distance_to_object(Player) <= 32 * 9 {

				// Get ready to fire:
				gunangle = point_direction(x, y, Player.x, Player.y);
				instance_create_depth(x + image_xscale * 24, y - 24, depthBase - 1, EnemyNotice);
				alarm[2] = 14;
		}else{

			sprite_index = spr_idle;
			alarm[0] = 10;
		}
	}
}
else{

	alarm[0] = 10;
}
