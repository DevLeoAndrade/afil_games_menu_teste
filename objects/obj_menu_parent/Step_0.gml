// Keyboard inputs
var _input_up = keyboard_check_pressed(vk_up);
var _input_down = keyboard_check_pressed(vk_down);
var _input_right = keyboard_check(vk_right);
var _input_left = keyboard_check(vk_left);
var _input_select = keyboard_check_pressed(vk_space);

// Mouse inputs
var _input_mouse_down = mouse_check_button_pressed(mb_left);
input_mouse_x = device_mouse_x_to_gui(0);
input_mouse_y = device_mouse_y_to_gui(0);

//show_debug_message(input_mouse_x);
//show_debug_message(input_mouse_y);

// Change index
change_item_selected(_input_up - _input_down);

// Select index
if(_input_select || _input_mouse_down)
{
	selection_behaviour();	
}

// Change volume slider value
var _input_horizontal = _input_right - _input_left; 
change_volume_slider_value(_input_horizontal);