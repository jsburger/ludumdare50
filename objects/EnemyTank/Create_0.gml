/// @description Insert description here
// You can write your code in this editor

event_inherited();

spr_idle = sprEnemy4Walk;
spr_walk = sprEnemy4Walk;
spr_hurt = sprEnemy4Hurt;
spr_dead = sprEnemy4Dead;
spr_hit  = sprHitmeHitL;

damage = 1;
range = 32 * 5;
maxspeed = 1;
minspeed = 0;
tracking = false;
frame = 0;

maxhealth = 5;
my_health = maxhealth;

alarm[0] = 50 + irandom(20);
friction = .5;

if !irandom(19){
	
	spr_walk = sprEnemy4MomWalk;
	spr_idle = spr_walk
}
