/// @description anim end


if sprite_index == sprLogoStart {
	alarm[0] = 120
	sprite_index = sprLogoLoop
	image_index = 0
}

if sprite_index == sprLogoStop {
	image_speed = 0
	instance_create_depth(0, 0, 0, ScreenFadeFromBlack)
	room_goto(MenuRoom2)
}
