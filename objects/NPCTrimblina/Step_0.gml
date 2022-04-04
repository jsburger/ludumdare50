/// @description Insert description here
// You can write your code in this editor
if talkedTo && GameCont.textProgress == -1{

	instance_destroy(self, true);
	instance_create_depth(x, y - 6, depthBase - 200, DustTop)
	instance_create_depth(x, y - 6, depthBase, ScrapPickup)
	
}
