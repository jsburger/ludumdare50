/// @description PLAYER HUD

draw_set_color(c_black)
draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), 160, false)
draw_set_color(c_white)

if (!instance_exists(Player)){exit}
var t = Player;

// Health drawing:
var spr = sprHeartHUD,
	spr_width  = sprite_get_width(spr),
    xpos = 42,
	ypos = 42;
	
for(var i = 0; i < t.maxhealth; i++){

	var img = t.my_health > i ? 0 : 2; // Replace 0 with hitframe eventually
	
	var scale = 1;
	if (t.my_health == i + 1) scale = 1 + sin((time / room_speed / (t.my_health == 1 ? 1 : 6)) mod 360) * (t.my_health == 1 ? .15 : .05);
	
	draw_sprite_ext(spr, img, xpos - 2, ypos,     scale, scale, 0, c_black, 1);
	draw_sprite_ext(spr, img, xpos - 3, ypos - 2, scale, scale, 0, c_black, 1);
	draw_sprite_ext(spr, img, xpos - 3, ypos + 2, scale, scale, 0, c_black, 1);
	draw_sprite_ext(spr, img, xpos, ypos,		  scale, scale, 0, c_white, 1);
	
	xpos += spr_width * .6;
}

// Time drawing:
//draw_sprite(sprTimeHUDBar, 0, room_width / 2, 64);
//draw_sprite_part(sprTimeHUDBar, 1, 0, 0, sprite_get_width(sprTimeHUDBar) * time / maxtime, sprite_get_height(sprTimeHUDBar), room_width / 2 - sprite_get_width(sprTimeHUDBar) / 2, 64 - sprite_get_height(sprTimeHUDBar) / 2);

var width = room_width - 100,
	xCenter = room_width/2,
	yCenter = 180;
draw_line_width_color(xCenter - width/2, yCenter, xCenter + width/2, yCenter, 27, c_black, c_black)
draw_line_width_color(xCenter - width/2, yCenter, xCenter - width/2 + width * time/maxtime, yCenter, 25, c_red, c_red)
//Left side
draw_sprite_ext(sprTimeBarEnd, 0, xCenter - width/2, yCenter, -1, 1, 0, c_white, 1)
//Right side
draw_sprite_ext(sprTimeBarEnd, 0, xCenter + width/2, yCenter, 1, 1, 0, c_black, 1)
draw_sprite(sprTimeBarSun, -1, xCenter - width/2 + width * time/maxtime, yCenter)
