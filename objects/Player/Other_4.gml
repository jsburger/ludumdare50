/// @description Hide Collision layer
layer_set_visible(layer_get_id("Collision"), false)
if not audio_is_playing(sndAmbient1) audio_play_sound(sndAmbient1,0,1)
