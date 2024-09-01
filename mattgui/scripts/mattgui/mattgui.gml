// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function mattgui(struct = -1, parent = -1){
	return new __mattgui_node__(parent,struct);
}

function __mattgui_node__(parent, struct) constructor
{
	self.parent = parent;
	array_push(parent.children,self);

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
	
	children = [];
	
	var _names = struct_get_names(struct);
	for(var i = 0; i < array_length(_names); i++)
	{
		variable_struct_set(self,_names[i],struct[$ _names[i]]);
	}
	
	static calculate = function(calculate_chindren)
	{
		if(parent == -1)
		{
			if((is_undefined(x) and is_undefined(left)) or (is_undefined(y) and is_undefined(top)))
			{
				show_error($"MattGUI: You need to set (x or left) and (y or top) for the root node.", true);
			}
			
			if(is_undefined(width) or is_undefined(height))
			{
				show_error($"MattGUI: You need to set width and height for the root node.", true);
			}
			
			if(is_string(x) or is_string(y))
			{
				show_error($"MattGUI: You can't set the coordinate of root node as string", true);
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

			if(!is_undefined(x))
			{
				__rect_out__.left = x;
				__rect_out__.right = x+width;
			}
			else
			{
				__rect_out__.left = left;
				__rect_out__.right = left+width;
			}

			if(!is_undefined(y))
			{
				__rect_out__.top = y;
				__rect_out__.bottom = y+height;
			}
			else
			{
				__rect_out__.top = top;
				__rect_out__.bottom = top+bottom;
			}
			
			__rect_out__.width = __rect_out__.right-__rect_out__.left;
			__rect_out__.height = __rect_out__.bottom-__rect_out__.top;
			
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
			if(!is_undefined(x) + !is_undefined(left) + !is_undefined(right) + !is_undefined(width) >= 3)
			{
				show_error($"MattGUI: Too many values(x,left,right,width). It would make contradiction.", true);
			}
			
			__rect_out__ = {};
			__rect_in__ = {};
			
			var _offset_x = -(is_real(offset.x) ? offset.x : width*string_digits(offset.x)/100);
			
			if(!is_undefined(left))
			{
				__rect_out__.left = parent.__rect_in__.left + (is_real(left) ? left : (parent.__rect_in__.width*string_digits(left)/100)) + _offset_x;
					
				if(!is_undefined(right))
				{
					__rect_out__.right = parent.__rect_in__.right - (is_real(right) ? right : (parent.__rect_in__.width*string_digits(right)/100)) + _offset_x;
				}
				else
				{
					__rect_out__.right = parent.__rect_in__.left + (is_real(width) ? width : (parent.__rect_in__.width*string_digits(width)/100));
				}
			}
			else if(!is_undefined(right))
			{
				__rect_out__.right = parent.__rect_in__.right - (is_real(right) ? right : (parent.__rect_in__.width*string_digits(right)/100)) + _offset_x;
				__rect_out__.left = parent.__rect_in__.right - (is_real(width) ? width : (parent.__rect_in__.width*string_digits(width)/100));
			}
			
			var _offset_y = -(is_real(offset.y) ? offset.y : height*string_digits(offset.y)/100);
			
			if(!is_undefined(top))
			{
				__rect_out__.top = parent.__rect_in__.top + (is_real(top) ? top : (parent.__rect_in__.height*string_digits(top)/100)) + _offset_y;
					
				if(!is_undefined(bottom))
				{
					__rect_out__.bottom = parent.__rect_in__.bottom - (is_real(bottom) ? bottom : (parent.__rect_in__.height*string_digits(bottom)/100)) + _offset_y;
				}
				else
				{
					__rect_out__.bottom = parent.__rect_in__.top + (is_real(height) ? height : (parent.__rect_in__.height*string_digits(height)/100));
				}
			}
			else if(!is_undefined(bottom))
			{
				__rect_out__.bottom = parent.__rect_in__.bottom - (is_real(bottom) ? bottom : (parent.__rect_in__.height*string_digits(bottom)/100)) + _offset_y;
				__rect_out__.top = parent.__rect_in__.bottom - (is_real(height) ? height : (parent.__rect_in__.height*string_digits(height)/100));
			}
			
			__rect_out__.width = __rect_out__.right-__rect_out__.left;
			__rect_out__.height = __rect_out__.bottom-__rect_out__.top;
				
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
		
		if(calculate_chindren)
		{
			for(var i = 0; i < array_length(children); i++)
			{
				children[i].calculate();
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
	
	static get_values = function(absolute = true)
	{
		if(!is_undefined(self[$"__rect_out__"]))
		{
			
		}
		else
		{
			show_message("You need to calculate the gui before use it.");
		}
	};
	
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
		}
	};
}