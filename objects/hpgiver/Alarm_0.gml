/// @description Insert description here
// You can write your code in this editor
Player.my_health++;
Player.maxhealth++;
ammo--
if ammo = 0 instance_destroy(self, false) else alarm[0] = 10;
