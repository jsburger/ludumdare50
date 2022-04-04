/// @description PLAYER HUD

if fade != -1 {
	draw_set_color(c_black)
	draw_set_alpha(fade)

	draw_rectangle(0, 0,
		camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]),
		false)

	draw_set_alpha(1)
	draw_set_color(c_white)
}

if textProgress != -1 {
	var texDrawY = 162,
		texDrawX = camera_get_view_width(view_camera[0])/2;
	
	var texHeight = string_height(textArray[textIndex]) * 2;
	
	draw_rectangle_color(0, texDrawY, camera_get_view_width(view_camera[0]), texDrawY + texHeight, c_black, c_black, c_black, c_black, false)
	
	draw_text_transformed(texDrawX, texDrawY, string_copy(textArray[textIndex], 0, textProgress), 2, 2, 0)
}


if (!instance_exists(Player)){exit}
var t = Player;

draw_set_color(c_black)
draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), 160, false)
draw_set_color(c_white)


// Health drawing:
var spr = sprHeartHUD,
	spr_width  = sprite_get_width(spr),
    xpos = 42,
	ypos = 42;
	
for(var i = 0; i < t.maxhealth; i++){

	var img = t.my_health > i ? ceil((t.hurtFrames + 3)/2) mod 2 : 2; // Replace 0 with hitframe eventually
	
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

var width = camera_get_view_width(view_camera[0]) - 100,
	xCenter = camera_get_view_width(view_camera[0])/2,
	yCenter = 120,
	progress = instance_exists(Boss) ? Boss.hp/Boss.maxhealth : time/maxtime
draw_line_width_color(xCenter - width/2, yCenter, xCenter + width/2, yCenter, 27, c_black, c_black)
draw_line_width_color(xCenter - width/2, yCenter, xCenter - width/2 + width * progress, yCenter, 25, c_red, c_red)
//Left side
draw_sprite_ext(sprTimeBarEnd, 0, xCenter - width/2, yCenter, -1, 1, 0, c_white, 1)
//Right side
draw_sprite_ext(sprTimeBarEnd, 0, xCenter + width/2, yCenter, 1, 1, 0, c_black, 1)
draw_sprite(sprTimeBarSun, (floor(time/10)) mod 2, xCenter - width/2 + width * progress, yCenter)

draw_sprite_ext(sprTrash1, 0, xpos + width/2 + 20, ypos, 1, 1, 0, c_white, 1)
draw_text_transformed(xpos + width/2 + 54, ypos - 10, string(global.scrapCollected) + "/" + string(global.scrapRequired), 2, 2, 0)
