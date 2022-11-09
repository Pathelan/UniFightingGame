/// @description Initialise Variables



// Player Variables
playerMaxHealth = 20;
playerHealth = playerMaxHealth;
playerLastHealth = playerHealth;

// Draw Variables
smoothHealth = false;


// Create Cursor object if it doesn't exist
if (!instance_exists(oCursor)) {
	instance_create_depth(0,0,-100,oCursor);
}

