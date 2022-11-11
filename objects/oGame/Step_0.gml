/// @description Step

// Parallax Backgrounds
layer_x(bgClose,	lerp(0, oCamera.x, 20)	);
layer_x(bgMid,		lerp(0, oCamera.x, 30)	);
layer_x(bgFar,		lerp(0, oCamera.x, 50)	);



switch (phase) {
	case battlePhase.pDraw:
		
		// Reset Consecutive Damage Buffs
		p.playerPunchConsecutive = 0;
		e.enemyPunchConsecutive = 0;
		
		if (reduceHealth == true) {
			// Make Player Take Damage from the last enemy phase
			if (p.playerDefence > 0) {
				var oldEnemyDamage = e.enemyAttack;
					e.enemyAttack -= p.playerDefence;
					e.enemyAttack = max(0, e.enemyAttack);
					p.playerDefence -= oldEnemyDamage;
				}
				
				if (e.enemyFocus == false) {
					p.playerHealth -= e.enemyAttack;	
				} else {
					p.playerHealth -= e.enemyAttack*2;
				}
			
			p.alarm[0] = room_speed/2; // Play Health Reduction animation
			e.alarm[0] = room_speed/2; // Play Health Reduction animation
			reduceHealth = false;
		}
		break;	
		
		
	case battlePhase.pAttack:
		phaseText = "Attack Phase"; // Set text
		
		if (currentCombatPhase <= maxCombatPhases) { // Only run if combat is still going
			if ((currentCombatPhase mod 2) == 1) { // Check if phase is odd or even
				// Player Phase
				if (eAttackDone == false) {
						// Take Damage
						if (p.playerDefence > 0) {
							var oldEnemyDamage = e.enemyAttack;
								e.enemyAttack -= p.playerDefence;
								e.enemyAttack = max(0, e.enemyAttack);
								p.playerDefence -= oldEnemyDamage;
							}
					
						if (e.enemyFocus == false) {
							p.playerHealth -= e.enemyAttack + e.enemyPunchConsecutive;	
						} else {
							p.playerHealth -= (e.enemyAttack*2) + e.enemyPunchConsecutive;
						}
						
						// Reset Sprite
						p.image_index = 0;
						
						// Set Attack to done
						eAttackDone = true;
						pAttackDone = false;
						
						// Recoil Damage
						p.playerHealth -= p.playerRecoil;
						p.playerRecoil = 0;
						
						// Reset Enemy's Attacks
						e.enemyAttack = 0;
						oHand.diceNumber = 1; // Reset Dice Number 
						oEnemyHand.diceNumber = 1; // Reset Dice Number
					}
				
				if (phaseAlarm == false) {
					// Check player's cards and do appropriate check
					#region
					switch (CardText(oHand.hand[|oHand.c[floor(currentCombatPhase/2)]])) {
						case "Kick": // Card 1
							p.playerAttack = 3; // Set Attack to 3
							p.sprite_index = sPlayerKick;
							
							// Play Sound
							var sound = choose(sfxHit1, sfxHit2, sfxHit3);
							audio_play_sound(sound, 5, false);
							
							/* Sounds from:
							https://freesound.org/people/JohnLoser/sounds/573376/
							https://freesound.org/people/Merrick079/sounds/566436/
							https://freesound.org/people/thefsoundman/sounds/118513/
							*/
							
							break;
			
						case "Focus": // Card 2
							p.playerFocus = true; // Give Player Double Damage for a turn
			
						case "Knee Strike": // Card 3
							p.playerAttack = 4; // Set Attack to 4
							p.sprite_index = sPlayerKick;
							
							// Play Sound
							var sound = choose(sfxHit1, sfxHit2, sfxHit3);
							audio_play_sound(sound, 5, false);
							break;
			
						case "Punch": // Card 4 
							p.playerAttack = 2 + oPlayer.playerPunchConsecutive; // Add attack
							p.playerPunchConsecutive += 2; // Incriment Attack
							p.sprite_index = sPlayerPunch;
							
							// Play Sound
							var sound = choose(sfxHit1, sfxHit2, sfxHit3);
							audio_play_sound(sound, 5, false);
							break;
			
						case "Dodge": // Card 5
							p.playerDodge = true; // Allow player to dodge attack
							break;
			
						case "Grab": // Card 6
							p.playerGrab = true;
							p.playerAttack = 3;
							p.sprite_index = sPlayerPunch;
							
							// Play Sound
							var sound = choose(sfxHit1, sfxHit2, sfxHit3);
							audio_play_sound(sound, 5, false);
							break;
			
						case "Headbutt": // Card 7
							p.playerAttack = 5;
							p.playerRecoil = 1;
							p.sprite_index = sPlayerPunch;
							
							// Play Sound
							var sound = choose(sfxHit1, sfxHit2, sfxHit3);
							audio_play_sound(sound, 5, false);
							break;
			
						case "Block": // Card 8
							p.playerDefence += 2;
							
							// Play Sound
							var sound = choose(sfxDefend1, sfxDefend2);
							audio_play_sound(sound, 5, false);
							break;
		
		
					}
					#endregion
					
					alarm[0] = room_speed*2; // Wait X Frames before moving to next combat phase
					phaseAlarm = true;
				}
			} else {
				if (enemyAttack == false) {
					
					if (pAttackDone == false) {
						
						if (oEnemyHand.diceRoll == false || diceNumber > (6+ max(e.enemyAttack, e.enemyDefence))) { // Only take damage if roll is low enough
							if (e.enemyDefence > 0) {
							var oldPlayerDamage = p.playerAttack;
								p.playerAttack -= e.enemyDefence;
								p.playerAttack = max(0, p.playerAttack);
								e.enemyDefence -= oldPlayerDamage;
							}
					
							if (p.playerFocus == false) {
								e.enemyHealth -= p.playerAttack;	
							} else {
								e.enemyHealth -= p.playerAttack*2;
							}
						}
						pAttackDone = true;
						eAttackDone = false;
						
						// Enemy Recoil
						e.enemyHealth -= e.enemyRecoil;
						e.enemyRecoil = 0;
						e.image_index = 0;
						
						// Reset Player's Attacks
						p.playerAttack = 0;
						p.playerFocus = false;
						oHand.diceNumber = 1; // Reset Dice Number 
						oEnemyHand.diceNumber = 1; // Reset Dice Number
					}
					
					
					// Enemy Attack
					switch (CardText(oEnemyHand.eHand[|oEnemyHand.c[max(0, (currentCombatPhase/2)-1)]])) {
							case "Kick": // Card 1
								e.enemyAttack = 3;
								e.sprite_index = sEnemyKick;
								
								// Play Sound
								var sound = choose(sfxHit1, sfxHit2, sfxHit3);
								audio_play_sound(sound, 5, false);
								break;
			
							case "Focus": // Card 2
								e.enemyFocus = true;
								break;
			
							case "Knee Strike": // Card 3
								e.enemyAttack = 4;
								e.sprite_index = sEnemyKick;
								
								// Play Sound
								var sound = choose(sfxHit1, sfxHit2, sfxHit3);
								audio_play_sound(sound, 5, false);
								break;
			
							case "Punch": // Card 4 
								e.enemyAttack = 2 + e.enemyPunchConsecutive;
								e.enemyPunchConsecutive += 2;
								e.sprite_index = sEnemyPunch;
								
								// Play Sound
								var sound = choose(sfxHit1, sfxHit2, sfxHit3);
								audio_play_sound(sound, 5, false);
								break;
			
							case "Dodge": // Card 5
								e.enemyDodge = true;
								break;
			
							case "Grab": // Card 6
								e.enemyGrab = true;
								e.enemyAttack = 3;
								e.sprite_index = sEnemyPunch;
								
								// Play Sound
								var sound = choose(sfxHit1, sfxHit2, sfxHit3);
								audio_play_sound(sound, 5, false);
								break;
			
							case "Headbutt": // Card 7
								e.enemyAttack = 5;
								e.sprite_index = sEnemyPunch;
								
								// Play Sound
								var sound = choose(sfxHit1, sfxHit2, sfxHit3);
								audio_play_sound(sound, 5, false);
								break;
			
							case "Block": // Card 8
								e.enemyDefence += 2;
								// Play Sound
								var sound = choose(sfxDefend1, sfxDefend2);
								audio_play_sound(sound, 5, false);
								break;
						}
						
						enemyAttack = true;
				}
				
				
				
				if (phaseAlarm == false) {
					alarm[0] = room_speed*2; // Wait X Frames before moving to next combat phase
					phaseAlarm = true;
				}
			}
		} else {
			phase = battlePhase.pDraw; // Set Phase
			currentCombatPhase = 1;
			lastAttack = "";
		
			
			
			// Set Variables for Player Draw
			phaseText = "Draw Phase"; // Set Text
			
			// Reset Variables
			p.playerAttack = 0;
			e.enemyAttack = 0;
			
			p.playerFocus = false;
			e.enemyFocus = false;
			
			p.playerDodge = false;
			e.enemyDodge = false;
			
			p.playerGrab = false;
			e.enemyGrab = false;
			
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