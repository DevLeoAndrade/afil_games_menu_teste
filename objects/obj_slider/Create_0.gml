
_x_fixed = x;

space = 60;

max_value = 100;
current_value = 45;

is_being_dragged = false;

current_color = c_white;

function change_color(_color = "c_white")
{
	current_color = _color;
}

function change_value(_value = 0)
{
	current_value += _value;
	current_value = clamp(current_value, 0, max_value);
}