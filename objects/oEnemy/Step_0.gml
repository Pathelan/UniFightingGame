/// @description Step

enemyHealth = min(enemyMaxHealth, enemyHealth);

// Smooth Player Damage
if (smoothHealth == true) {
	if (enemyLastHealth > enemyHealth) {
		enemyLastHealth = lerp(enemyLastHealth, enemyHealth, 0.025);
	} else if (enemyLastHealth <= enemyHealth) {
		smoothHealth = false;	
	}
}

// Death
if (enemyLastHealth <= 0) {
	oHand.enemyDeath = true;
}
