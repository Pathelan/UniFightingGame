/// @description Draw Cards

#region // Only Draw hand if it is the Draw Phase
if (g.phase == battlePhase.pDraw) 
{
	// Draw Cards equal to amount in Hand
	for (var i=0; i<handSize; i++;) 
	{
		if (i<deckSize && i>=0) // Draw if hand is greater than 0 and less than decksize
		{ 
				// Highlight Selected Card
				if (cardSelected == i) {
					// Draw Highlighted CArd
					cardY = 650;
					cardColour = c_yellow;
					cardScale = 1.15; // Increase size of selected card
					draw_text((cardX + i*cardXMultiplier) + 125, cardY - 72, CardText(hand[|i]));
				}else{
					// Draw other cards normally
					cardY = 700;
					cardColour = c_white;
					cardScale = 1; // Draw at normal size
				}
				
				// Highlight Played Card
				for (var j=0; j<=maxCardsInPlay; j++) {
					if (c[j] == i) {
						cardY = 600
						cardColour = c_maroon;
						cardScale = 1;
						draw_text((cardX + i*cardXMultiplier) + 125, cardY+350, j+1);
					}
				}
				draw_sprite_ext(sCard, hand[|i], cardX + i*cardXMultiplier, cardY, cardScale, cardScale, 0, cardColour, 1);	
			}
	}
} else if (g.phase == battlePhase.pAttack) {
	for (var l=0; l<=maxCardsInPlay; l++) {
		draw_sprite_ext(sCard, hand[|l], 100, 200+(200*l), 0.5, 0.5, 0, c_white, 1);		
	}
}
#endregion

#region// Dice Roll
if (diceDraw == true) {
	
	// Dice Variables
	var dScale = 1;
	
	if (diceRoll == false) {
		dScale = 1.25;
		if (dScale > 1) { // Reduce dice scale after roll ends
			dScale = (0.00888*alarm[1])+1;	
		}
	}
	
	// Draw Dice
	draw_sprite_ext(sprD20, string(diceNumber-1), 500, 500, dScale, dScale, 0, c_white, 1);
	
	
}

#endregion


draw_text(x+64, y, handSize);
draw_text(64+x, y+16, maxHandSize);

draw_text(x+64, y+80, cardSelected);
draw_text(x+32, y+64, c[0]);
draw_text(x+64, y+64, c[1]);
draw_text(x+96, y+64, c[2]);
draw_text(x+96, y+80, cardsHeld);

draw_text(x+96, y+96, alarm[1]);