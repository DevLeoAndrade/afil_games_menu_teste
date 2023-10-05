room_name = "rm_gameplay";

// Mouse inputs initialization
input_mouse_x = 0;
input_mouse_y = 0;

width = 256;
height = 256;

space = 40;

item_selected_index = 0;

// Gameplay menu item ids
id_item_return = "Voltar";
id_item_fullscreen = "Tela Cheia";

// Gameplay menu
titles[0] = "";
items[0, 0] = id_item_return;

previous_menu_level = 0;
menu_level = 0;
items_length = array_length(items[menu_level]);

instance_deactivate_all(true);

is_full_screen = false;
can_change_volume_slider = false;

function change_item_selected(_input)
{
	item_selected_index -= _input;
	// Loop though array
	item_selected_index = item_selected_index >= items_length ? 0 : item_selected_index;
	item_selected_index = item_selected_index < 0 ? items_length - 1 : item_selected_index;
}

// Item selection behaviours
function selection_behaviour()
{
	previous_menu_level = menu_level;
	
	can_change_volume_slider = false;
	
	// Deactivate sliders
	instance_deactivate_object(obj_slider);
	
	switch(menu_level)
	{
		case 0: // Gameplay menu
			switch(item_selected_index)
			{
				// Return
				case 0: room_goto(rm_main_menu); break;
			}
		break;
	}
	
	items_length = array_length(items[menu_level]);
	
	// Activate sliders
	for(var _i = 0; _i < items_length; _i++)
	{
		if(typeof(items[menu_level, _i]) == "ref")
		{
			instance_activate_object(items[menu_level, _i]);
		}
	}
	
	item_selected_index = previous_menu_level != menu_level ? 0 : item_selected_index;
}

function change_volume_slider_value(_input)
{
	if(items_length >= item_selected_index)
	{
		if(typeof(items[menu_level, item_selected_index]) == "ref")
		{
			items[menu_level, item_selected_index].change_value(_input);
		}
	}
}