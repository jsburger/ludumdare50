/// @description Insert description here
// You can write your code in this editor
if sprite_index = spr_fire sprite_index = spr_idle
if sprite_index = spr_hurt{
	if my_health <= 0{
		
		instance_destroy(self, true);
	}
}
