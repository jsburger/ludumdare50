/// @description Insert description here
// You can write your code in this editor

if waitTime > 0 {
	alarm[0] = 1
	exit
}

if sprite_index != spr_hurt{
	
	if instance_exists(Player) {

		var _dir = point_distance(x, y, Player.x, Player.y);	
		if collision_line(x, y, x + lengthdir_x(range, _dir), y + lengthdir_y(range, _dir), ColliderObject, false, true) == noone && distance_to_object(Player) <= 32 * 9 {

				gunangle = point_direction(x, y, Player.x, Player.y);

				sprite_index = spr_fire;
				direction = random(360);
				alarm[1] = 24;
				alarm[0] = choose(120);
		
		}else{

			sprite_index = spr_idle;
			alarm[0] = 10;
		}
	}
}
else{

	alarm[0] = 10;
}
