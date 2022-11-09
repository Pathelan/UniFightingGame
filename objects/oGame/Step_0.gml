/// @description Step

// Parallax Backgrounds
layer_x(bgClose,	lerp(0, oCamera.x, 20)	);
layer_x(bgMid,		lerp(0, oCamera.x, 30)	);
layer_x(bgFar,		lerp(0, oCamera.x, 50)	);


// --=== Debug ===--


switch (phase) {
	case battlePhase.pDraw:
		
		
		if (reduceHealth == true) {
			oPlayer.alarm[0] = room_speed/2; // Play Health Reduction animation
			reduceHealth = false;
		}
		break;	
		
		
	case battlePhase.pAttack:
		phaseText = "Attack Phase"; // Set text
		
		if (currentCombatPhase <= maxCombatPhases) { // Only run if combat is still going
			if ((currentCombatPhase mod 2) == 1) { // Check if phase is odd or even
				// Player Phase
				
				if (phaseAlarm == false) {
					// Check player's cards and do appropriate check
					#region
					switch (CardText(oHand.hand[|oHand.c[floor(currentCombatPhase/2)]])) {
						case "Kick": // Card 1
							//lastAttack = ("Kick");
							break;
			
						case "Focus": // Card 2
							//lastAttack = ("Focus");
							break;
			
						case "Knee Strike": // Card 3
							//lastAttack = ("Knee Strike");
							break;
			
						case "Punch": // Card 4 
							//lastAttack = ("Punch");
							break;
			
						case "Dodge": // Card 5
							//lastAttack = ("Dodge");
							break;
			
						case "Grab": // Card 6
							//lastAttack = ("Grab");
							break;
			
						case "Headbutt": // Card 7
							//lastAttack = ("Headbutt");
							break;
			
						case "Block": // Card 8
							//lastAttack = ("Block");
							break;
		
		
					}
					#endregion
					
					alarm[0] = room_speed; // Wait X Frames before moving to next combat phase
					phaseAlarm = true;
				}
			} else {
				if (enemyAttack == false) {
				
					// Enemy Attack
					switch (CardText(oEnemyHand.eHand[|oEnemyHand.c[max(0, (currentCombatPhase/2)-1)]])) {
							case "Kick": // Card 1
								lastAttack = ("Kick");
								break;
			
							case "Focus": // Card 2
								lastAttack = ("Focus");
								break;
			
							case "Knee Strike": // Card 3
								lastAttack = ("Knee Strike");
								break;
			
							case "Punch": // Card 4 
								lastAttack = ("Punch");
								break;
			
							case "Dodge": // Card 5
								lastAttack = ("Dodge");
								break;
			
							case "Grab": // Card 6
								lastAttack = ("Grab");
								break;
			
							case "Headbutt": // Card 7
								lastAttack = ("Headbutt");
								break;
			
							case "Block": // Card 8
								lastAttack = ("Block");
								break;
						}
						
						enemyAttack = true;
				}
				
				
				
				if (phaseAlarm == false) {
					alarm[0] = room_speed; // Wait X Frames before moving to next combat phase
					phaseAlarm = true;
				}
			}
		} else {
			phase = battlePhase.pDraw; // Set Phase
			currentCombatPhase = 1;
			lastAttack = "";
			
			
			// Set Variables for Player Draw
			phaseText = "Draw Phase"; // Set Text
			scrShuffleHand(); // Shuffle Hand
			with (oHand) { // Reset Hand when turning to draw phase
				for (var k=0; k<maxCardsInPlay+1; k++) {
					c[k] = -1;	
				}
			}
			
			reduceHealth = true;
		}
		break;
}

if (keyboard_check_pressed(vk_space)) {
	phase = battlePhase.pAttack;	
}