/// @description Increment scrap

global.scrapCollected += 1
instance_create_layer(x, y, "Instances", Glint)

if comedy {
	global.hasNPCComedybot = true
	setTextPrompt(["YOU FEEL BLESSED."])
}
