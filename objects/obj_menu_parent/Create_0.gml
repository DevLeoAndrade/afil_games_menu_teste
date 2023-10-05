room_name =  "rm_main_menu";

// Mouse inputs initialization
input_mouse_x = 0;
input_mouse_y = 0;

width = 256;
height = 256;

space = 40;

item_selected_index = 0;

// Main menu item ids
id_item_play = "Jogar";
id_item_settings = "Configuracoes";
id_item_quit = "Sair";
// Settings menu item ids
id_item_fullscreen = "Tela Cheia";
id_item_return = "Voltar";
// Exit confirmation menu item ids
id_item_yes = "Sim";
id_item_no = "Nao";

// Main menu
titles[0] = "";
items[0, 0] = id_item_play;
items[0, 1] = id_item_settings;
items[0, 2] = id_item_quit;
// Settings menu
titles[1] = "";
items[1, 0] = instance_create_layer(x, y, "Instances", obj_slider); // Volume
items[1, 1] = id_item_fullscreen;
items[1, 2] = id_item_return;
// Exit confirmation menu
titles[2] = "Voce deseja sair?";
items[2, 0] = id_item_yes;
items[2, 1] = id_item_no;

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
		case 0: // Main menu
			switch(item_selected_index)
			{
				// Play
				case 0: room_goto(rm_gameplay); break;
				// Settings
				case 1: menu_level = 1;  break;
				// Quit
				case 2: menu_level = 2; break;
			}
		break;
		case 1: // Settings menu
			switch(item_selected_index)
			{
				case 0:
					can_change_volume_slider = true;
				break;
				case 1: is_full_screen = !is_full_screen; window_set_fullscreen(is_full_screen); break;
				// Return
				case 2: menu_level = 0; break;
			}
		break;
		case 2:
			switch(item_selected_index)
			{
				// Yes
				case 0: game_end(); break;
				// No
				case 1: menu_level = 0;  break;
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