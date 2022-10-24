/// @description 

draw_self();

draw_sprite(sprHealthbarBackground, 0, x-38, y-64);

if ( playerLastHealth - playerHealth >= 25) {
	draw_sprite_ext(sprHealthbarMiddle, 0, x-36, y-64, max(playerLastHealth/playerMaxHealth, 0), 1, 0, c_red, 1);	
} else {
	draw_sprite_ext(sprHealthbarMiddle, 0, x-36, y-64, max(playerLastHealth/playerMaxHealth, 0), 1, 0, c_white, 1);	
}

draw_text(x, y-96, playerHealth - playerLastHealth);

draw_sprite_ext(sprHealthbarInner, 0, x-36, y-64, max(playerHealth/playerMaxHealth, 0), 1, 0, c_white, 1);