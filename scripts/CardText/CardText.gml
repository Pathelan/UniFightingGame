function CardText(cardID){
	
	cardID = argument0;
	
	// Get the value of the card and return the appropriate text.
	switch (cardID) {
			case 0: // Kick
				return "Kick";
			break;
			
			case 1: // Focus
				return "Focus";
			break;
			
			case 2: // Knee Strike
				return "Knee Strike";
			break;
			
			case 3: // Punch
				return "Punch";
			break;
			
			case 4: // Dodge
				return "Dodge";
			break;
			
			case 5: // Grab
				return "Grab";
			break;
			
			case 6: // Headbutt
				return "Headbutt";
			break;
			
			case 7: // Block
				return "Block";
			break;
			
	}
}