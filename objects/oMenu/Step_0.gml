/// @description Insert description here
// You can write your code in this editor

// Draw Back Button 
if (drawCards == false) { // Check if Cards Deck is already drawn
	if (mouse_x <= 360) { // Check if Mouse is on the right side
		bStart = 1;
			if (mouse_check_button(mb_left)) { // Change Sprite to pressed
				bStart = 2;
			} else if (mouse_check_button_released(mb_left)) {
					room_goto(choose(rmBattle, rmBattle2)); // Go to Battle Room
					if (!audio_is_playing(sndFight)) {
						audio_play_sound(sndFight, 10, true);
					}
			}
		} else {
			bStart = 0;	// Reset Sprite if not true
		}
	
	
	
} else if (drawCards == true) { // Draw Back Button
	if (mouse_x <= 360) {
		bBack = 1;	
			if (mouse_check_button(mb_left)) {
				bBack = 2;
			} else if (mouse_check_button_released(mb_left)) {
				drawCards = false;
			}
		
		} else {
			bBack = 0;	
		}
}

// Draw Quit Button
if (mouse_x > 360  && mouse_x < 720) {
bQuit = 1;	
if (mouse_check_button(mb_left)) {
		bQuit = 2;
	} else if (mouse_check_button_released(mb_left)) {
		game_end();
	}

} else {
	bQuit= 0;	
}

// Draw Deck Button
if (mouse_x >= 720) {
bDeck = 1;	
	if (mouse_check_button(mb_left)) {
		bDeck = 2;
	} else if (mouse_check_button_released(mb_left)) {
		drawCards = true;
	}

} else {
	bDeck = 0;	
}
