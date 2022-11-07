/// @description Draw Text

// Get Middle of Screen
camMidX = surface_get_width(application_surface)/2;
camMidY = surface_get_height(application_surface)/16;

draw_set_halign(fa_center);
draw_text(camMidX, camMidY, phaseText);

draw_text(100, 400, lerp(0, camera_get_view_x(view_camera[0]), 1));

