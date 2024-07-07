// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function mattgui(parent){
	return new __mattgui_class__(parent);
}

function __mattgui_class__(parent = "none", _self = self) constructor
{
	array_push(global.__mattgui_objects__,self);
	
	if(parent != "none")
	{
		__parent__ = parent.id;
	}
	__self__ = _self;
	
	__round_pos__ = true;
	
	__halign_to_parent__ = "center";
	__valign_to_parent__ = "middle";
	
	__halign__ = "center";
	__valign__ = "middle";
	
	__xoffset__ = 0;
	__yoffset__ = 0;
	
	__no_parent_action__ = "die";
	
	function set_parent(parent){__parent__ = parent;}
	function set_align_to_parent(halign,valign){__halign_to_parent__ = halign; __valign_to_parent__ = valign;}
	function set_align(halign,valign){__halign__ = halign; __valign__ = valign;}
	function set_offset(xoffset,yoffset){__xoffset__ = xoffset;__yoffset__ = yoffset;}
	function set_no_parent_action(action){__no_parent_action__ = action;}
	function set_round_pos(_bool){__round_pos__ = _bool;}
	
	function set_position()
	{
		if(__parent__ == "none")
		{
			for(var i = 0; i < array_length(global.__mattgui_objects__); i++)
			{
				with(global.__mattgui_objects__[i])
				{
					if(instance_exists(__self__) and instance_exists(__parent__) and instance_exists(other.__self__) and __parent__.id == other.__self__.id)
					{
						set_position();
					}
				}
			}
		}
		else
		{
			if(instance_exists(__parent__))
			{
				var _x, _y;
			
				switch(__halign_to_parent__)
				{
					case "left": _x = __parent__.bbox_left; break;
					case "center": _x = __parent__.bbox_right-__parent__.bbox_left; break;
					case "right": _x = __parent__.bbox_right; break;
					case "origin": _x = __parent__.x; break;
				
					default: show_message("wrong parent_halign element!") break;
				}
			
				switch(__valign_to_parent__)
				{
					case "top": _y = __parent__.bbox_top; break;
					case "middle": _y = __parent__.bbox_bottom-__parent__.bbox_top; break;
					case "bottom": _y = __parent__.bbox_bottom; break;
					case "origin": _y = __parent__.y; break;
				
					default: show_message("wrong parent_valign element!") break;
				}
			
				switch(__halign__)
				{
					case "left": _x += __self__.sprite_xoffset; break;
					case "center": _x += __self__.sprite_xoffset-(__self__.bbox_right-__self__.bbox_left)/2; break;
					case "right": _x += __self__.sprite_xoffset-(__self__.bbox_right-__self__.bbox_left); break;
					case "origin": break;
				
					default: show_message("wrong halign element!") break;
				}
			
				switch(__valign__)
				{
					case "top": _x += __self__.sprite_yoffset; break;
					case "middle": _x += __self__.sprite_yoffset-(__self__.bbox_bottom-__self__.bbox_top)/2; break;
					case "bottom": _x += __self__.sprite_yoffset-(__self__.bbox_bottom-__self__.bbox_top); break;
					case "origin": break;
				
					default: show_message("wrong valign element!") break;
				}
			
				__self__.x = _x;
				__self__.y = _y;
			
				if(__round_pos__){__self__.x = round(__self__.x); __self__.y = round(__self__.y);}
			
				for(var i = 0; i < array_length(global.__mattgui_objects__); i++)
				{
					with(global.__mattgui_objects__[i])
					{
						if(instance_exists(__self__) and instance_exists(__parent__) and instance_exists(other.__self__) and __parent__.id == other.__self__.id)
						{
							set_position();
						}
					}
				}
			}
			else
			{
				if(__no_parent_action__ == "die"){instance_destroy(__self__);}
			}
		}
	}
}



global.__mattgui_objects__ = [];

function __mattgui_loop__()
{
	for(var i = 0; i < array_length(global.__mattgui_objects__); i++)
	{
		with(global.__mattgui_objects__[i])
		{
			if(!instance_exists(__self__))
			{
				array_delete(global.__mattgui_objects__,i,1);
			}
		}
	}
	
	call_later(1,time_source_units_frames,__mattgui_loop__);
}

__mattgui_loop__();