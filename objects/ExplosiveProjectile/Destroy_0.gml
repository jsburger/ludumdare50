/// @description Create explosion
instance_create_layer(x, y, "Instances", Explosion);
sound_play(sndBossExplosion1, random_range(.9, 1.1), 1);
