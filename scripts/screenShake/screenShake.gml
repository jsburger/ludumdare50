// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenShake(intensity, length=0, fade=1){
	
	if instance_exists(GameCont){
		GameCont.shake = intensity;
		GameCont.shakeLength = length;
		GameCont.shakeFade = fade;
	}
}