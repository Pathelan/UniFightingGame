function CardText(cardID){
	
	cardID = argument0;
	
	// Get the value of the card and return the appropriate text.
	switch (cardID) {
			case 0: case 1: case 2: // Kick
				return "Kick";
			break;
			
			case 3: // Focus
				return "Focus";
			break;
			
			case 4: // Knee Strike
				return "Knee Strike";
			break;
			
			case 5: case 6: case 7: // Punch
				return "Punch";
			break;
			
			case 8: case 9: // Dodge
				return "Dodge";
			break;
			
			case 10: // Grab
				return "Grab";
			break;
			
			case 11: case 12: // Headbutt
				return "Headbutt";
			break;
			
			case 13: case 14: case 15: case 16: // Block
				return "Block";
			break;
			
	}
}