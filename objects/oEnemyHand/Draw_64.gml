/// @description Draw CArds in Attack Phase

// Get width of camera
var cWidth = camera_get_view_width(view_camera[0])*2;

if (g.phase == battlePhase.pAttack) {
	for (var l=0; l<=maxCardsInPlay; l++) {
		draw_sprite_ext(sCard, eHand[|l+1], cWidth-250, 200+(200*l), 0.5, 0.5, 0, c_white, 1);		
	}
}

draw_text(500, 64, cWidth);