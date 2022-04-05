// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setTextPrompt(arrayOfStrings){
	GameCont.textArray = arrayOfStrings
	GameCont.textIndex = 0
	GameCont.textProgress = 0
	GameCont.lastTextWriter = self
}

function advanceTextPrompt() {
	if GameCont.textProgress != -1 {
		GameCont.textIndex++
		GameCont.textProgress = 0
		if GameCont.textIndex >= array_length(GameCont.textArray) {
			GameCont.textProgress = -1
		}
	}
}
