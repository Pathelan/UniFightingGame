function scrPlayCards(dsList, player, number){
	dsList = argument0;
	player = argument1;
	number = argument2;
	
	// Get Cards
	switch (CardText(player.dsList[|number])) {
		case "Kick": // Card 1
			show_debug_message("Kick");
			break;
			
		case "Focus": // Card 2
			show_debug_message("Focus");
			break;
			
		case "Knee Strike": // Card 3
			show_debug_message("Knee Strike");
			break;
			
		case "Punch": // Card 4 
			show_debug_message("Punch");
			break;
			
		case "Dodge": // Card 5
			show_debug_message("Dodge");
			break;
			
		case "Grab": // Card 6
			show_debug_message("Grab");
			break;
			
		case "Headbutt": // Card 7
			show_debug_message("Headbutt");
			break;
			
		case "Block": // Card 8
			show_debug_message("Block");
			break;
		
		
	}
}