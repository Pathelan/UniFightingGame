/// @description Draw Cards

// Only Draw hand if it is the Draw Phase
if (g.phase == battlePhase.pDraw) {
	
	// Draw Cards equal to amount in Hand
	for (var i=0; i<handSize; i++;) {
		if (i<deckSize && i>=0) { // Draw if hand is greater than 0 and less than decksize
			
			for (var j=0; j<maxCardsInPlay; j++) {
				if (c[j] == i) {
					// Highlight Played Card
					draw_sprite_ext(sCard, hand[|i], 500 + i*144, 700, 2, 2, 0, c_red, 1);
				} else if (cardSelected == i) {
					// Highlight Selected Card
					draw_sprite_ext(sCard, hand[|i], 500 + i*144, 700, 2, 2, 0, c_yellow, 1);
				} else {
					// Draw other cards normally
					draw_sprite_ext(sCard, hand[|i], 500 + i*144, 800, 2, 2, 0, c_white, 1);	
				}
			}
				
			
		}
	}
	
}

draw_text(x, y, handSize);

draw_text(x, y+16, maxHandSize);

draw_text(x, y+64, c[0]);
draw_text(x+16, y+64, c[1]);
draw_text(x+32, y+64, c[2]);
draw_text(x, y+80, cardsHeld);