// @desc Draw Health

draw_self();

draw_sprite(sprHealthbarBackground, 0, x-38, y-96);

if (enemyLastHealth - enemyHealth >= 10) {
	draw_sprite_ext(sprHealthbarMiddle, 0, x-36, y-96, max(enemyLastHealth/enemyMaxHealth, 0), 1, 0, c_red, 1);	
} else {
	draw_sprite_ext(sprHealthbarMiddle, 0, x-36, y-96, max(enemyLastHealth/enemyMaxHealth, 0), 1, 0, c_white, 1);	
}

if ((enemyHealth-enemyLastHealth) < 0) {
	draw_text(x, y-128, round(enemyHealth - enemyLastHealth));
}

draw_sprite_ext(sprHealthbarInner, 0, x-36, y-96, max(enemyHealth/enemyMaxHealth, 0), 1, 0, c_white, 1);
draw_sprite_ext(sprDefenceInner, 0, x-36, y-96, max(enemyDefence/10, 0), 1, 0, c_white, 1);