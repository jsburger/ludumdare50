/// @description Insert description here
// You can write your code in this editor

event_inherited();

spr_idle = sprEnemy1Idle;
spr_walk = sprEnemy1Walk;
spr_hurt = sprEnemy1Hurt;
spr_dead = sprEnemy1Dead;

maxspeed = 2.5;
minspeed = 0;
damage = 1;

maxhealth = 2;
my_health = maxhealth;

alarm[0] = 50 + irandom(20);
friction = .5;
