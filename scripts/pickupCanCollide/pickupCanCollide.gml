// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pickupCanCollide(pickup) {
	return pickup.z == 0 && !instance_exists(pickup.carrier)
}