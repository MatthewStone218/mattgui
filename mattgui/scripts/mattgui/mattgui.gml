// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function mattgui(struct = -1, parent = -1){
	return new __mattgui_node__(parent,struct);
}

function __mattgui_node__(parent, struct) constructor
{
	self.parent = parent;
	
	if(parent != -1)
	{
		array_push(parent.children,self);
	}

	active = true;
	__rect_in__ = undefined;
	__rect_out__ = undefined;
	left = undefined;
	right = undefined;
	top = undefined;
	bottom = undefined;
	width = undefined;
	height = undefined;
	padding = {left: undefined, right: undefined, top: undefined, bottom: undefined};
	offset_x = 0;
	offset_y = 0;
	
	prev_vals =
	{
		left: left,
		right: right,
		top: top,
		bottom: bottom,
		width: width,
		height: height,
		padding_left: padding.left,
		padding_right: padding.right,
		padding_top: padding.top,
		padding_bottom: padding.bottom,
		offset_x: offset_x,
		offset_y: offset_y,
	}
	
	children = [];
	
	var _names = struct_get_names(struct);
	for(var i = 0; i < array_length(_names); i++)
	{
		variable_struct_set(self,_names[i],struct[$ _names[i]]);
	}
	
	static set_values = function(x1, y1, x2, y2, _left, _right, _top, _bottom, _width, _height)
	{
		if(!active){
			return;
		}
		if(parent == -1)
		{
			show_error($"MattGUI: Root node can't use set_values.",true);
		}
		
		if(_left[0])
		{
			if(_left[1])
			{
				left = string(100*(x1-parent.__rect_in__.left)/parent.__rect_in__.width)+"%";
			}
			else
			{
				left = x1-parent.__rect_in__.left;
			}
		}
		
		if(_right[0])
		{
			if(_right[1])
			{
				right = string(100*(parent.__rect_in__.right - x2)/parent.__rect_in__.width)+"%";
			}
			else
			{
				right = parent.__rect_in__.right - x2;
			}
		}
		
		if(_top[0])
		{
			if(_top[1])
			{
				top = string(100*(y1-parent.__rect_in__.top)/parent.__rect_in__.height)+"%";
			}
			else
			{
				top = y1-parent.__rect_in__.bottom;
			}
		}
		
		if(_bottom[0])
		{
			if(_bottom[1])
			{
				bottom = string(100*(parent.__rect_in__.bottom - y2)/parent.__rect_in__.height)+"%";
			}
			else
			{
				bottom = parent.__rect_in__.bottom - y2;
			}
		}
		
		if(_width[0])
		{
			if(_width[1])
			{
				width = string(100*(x2-x1)/parent.__rect_in__.width)+"%";
			}
			else
			{
				width = x2-x1;
			}
		}
		
		if(_height[0])
		{
			if(_height[1])
			{
				height = string(100*(y2-y1)/parent.__rect_in__.height)+"%";
			}
			else
			{
				height = y2-y1;
			}
		}
	}
	
	static calculate = function(calculate_chindren = true, calculate_all = true)
	{
		if(!active){
			return;
		}
		if(calculate_all or prev_vals.left != left or prev_vals.right != right or prev_vals.top != top or prev_vals.bottom != bottom or prev_vals.width != width or prev_vals.height != height or prev_vals.padding_left != padding.left or prev_vals.padding_right != padding.right or prev_vals.padding_top != padding.top or prev_vals.padding_bottom != padding.bottom or prev_vals.offset_x != offset_x or prev_vals.offset_y != offset_y)
		{
			if(parent == -1)
			{
				if(is_undefined(left) or is_undefined(top))
				{
					show_error($"MattGUI: You need to set left and top for the root node.", true);
				}
			
				if(is_undefined(width) or is_undefined(height))
				{
					show_error($"MattGUI: You need to set width and height for the root node.", true);
				}
			
				if(is_string(left) or is_string(top))
				{
					show_error($"MattGUI: You can't set the left/top value of root node as string", true);
				}
			
				if(is_string(width) or is_string(width))
				{
					show_error($"MattGUI: You can't set the width/height of root node as string", true);
				}
			
				__rect_out__ = {};
				__rect_in__ = {};

				__rect_out__.left = left;
				__rect_out__.right = left+width;

				__rect_out__.top = top;
				__rect_out__.bottom = top+height;
			
				__rect_out__.width = __rect_out__.right-__rect_out__.left;
				__rect_out__.height = __rect_out__.bottom-__rect_out__.top;
			
				var _offset_x = -(is_real(offset_x) ? offset_x : __rect_out__.width*percent_to_real(offset_x)/100);
				var _offset_y = -(is_real(offset_y) ? offset_y : __rect_out__.height*percent_to_real(offset_y)/100);
			
				__rect_out__.left += _offset_x;
				__rect_out__.right += _offset_x;
				__rect_out__.top += _offset_y;
				__rect_out__.bottom += _offset_y;
			
				__rect_in__ =
				{
					left: (!is_undefined(padding.left)) ? __rect_out__.left + padding.left : __rect_out__.left,
					top: (!is_undefined(padding.top)) ? __rect_out__.top + padding.top : __rect_out__.top,
					right: (!is_undefined(padding.right)) ? __rect_out__.right - padding.right : __rect_out__.right,
					bottom: (!is_undefined(padding.bottom)) ? __rect_out__.bottom - padding.bottom : __rect_out__.bottom,
				}
			
				__rect_in__.width = __rect_in__.right-__rect_in__.left;
				__rect_in__.height = __rect_in__.bottom-__rect_in__.top;
			}
			else
			{
				if(!is_undefined(left) && !is_undefined(right) && !is_undefined(width))
				{
					show_error($"MattGUI: You set left, right and width. It would make contradiction.", true);
				}
			
				if(!is_undefined(top) && !is_undefined(bottom) && !is_undefined(height))
				{
					show_error($"MattGUI: You set top, bottom and height. It would make contradiction.", true);
				}
			
				if(!is_undefined(left) + !is_undefined(right) + !is_undefined(width) == 1)
				{
					show_error($"MattGUI: You set only one of left, right and width. Needs more value to calculate.", true);
				}
			
				if(!is_undefined(top) + !is_undefined(bottom) + !is_undefined(height) == 1)
				{
					show_error($"MattGUI: You set only one of top, bottom and height. Needs more value to calculate.", true);
				}
			
				if(!is_undefined(left) + !is_undefined(right) + !is_undefined(width) == 1)
				{
					show_error($"MattGUI: You didn't set left, right and width. Needs more value to calculate.", true);
				}
			
				if(!is_undefined(top) + !is_undefined(bottom) + !is_undefined(height) == 1)
				{
					show_error($"MattGUI: You didn't set top, bottom and height. Needs more value to calculate.", true);
				}
			
				__rect_out__ = {};
				__rect_in__ = {};
			
				if(!is_undefined(left))
				{
					__rect_out__.left = parent.__rect_in__.left + (is_real(left) ? left : (parent.__rect_in__.width*percent_to_real(left)/100));
					
					if(!is_undefined(right))
					{
						__rect_out__.right = parent.__rect_in__.right - (is_real(right) ? right : (parent.__rect_in__.width*percent_to_real(right)/100));
					}
					else
					{
						__rect_out__.right = __rect_out__.left + (is_real(width) ? width : (parent.__rect_in__.width*percent_to_real(width)/100));
					}
				}
				else if(!is_undefined(right))
				{
					__rect_out__.right = parent.__rect_in__.right - (is_real(right) ? right : (parent.__rect_in__.width*percent_to_real(right)/100));
					__rect_out__.left = __rect_out__.right - (is_real(width) ? width : (parent.__rect_in__.width*percent_to_real(width)/100));
				}
			
				if(!is_undefined(top))
				{
					__rect_out__.top = parent.__rect_in__.top + (is_real(top) ? top : (parent.__rect_in__.height*percent_to_real(top)/100));
					
					if(!is_undefined(bottom))
					{
						__rect_out__.bottom = parent.__rect_in__.bottom - (is_real(bottom) ? bottom : (parent.__rect_in__.height*percent_to_real(bottom)/100));
					}
					else
					{
						__rect_out__.bottom = __rect_out__.top + (is_real(height) ? height : (parent.__rect_in__.height*percent_to_real(height)/100));
					}
				}
				else if(!is_undefined(bottom))
				{
					__rect_out__.bottom = parent.__rect_in__.bottom - (is_real(bottom) ? bottom : (parent.__rect_in__.height*percent_to_real(bottom)/100));
					__rect_out__.top = __rect_out__.bottom - (is_real(height) ? height : (parent.__rect_in__.height*percent_to_real(height)/100));
				}
			
				__rect_out__.width = __rect_out__.right-__rect_out__.left;
				__rect_out__.height = __rect_out__.bottom-__rect_out__.top;
			
				var _offset_x = -(is_real(offset_x) ? offset_x : __rect_out__.width*percent_to_real(offset_x)/100);
				var _offset_y = -(is_real(offset_y) ? offset_y : __rect_out__.height*percent_to_real(offset_y)/100);
			
				__rect_out__.left += _offset_x;
				__rect_out__.right += _offset_x;
				__rect_out__.top += _offset_y;
				__rect_out__.bottom += _offset_y;
				
				__rect_in__ =
				{
					left: (!is_undefined(padding.left)) ? __rect_out__.left + padding.left : __rect_out__.left,
					top: (!is_undefined(padding.top)) ? __rect_out__.top + padding.top : __rect_out__.top,
					right: (!is_undefined(padding.right)) ? __rect_out__.right - padding.right : __rect_out__.right,
					bottom: (!is_undefined(padding.bottom)) ? __rect_out__.bottom - padding.bottom : __rect_out__.bottom,
				}
			
				__rect_in__.width = __rect_in__.right-__rect_in__.left;
				__rect_in__.height = __rect_in__.bottom-__rect_in__.top;
			}
		
			prev_vals =
			{
				left: left,
				right: right,
				top: top,
				bottom: bottom,
				width: width,
				height: height,
				padding_left: padding.left,
				padding_right: padding.right,
				padding_top: padding.top,
				padding_bottom: padding.bottom,
				offset_x: offset_x,
				offset_y: offset_y,
			}
		
			if(calculate_chindren)
			{
				for(var i = 0; i < array_length(children); i++)
				{
					children[i].calculate();
				}
			}
		}
		else
		{
			if(calculate_chindren)
			{
				for(var i = 0; i < array_length(children); i++)
				{
					children[i].calculate(true, false);
				}
			}
		}
	};
	
	static clean = function()
	{
		__rect_in__ = undefined;
		__rect_out__ = undefined;
		left = undefined;
		right = undefined;
		top = undefined;
		bottom = undefined;
		width = undefined;
		height = undefined;
		padding = {left: undefined, right: undefined, top: undefined, bottom: undefined};
		offset = {x: 0, y: 0};
	}
	
	static get_calculated_values = function(absolute = true)
	{
		if(!is_undefined(__rect_out__))
		{
			if(absolute or parent == -1)
			{
				return __rect_out__;
			}
			else
			{
				return {
					left: __rect_out__.left - parent.__rect_out__.left,
					right: parent.__rect_out__.right - __rect_out__.right,
					top: __rect_out__.top - parent.__rect_out__.top,
					bottom: parent.__rect_out__.bottom - __rect_out__.bottom,
				};
			}
		}
		else
		{
			show_message("You need to calculate the gui element before use it.");
		}
	};
	
	static get_calculated_left = function(absolute = true){
		if(!is_undefined(__rect_out__)){
			if(absolute or parent == -1){
				return __rect_out__.left;
			} else {
				return __rect_out__.left - parent.__rect_out__.left;
			}
		} else {
			show_message("You need to calculate the gui element before use it.");
		}
	}
	static get_calculated_right = function(absolute = true){
		if(!is_undefined(__rect_out__)){
			if(absolute or parent == -1){
				return __rect_out__.right;
			} else {
				return parent.__rect_out__.right - __rect_out__.right;
			}
		} else {
			show_message("You need to calculate the gui element before use it.");
		}
	}
	static get_calculated_top = function(absolute = true){
		if(!is_undefined(__rect_out__)){
			if(absolute or parent == -1){
				return __rect_out__.top;
			} else {
				return parent.__rect_out__.top - __rect_out__.top;
			}
		} else {
			show_message("You need to calculate the gui element before use it.");
		}
	}
	static get_calculated_bottom = function(absolute = true){
		if(!is_undefined(__rect_out__)){
			if(absolute or parent == -1){
				return __rect_out__.bottom;
			} else {
				return parent.__rect_out__.bottom - __rect_out__.bottom;
			}
		} else {
			show_message("You need to calculate the gui element before use it.");
		}
	}
	static is_active = function(){
		return self.active;
	}
	static activate = function(){
		self.active = true;
	}
	static deactivate = function(){
		self.active = false;
	}
	static get_calculated_width = function(absolute = true){
		return get_calculated_right()-get_calculated_left();
	}
	static get_calculated_height = function(absolute = true){
		return get_calculated_bottom()-get_calculated_top();
	}
	static get_left = function(){
		return left;
	}
	static get_right = function(){
		return right;
	}
	static get_top = function(){
		return top;
	}
	static get_bottom = function(){
		return bottom;
	}
	static get_width = function(){
		return width;
	}
	static get_height = function(){
		return height;
	}
	static get_offset_x = function(){
		return offset_x;
	}
	static get_offset_y = function(){
		return offset_y;
	}
	static get_padding_left = function(){
		return padding_left;
	}
	static get_padding_right = function(){
		return padding_right;
	}
	static get_padding_top = function(){
		return padding_top;
	}
	static get_padding_bottom = function(){
		return padding_bottom;
	}
	
	static set_left = function(left){
		self.left = left;
	}
	static set_right = function(right){
		self.right = right;
	}
	static set_top = function(top){
		self.top = top;
	}
	static set_bottom = function(bottom){
		self.bottom = bottom;
	}
	static set_width = function(width){
		self.width = width;
	}
	static set_height = function(height){
		self.height = height;
	}
	static set_offset_x = function(offset_x){
		self.offset_x = offset_x;
	}
	static set_offset_y = function(offset_y){
		self.offset_y = offset_y;
	}
	static set_padding_left = function(padding_left){
		self.padding_left = padding_left;
	}
	static set_padding_right = function(padding_right){
		self.padding_right = padding_right;
	}
	static set_padding_top = function(padding_top){
		self.padding_top = padding_top;
	}
	static set_padding_bottom = function(padding_bottom){
		self.padding_bottom = padding_bottom;
	}
	
	static destroy = function(destroy_children = true)
	{
		if(destroy_children)
		{
			while(array_length(children) > 0)
			{
				children[0].destroy();
			}
		}
		
		if(parent != -1)
		{
			array_delete(parent.children,array_get_index(parent.children,self),1);
			parent = -1;
		}
	};
}