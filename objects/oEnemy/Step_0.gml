/// @description Step

enemyHealth = min(enemyMaxHealth, enemyHealth);

// Smooth Player Damage
if (smoothHealth == true) {
	if (enemyLastHealth > enemyHealth) {
		enemyLastHealth = floor(lerp(enemyLastHealth, enemyHealth, 0.025));
	} else if (enemyLastHealth <= enemyHealth) {
		smoothHealth = false;	
	}
}