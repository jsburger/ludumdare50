/// @description PLAYER HUD

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
draw_sprite(sprTimeHUDBar, 0, room_width / 2, 64);
draw_sprite_part(sprTimeHUDBar, 1, 0, 0, sprite_get_width(sprTimeHUDBar) * time / maxtime, sprite_get_height(sprTimeHUDBar), room_width / 2 - sprite_get_width(sprTimeHUDBar) / 2, 64 - sprite_get_height(sprTimeHUDBar) / 2);
