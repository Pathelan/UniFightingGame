/// @description Initialise Variables

// Parallax Variables
bgClose = layer_get_id("bgForestClose");
bgMid = layer_get_id("bgForestMid");
bgFar = layer_get_id("bgForestFar");


phaseText = "Draw Phase";

// Phases of Battle
phase = battlePhase.pDraw;
enum battlePhase{
	pDraw,
	pAttack,
}
