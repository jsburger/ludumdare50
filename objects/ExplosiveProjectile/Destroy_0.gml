/// @description Create explosion
with instance_create_layer(x, y, "Instances", Explosion) team = other.team;
sound_play(sndBossExplosion1, random_range(.9, 1.1), 1);
