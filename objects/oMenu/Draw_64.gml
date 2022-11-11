/// @description Draw Cards

draw_sprite_ext(bgMenu, 0, 0, 0, 1, 1, 0, c_white, 1);


if (drawCards == true) {
	draw_set_alpha(0.8);
	// Cover entire screen with Grey
	draw_rectangle_colour(0, 0, 1920, 1080, c_dkgray, c_dkgrey, c_dkgrey, c_dkgrey, false);
	draw_set_alpha(1);
	
	// Create Area that Cards will be drawn over
	draw_rectangle_colour(960, 0, 1920, 1080, c_grey, c_grey, c_grey, c_grey, false);
	
	// Draw Cards
	for (var i=0; i<cSize; i++) {
		if (i<4) {
			draw_sprite_ext(sCardMenu, i, 1200, 50 + (240*i), 0.75, 0.75, 0, c_white, 1);	
		} else if (i>=4) {
			draw_sprite_ext(sCardMenu, i, 1500, -910 + (240*i), 0.75, 0.75, 0, c_white, 1);
		}
	}
	
	draw_sprite(sBackButton, bBack, 360, 540);
}

// Draw Other buttons
if (drawCards == false) { // Make Sure it doesn't render when displaying deck
	draw_sprite(sStartButton, bStart, 360, 810);
	draw_sprite(sQuitButton, bQuit, 960, 810);
	draw_sprite(sDeckButton, bDeck, 1560, 810);
}



// Draw Cursor
draw_sprite(sCursor, 0, mouse_x*2, mouse_y*2);