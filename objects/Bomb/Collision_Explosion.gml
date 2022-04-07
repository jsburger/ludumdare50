/// @description Insert description here
// You can write your code in this editor
instance_create_layer(x, y, "Instances", Explosion);
sound_play(sndBossExplosion1, random_range(.9, 1.1), 1);
instance_destroy(self, false);
