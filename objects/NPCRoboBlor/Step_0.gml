/// @description Insert description here
// You can write your code in this editor
if talkedTo && GameCont.textProgress == -1{

	instance_destroy(self, true);
	with instance_create_depth(x, y - 6, depthBase - 200, DustTop) sprite_index = sprExplosion
	instance_create_depth(x, y - 6, depthBase, ScrapPickup)
	
}
