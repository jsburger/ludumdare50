/// @description Increment time, depth sorting
time = min(++time, maxtime);

if textProgress != -1 {
	textProgress++
}

if global.scrapCollected >= global.scrapRequired && fade = -1{
	fadingOut = false
	fade = 0
}

if time == maxtime && hasSentPrompt == false && fade = -1{
	fade = 0
	fadingOut = false
	timeUp = true
}

if fade >= 0 {
	if fadingOut == true{
		fade -= .005
		if fade <= 0 {
			fade = -1
		}
	}
	else {
		fade += .01
		if fade >= 1 {
			if timeUp {
				if hasSentPrompt = false {
					setTextPrompt(["YOU.", "YOU ARE MY FINAL SUBJECT.", "THE DAY IS UP.", "RETURN TO THE GREAT PIT AT ONCE."])
					hasSentPrompt = true
				}
			}
			else {
				timerResetting = true
			}
			fade = 1
		}
	}
	
	if fade == 1 && timeUp {
		if textProgress == -1 {
			fadingOut = true
		}
	}
	
	if timerResetting {
		time -= 10
		if time <= 0 {
			time = 0
			timerResetting = false
			fadingOut = true
			global.day++
			global.scrapCollected = 0
		}
	}
}

with all if object_index != GameCont && visible {
	var depthBaseCheck = variable_instance_get(self, "depthBase");
	if depthBaseCheck == undefined {
		depthBase = depth
	}
	var zCheck = variable_instance_get(self, "z");
	zCheck = zCheck == undefined ? 0 : zCheck
	depth = depthBase - ((bbox_top + bbox_bottom) / 2 + zCheck) div 10
}
