/// @description Insert description here
// You can write your code in this editor

event_inherited();

spr_idle = sprEnemy3Idle;
spr_walk = sprEnemy1Walk;
spr_hurt = sprEnemy3Dead;
spr_dead = sprEnemy3Dead;
spr_fire = sprEnemy3Fire;
team = 0; 

range = 32 * 9;
maxspeed = 0;
minspeed = 0;
damage = 0;;
gunangle = 0;
maxhealth = 1;
my_health = maxhealth;

alarm[0] = 60;
friction = 10000;

waitTime = 2
