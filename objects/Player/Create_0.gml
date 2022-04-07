/// @description Insert description here
// You can write your code in this editor

event_inherited()

depth += 1
depthBase = depth - 1

friction = .4;
maxSpeed = 4
maxhealth = 3;
my_health = maxhealth;
team = 1;

carrying  = noone
throwDir  = direction
throwing  = false
interactRange = 4;

walkSound = sndPlayerMove
dustTime = 0

dead = false
deadTime = 0

snd_hurt = sndPlayerHurt
spr_hurt = sprPlayerHurtLeft
spr_dead = sprPlayerHurtLeft
