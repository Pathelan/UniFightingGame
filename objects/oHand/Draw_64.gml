/// @description Draw Cards

// Only Draw hand if it is the Draw Phase
if (g.phase == battlePhase.pDraw) 
{
	// Draw Cards equal to amount in Hand
	for (var i=0; i<handSize; i++;) 
	{
		if (i<deckSize && i>=0) // Draw if hand is greater than 0 and less than decksize
		{ 
				// Highlight Selected Card
				if (cardSelected == i) {
					cardY = 700;
					cardColour = c_yellow;
				}else{
					// Draw other cards normally
					cardY = 700;
					cardColour = c_white;	
				}
				
				// Highlight Played Card
				for (var j=0; j<=maxCardsInPlay; j++) {
					if (c[j] == i) {
						cardY = 600
						cardColour = c_red;
					}
				}
				draw_sprite_ext(sCard, hand[|i], cardX + i*cardXMultiplier, cardY, 2, 2, 0, cardColour, 1);	
			}
	}
}

draw_text(x+64, y, handSize);
draw_text(64+x, y+16, maxHandSize);

draw_text(x+64, y+80, cardSelected);
draw_text(x+32, y+64, c[0]);
draw_text(x+64, y+64, c[1]);
draw_text(x+96, y+64, c[2]);
draw_text(x+96, y+80, cardsHeld);