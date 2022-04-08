/// @description reduce cooldown
// Inherit the parent event
event_inherited();
cooldown = max(--cooldown, 0);


