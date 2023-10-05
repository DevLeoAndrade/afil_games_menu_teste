var _string_volume = "Music Volume";

draw_set_color(current_color);
draw_text(x - (string_height(_string_volume) * 1.2) - space, y, _string_volume);

draw_sprite(sprite_index, image_index, x, y);

var _handle_value = current_value / max_value;
var _handle_pos_x = x + (sprite_width * _handle_value);

draw_sprite(spr_handle, is_being_dragged, _handle_pos_x, y);

draw_set_font(fnt_menu);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text((x + sprite_width) + space, y, int64(current_value));

draw_set_color(c_white);