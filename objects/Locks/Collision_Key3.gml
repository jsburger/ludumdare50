/// @description Insert description here
// You can write your code in this editor
unlocked[2] = true
instance_create_depth(other.x, other.x, other.depthBase + 20, DustTop);
with other instance_destroy(self, true);
with targets[2] alarm[0] = 25;

if unlocked[0] = true && unlocked[1] = true && unlocked[2] = true{
	
	alarm[0] = 120
}
