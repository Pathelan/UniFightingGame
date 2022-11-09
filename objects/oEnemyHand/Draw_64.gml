/// @description Draw CArds in Attack Phase

// Get width of camera
var cWidth = camera_get_view_width(view_camera[0])*2;

if (g.phase == battlePhase.pAttack) {
	for (var l=0; l<=maxCardsInPlay; l++) {
		draw_sprite_ext(sCard, eHand[|l+1], cWidth-250, 200+(200*l), 0.5, 0.5, 0, c_white, 1);		
	}
}

draw_text(500, 64, cWidth);

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