function scrSelectCard(hoveredCard){
	///@desc function for selecting & deselecting cards (credit: Mike Truck)
	
	//linear scan for if selected card is already played
	cardsHeld = clamp(cardsHeld, 0, 3);
	for (var i=0; i<=maxCardsInPlay; ++i) 
	{
		//if hovered card is in c array, unassign that shit & lower cards held count
		if(hoveredCard == c[i])
		{
			c[i] = -1;	//empty the hovered c slot
			cardsHeld --; //down boy
			return;
		}
	}
	
	//linear scan for if the hovered card is empty
	for (var j=0; j<=maxCardsInPlay; ++j) 
	{
		//if hovered card is not taken up by something else and is empty
		if((hoveredCard != c[j]) && c[j] == -1)
		{
			c[j] = hoveredCard; //set first free c slot to the hovered card
			cardsHeld ++; //up that shit
			return;
		}
	}
	
}