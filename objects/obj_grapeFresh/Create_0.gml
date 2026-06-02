/// @description Insert description here
// You can write your code in this editor

sc_spawnRandomPosition();

life_timer = 0;
life_time = global.var_life_time;

if (!(audio_is_playing(snd_eatFreshD) || audio_is_playing(snd_eatRottenA) || audio_is_playing(snd_eatMedsB)))
{
	audio_play_sound(snd_grapeSpawn, 1, false);
}