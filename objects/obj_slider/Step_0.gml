if(is_being_dragged)
{
	if(mouse_x > x)
	{
		var _x = abs(x - mouse_x);
		var _value = _x / sprite_width;
		
		_value = clamp(_value, 0, 1);
		current_value = _value * max_value;
	}
	else
	{
		current_value = 0;
	}
}