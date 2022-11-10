if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, all) = id)
{
	image_index = 1
	pressed = true
}
else if (pressed == false) && (instance_position(mouse_x, mouse_y, all) = id)
{
	image_index = 2
}
else
{
	if pressed == false
		image_index = 0
	else
		image_index = 1
}

if (mouse_check_button_released(mb_left))
{
	if pressed == true
		room_goto(Room1)
}