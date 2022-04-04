// BEWARE YE WHO ENTER: this file's a bit of a monster
function draw_text_tagged(_x, _y, _text, _shadow = true){
	if (_shadow){
		gpu_set_fog(true, c_black, 0, 1);
		draw_text_tagged(_x + 2, _y + 2, _text, false);
		gpu_set_fog(false, c_white, 0, 1);
	}
	
	// rotation is a little weird, especially with sprites
	// but it parses fine and draws correctly otherwise, so I consider this a win
	var _parsed = parse_draw_tags(_text);
	var _entries = array_length(_parsed.data);
	
	var _font = draw_get_font();
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	
	var _blend = draw_get_color();
	var _alpha = draw_get_alpha();
	
	var _scale = 1;
	var _angle = 0;
	
	var _w = 0;
	var _h = 0;
	
	for (var i = 0; _entries > i; i ++){
		var _entry = _parsed.data[i];
		
		if (_entry.tag != undefined){
			switch(_entry.tag.func){
				case "x +=":
				case "y +=": break;
				
				case "sprite":{
					_w += lengthdir_x(sprite_get_width(_entry.tag.arg) * _scale, _angle);
					_h += lengthdir_y(sprite_get_height(_entry.tag.arg) * _scale - string_height("A") * _scale, _angle - 90);
					
					break;
				}
				
				case "scale": _scale = _entry.tag.arg; break;
				case "angle": _angle = _entry.tag.arg; break;
				
				default: _entry.tag.func(_entry.tag.arg); break;
			}
		}
		
		if (_entry.str != ""){
			_w += lengthdir_x(string_width(_entry.str) * _scale, _angle);
			_h += lengthdir_y(string_height("A") * string_count("\n", _entry.str) * _scale, _angle);
		}
	}
	
	_scale = 1;
	_angle = 0;
	
	var _tx = _x;
	var _ty = _y;
	var _mx = 0;
	var _my = 0;
	
	for (var i = 0; _entries > i; i ++){
		var _entry = _parsed.data[i];
		
		if (_entry.tag != undefined){
			switch(_entry.tag.func){
				case "x +=": _mx = irandom_range(-_entry.tag.arg, _entry.tag.arg); break;
				case "y +=": _my = irandom_range(-_entry.tag.arg, _entry.tag.arg); break;
				
				case "sprite":{
					draw_sprite_ext(_entry.tag.arg, -1, _tx + _mx, _ty + _my, _scale, _scale, _angle, c_white, 1);
					_tx += (lengthdir_x(sprite_get_width(_entry.tag.arg), _angle) * _scale);
					_ty += (lengthdir_y(sprite_get_height(_entry.tag.arg), _angle) * _scale);
					
					break;
				}
				
				case "scale": _scale = _entry.tag.arg; break;
				case "angle": _angle = _entry.tag.arg; break;
				
				default: _entry.tag.func(_entry.tag.arg); break;
			}
		}
		
		if (_entry.str != ""){
			draw_text_transformed(_tx + _mx, _ty + _my, _entry.str, _scale, _scale, _angle);
			_tx += lengthdir_x(string_width(_entry.str) * _scale, _angle);
			_ty += lengthdir_y(string_width(_entry.str) * _scale, _angle);
		}
	}
	
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	
	draw_set_color(_blend);
	draw_set_alpha(_alpha);
}

function parse_draw_tags(_text){
	var _parser = new DrawTextParser(_text);
	
	var _font = draw_get_font();
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	
	var _blend = draw_get_color();
	var _alpha = draw_get_alpha();
	
	var _data = {
		text: "",
		data: [{
			str: "",
			tag: undefined
		}]
	};
	
	var d = 1;
	
	while (!_parser.is_at_end()){
		if (!_parser.tag()){
			var _tag = array_pop(_parser.data);
			
			if (_tag.reset){
				switch(_tag.op){
					case "xshake":
					case "hshake": _data.data[d ++] = {str: "", tag: {func: "x +=", arg: 0}}; break;
					
					case "yshake":
					case "vshake": _data.data[d ++] = {str: "", tag: {func: "y +=", arg: 0}}; break;
					
					case "font": _data.data[d ++] = {str: "", tag: {func: draw_set_font, arg: _font}}; break;
					
					case "scale": _data.data[d ++] = {str: "", tag: {func: "scale", arg: 1}}; break;
					case "angle": _data.data[d ++] = {str: "", tag: {func: "angle", arg: 0}}; break;
					
					case "color": _data.data[d ++] = {str: "", tag: {func: draw_set_color, arg: _blend}}; break;
					case "alpha": _data.data[d ++] = {str: "", tag: {func: draw_set_alpha, arg: _alpha}}; break;
				}
			}
			
			else{
				switch(_tag.op){
					case "xshake":
					case "hshake": _data.data[d ++] = {str: "", tag: {func: "x +=", arg: _tag.arg}}; break;
					
					case "yshake":
					case "vshake": _data.data[d ++] = {str: "", tag: {func: "y +=", arg: _tag.arg}}; break;
					
					case "sprite": _data.data[d ++] = {str: "", tag: {func: "sprite", arg: _tag.arg}}; break;
					case "font": _data.data[d ++] = {str: "", tag: {func: draw_set_font, arg: _tag.arg}}; break;
					
					case "scale": _data.data[d ++] = {str: "", tag: {func: "scale", arg: _tag.arg}}; break;
					case "angle": _data.data[d ++] = {str: "", tag: {func: "angle", arg: _tag.arg}}; break;
					
					case "color": _data.data[d ++] = {str: "", tag: {func: draw_set_color, arg: _tag.arg}}; break;
					case "alpha": _data.data[d ++] = {str: "", tag: {func: draw_set_alpha, arg: _tag.arg}}; break;
				}
			}
		}
		
		else{
			_data.text += _parser.last;
			_data.data[d - 1].str += _parser.last;
		}
	}
	
	delete _parser;
	
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	
	draw_set_color(_blend);
	draw_set_alpha(_alpha);
	
	return _data;
}

function DrawTextParser(_text) : DataParser(_text) constructor{
	data = [];
	last = "";
	d = 0;
	
	// it's a little ugly
	static tag = function(){
		if (peek() == "<"){
			var _pos = pos;
			
			var _tags = [
				sprite_tag, font_tag,
				xshake_tag, hshake_tag, yshake_tag, vshake_tag,
				color_tag, alpha_tag,
				scale_tag, angle_tag
			];
			
			var tag_count = array_length(_tags);
			
			for (var i = 0; tag_count > i; i ++){
				if (_tags[i]()){
					pos = _pos;
				}
				
				else{
					return false;
				}
			}
		}
		
		last = advance();
		return true;
	}
	
	static sprite_tag = function(){
		return _tag("sprite", identifier, sprite_finalize);
	}
	
	static sprite_finalize = function(_slice){
		var _asset = asset_get_index(_slice);
		
		if (_asset != -1 && sprite_get_name(_asset) == _slice){
			return _asset;
		}
		
		return -1;
	}
	
	static font_tag = function(){
		return _tag("font", identifier, font_finalize);
	}
	
	static font_finalize = function(_slice){
		var _asset = asset_get_index(_slice);
		
		if (_asset != -1 && font_get_name(_asset) == _slice){
			return _asset;
		}
		
		return -1;
	}
	
	static xshake_tag = function(){
		return _tag("xshake", _number, real);
	}
	
	static yshake_tag = function(){
		return _tag("yshake", _number, real);
	}
	
	static hshake_tag = function(){
		return _tag("hshake", _number, real);
	}
	
	static vshake_tag = function(){
		return _tag("vshake", _number, real);
	}
	
	static scale_tag = function(){
		return _tag("scale", _number, real);
	}
	
	static angle_tag = function(){
		return _tag("angle", _number, real);
	}
	
	static alpha_tag = function(){
		return _tag("alpha", _number, real);
	}
	
	static color_tag = function(){
		return _tag("color", color_value, color_finalize);
	}
	
	static color_value = function(){
		var _pos = pos;
		
		if (!identifier()){
			return false;
		}
		
		pos = _pos;
		
		if (!_number()){
			return false;
		}
		
		return true;
	}
	
	static color_finalize = function(_slice){
		switch(_slice){
			case "aqua": return c_aqua;
			case "black": return c_black;
			case "blue": return c_blue;
			
			case "dark grey":
			case "dark gray":
			case "dkgrey":
			case "dkgray": return c_dkgrey;
			
			case "fuchsia": return c_fuchsia;
			
			case "grey":
			case "gray": return c_grey;
			
			case "green": return c_green;
			case "lime": return c_lime;
			
			case "light grey":
			case "light gray":
			case "ltgrey":
			case "ltgray": return c_ltgrey;
			
			case "maroon": return c_maroon;
			case "navy": return c_navy;
			case "olive": return c_olive;
			case "purple": return c_purple;
			case "red": return c_red;
			case "silver": return c_silver;
			case "teal": return c_teal;
			case "white": return c_white;
			case "yellow": return c_yellow;
			case "orange": return c_orange;
			
			default:{
				if (_slice == string_digits(_slice)){
					return real(_slice);
				}
				
				else{
					return hex(_slice);
				}
				
				break;
			}
		}
	}
	
	static hex = function(_substring){
		var _len = string_length(_substring);
		var _hex = 0;
		var d = 0;
		
		for (var i = 1; _len >= i; i ++){
			var _digit = string_char_at(_substring, i);
			
			if (string_digits(_digit) != ""){
				_hex += real(_digit) * power(16, (_len - d ++));
			}
			
			else if (ord(_digit) >= 97 && ord(_digit) <= 102){
				_hex += ((ord(_digit) - 87) * power(16, (_len - d ++)));
			}
		}
		
		return _hex;
	}
	
	static _tag = function(_name, _value, _finalize){
		var _start = pos;
		last = "";
		
		if (!match("<")){
			last += string_copy(text, _start, pos - _start);
			return true;
		}
		
		var _end = (match("/"));
		
		if (d >= array_length(data)){
			data[d ++] = undefined;
		}
		
		skip_space();
		
		var new_tag = undefined;
		
		if (substring(_name)){
			skip_space();
			_start = pos;
			
			if (!_end && _value()){
				last += string_copy(text, _start, pos - _start);
				return true;
			}
			
			new_tag = {op: _name, arg: string_copy(text, _start, pos - _start), reset: _end};
		}
		
		skip_space();
		
		if (!match(">")){
			last += string_copy(text, _start, pos - _start);
			return true;
		}
		
		if (new_tag != undefined){
			if (!_end){
				new_tag.arg = _finalize(new_tag.arg);
			}
			
			data[d - 1] = new_tag;
			return false;
		}
		
		last += string_copy(text, _start, pos - _start);
		return true;
	}
}

function DataParser(_text) : Parser(_text) constructor{
	static _number = function(){
		var _float = (peek() != ".");
		var _pos = pos;
		
		match("-");
		skip_space();
		
		while (!is_at_end()){
			if (string_digits(peek()) != ""){
				advance();
			}
			
			else if (_float && peek() == "."){
				_float = false;
				advance();
			}
			
			else if (pos == _pos && !_float && string_digits(peekNext()) != ""){
				advance();
				advance();
			}
			
			else{
				break;
			}
		}
		
		return (pos <= _pos);
	}
	
	static identifier = function(){
		return _identifier(_alpha, _alphanumeric);
	}
	
	static _identifier = function(_start, _body){
		if (_start(peek()) != ""){
			advance();
			
			while (_body(peek()) != ""){
				advance();
			}
			
			return false;
		}
		
		return true;
	}
	
	static _alpha = function(_substring){
		var _char = string_char_at(_substring, 1);
		var _len = string_length(_substring);
		var _pos = 1;
		
		var _result = "";
		
		while (_len >= _pos){
			if (string_letters(_char) != "" || _char == "_"){
				_result += _char;
			}
			
			_char = string_char_at(_substring, ++_pos);
		}
		
		return _result;
	}
	
	static _alphanumeric = function(_substring){
		var _char = string_char_at(_substring, 1);
		var _len = string_length(_substring);
		var _pos = 1;
		
		var _result = "";
		
		while (_len >= _pos){
			if (string_lettersdigits(_char) != "" || _char == "_"){
				_result += _char;
			}
			
			_char = string_char_at(_substring, ++_pos);
		}
		
		return _result;
	}
}

function Parser(_text) constructor{
	length = string_length(_text);
	text = _text;
	char = "";
	pos = 1;
	
	static is_at_end = function(){
		return (pos > length);
	}
	
	static advance = function(){
		char = string_char_at(text, pos ++);
		return char;
	}
	
	static match = function(_char){
		if (peek() == _char){
			advance();
			return true;
		}
		
		return false;
	}
	
	static peek = function(){
		return string_char_at(text, pos);
	}
	
	static peekNext = function(){
		return string_char_at(text, pos + 1);
	}
	
	static substring = function(_substring){
		var _length = string_length(_substring);
		
		if (string_copy(text, pos, _length) == _substring){
			pos += (_length - 1);
			advance();
			return true;
		}
		
		return false;
	}
	
	static skip_space = function(){
		while ((ord(peek()) >= 9 && ord(peek()) <= 13) || ord(peek()) == 32 || ord(peek()) == 133 || ord(peek()) == 160){
			advance();
		}
	}
}
