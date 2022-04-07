/// @description Insert description here
// You can write your code in this editor

event_inherited();

spr_idle = sprEnemy4Idle;
spr_walk = sprEnemy4Walk;
spr_hurt = sprEnemy4Hurt;
spr_dead = sprEnemy4Dead;

damage = 2;
range = 32 * 4;
maxspeed = 1;
minspeed = 0;
tracking = false;

maxhealth = 5;
my_health = maxhealth;

alarm[0] = 50 + irandom(20);
friction = .5;
