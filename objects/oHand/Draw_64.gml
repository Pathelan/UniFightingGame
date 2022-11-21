/// @description Draw Cards
if (playerDeath == false && enemyDeath == false) { // Draw UI
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
						// Draw Highlighted Card
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
	
		// Draw Controls
		if (c[0] != -1 && c[1] != -1 && c[2] != -1) { // Check if All Cards have been selected
			// Draw Spacebar
			draw_sprite(sKeys, 4, 960, 500);	
		}
	
		// Q Key
		draw_sprite(sKeys, 0, 300, 850);
	
		// E Key
		draw_sprite(sKeys, 1, 1615, 850);
	
		// W Key
		draw_sprite(sKeys, 2, 160, 750);
	
		// S Key
		draw_sprite(sKeys, 3, 160, 950);
	
	} else if (g.phase == battlePhase.pAttack) {
		for (var l=0; l<=maxCardsInPlay; l++) {
			draw_sprite_ext(sCard, hand[|c[l]], 100, 200+(200*l), 0.5, 0.5, 0, c_white, 1);		
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
		if (diceRoll == true) {
			draw_sprite_ext(sprD20, irandom_range(1, 20), 960, 400, dScale, dScale, 0, c_white, 1);
		} else {
			draw_sprite_ext(sprD20, string(diceNumber-1), 960, 400, dScale, dScale, 0, c_white, 1);
		}
	
	}

	#endregion

}

// Win Condition
if (enemyDeath == true) {
	// Cover Background
	draw_set_alpha(0.9);
	draw_rectangle_color(0, 0, 1920, 1080, c_dkgray, c_dkgrey, c_dkgrey, c_dkgrey, false);
	draw_set_alpha(1);
	
	// Draw Text
	draw_set_font(fntBig);
	draw_text_color(960, 360, "YOU WIN!", c_yellow, c_yellow, c_white, c_white, 1);
	
	draw_set_font(fntSmall);
	draw_text(960, 540, playerWinText);
	
	// Credits
	draw_text(192, 64, creditsText);
}

// Lose Condition
if (playerDeath == true) {
	// Cover Background
	draw_set_alpha(0.9);
	draw_rectangle_color(0, 0, 1920, 1080, c_dkgray, c_dkgrey, c_dkgrey, c_dkgrey, false);
	draw_set_alpha(1);
	
	// Draw Text
	draw_set_font(fntBig);
	draw_text_color(960, 360, "YOU LOSE!", c_red, c_red, c_white, c_white, 1);
	
	draw_set_font(fntSmall);
	draw_text(960, 540, enemyWinText);
	
	// Credits
	draw_text(192, 64, creditsText);
}
