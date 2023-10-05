var _gui_width = display_get_width();
var _gui_height = display_get_height();
var _x1 = (_gui_width / 2);
var _y1 = (_gui_height / 2);

// Draw Items
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, (surface_get_height(application_surface) - (surface_get_height(application_surface) * .2)), room_name);

// Find height and width dynamically
height = 2 * string_height(items[0, 0]) + (items_length - 1) * space;
var _width_dynamic = 0;
for(var _i = 0; _i < items_length; _i++)
{
	var _current_with = string_width(items[menu_level, _i])
	_width_dynamic = max(_width_dynamic, _current_with);
}
width = 2 * _width_dynamic;
//

// Center window
x = (surface_get_width(application_surface) / 2);
y = (surface_get_height(application_surface) / 2) - (height / 2);

// Draw Window
if(sprite_index != -1)
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);


var _y_fixed = (y - space);
draw_text_color(x, _y_fixed, titles[menu_level], c_white, c_white, c_white, c_white, 1);

for(var _i = 0; _i < items_length; _i++)
{	
	_y_fixed = (y + space) + (space * _i);
	
	// Mouse collision verification
	var _item_width = string_width(items[menu_level, _i]);
	var _item_height = string_height(items[menu_level, _i]);
	
	// Set selected and default color
	var _c = c_white;
	if(point_in_rectangle(input_mouse_x, input_mouse_y,
										x  - (_item_width / 2), _y_fixed - (_item_height / 2),
										x  + (_item_width / 2), _y_fixed + (_item_height / 2)))
		{
			item_selected_index = _i;
		}
		
	if(item_selected_index == _i) { _c = c_red; }
	
	if(typeof(items[menu_level, _i]) != "ref")
	{	
		var _temp_text = items[menu_level, _i];
		
		if(items[menu_level, _i] == id_item_fullscreen)
		{
			_temp_text = is_full_screen ? (id_item_fullscreen + " On") : (id_item_fullscreen + " Off");
		}
		
		draw_text_color(x, _y_fixed, _temp_text, _c, _c, _c, _c, 1);
	}
	else
	{
		items[menu_level, _i].x = x;
		items[menu_level, _i].y = _y_fixed;
		items[menu_level, _i].change_color(_c);
	}
}