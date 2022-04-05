/// @description Increment scrap

global.scrapCollected += 1
instance_create_layer(x, y, "Instances", Glint).depth -= 10

if comedy {
	global.hasNPCComedybot = true
	setTextPrompt(["YOU FEEL BLESSED."])
	sound_play(sndMusicComedybot)
}
