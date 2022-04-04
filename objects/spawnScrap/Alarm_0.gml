/// @description Insert description here
// You can write your code in this editor
instance_create_depth(x, y, depthBase, ScrapPickup);
instance_create_depth(x, y, depthBase + 1, DustBottom);
instance_destroy(self, false);
