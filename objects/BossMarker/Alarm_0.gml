/// @description Spawn Scrap or explosion
// You can write your code in this editor

if isScrap {
	with instance_create_layer(x, y, "Instances", isBowlingBall ? BowlingBall : ScrapPickup) {
		sprite_index = sprBossScrap
		z = camera_get_view_height(view_camera[0])
	}
}
else {
	with instance_create_layer(x, y, "Instances", Explosion) {
		sound_play(sndBossExplosion1)
	}
}


instance_destroy()
