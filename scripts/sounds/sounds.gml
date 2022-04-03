// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sound_play(sound, pitch=random_range(.9, 1.1), vol=1) {
	audio_stop_sound(sound)
	var snd = audio_play_sound(sound, 1, 0);
	audio_sound_gain(snd, vol, 0)
	audio_sound_pitch(snd, pitch)
	return snd
}