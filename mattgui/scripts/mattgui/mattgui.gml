// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function mattgui(parent, _id = id){
	return new __mattgui_class__(parent,_id);
}

function __mattgui_class__(parent = "none", _self) constructor
{
	array_push(global.__mattgui_objects__,self);
	
	if(parent != "none")
	{
		__parent__ = parent.id;
	}
	else
	{
		__parent__ = parent;
	}
	
	__root_free__ = false;
	
	__parent_xscale_flaxible__ = true;
	__parent_yscale_flaxible__ = true;
	__xscale_flaxible__ = true;
	__yscale_flaxible__ = true;
	__xscale__ = _self.image_xscale;
	__yscale__ = _self.image_yscale;
	
	__activated__ = true;
	
	__self__ = _self;
	
	__round_pos__ = true;
	
	__halign_to_parent__ = "center";
	__valign_to_parent__ = "middle";
	
	__halign__ = "center";
	__valign__ = "middle";
	
	__xoffset__ = 0;
	__yoffset__ = 0;
	
	__no_parent_action__ = "die";
	
	__last_frame__ = global.__mattgui_frame__;
	
	__xx__ = _self.x;
	__yy__ = _self.y;
	
	__xx_first__ = _self.x;
	__yy_first__ = _self.y;
	
	static __pos_function__ = function(xx,yy){x = xx; y = yy;}
	
	static set_activation = function(_bool){__activated__ = _bool; if(__activated__){set_position();} return self;}
	static set_parent = function(parent){
		parent ??= "none";
		if(parent != "none")
		{
			__parent__ = parent.id;
		}
		else
		{
			__parent__ = parent;
		}
		
		return self;
	}
	
	static set_root_pos = function(xx,yy){__xx_first__ = xx; __yy_first__ = yy; return self;}
	static set_align_to_parent = function(halign,valign){__halign_to_parent__ = halign; __valign_to_parent__ = valign; return self;}
	static set_align = function(halign,valign){__halign__ = halign; __valign__ = valign; return self;}
	static set_offset = function(xoffset,yoffset){__xoffset__ = xoffset;__yoffset__ = yoffset; return self;}
	static set_no_parent_action = function(action){__no_parent_action__ = action; return self;}
	static set_round_pos = function(_bool){__round_pos__ = _bool; return self;}
	static set_move_func = function(func){__pos_function__ = func; return self;}
	static set_parent_scale_flaxible = function(_bool1, _bool2){__parent_xscale_flaxible__ = _bool1; __parent_yscale_flaxible__ = _bool2; return self;}
	static set_scale_flaxible = function(_bool1, _bool2){__xscale_flaxible__ = _bool1; __yscale_flaxible__ = _bool2; return self;}
	static set_scale = function(xscale,yscale){__xscale__ = xscale; __yscale__ = yscale; return self;}
	
	static free = function()
	{
		array_delete(global.__mattgui_objects__,array_get_index(global.__mattgui_objects__,self),1);
	}
	
	static set_offset_from_pos = function(xx,yy)
	{
		if(instance_exists(__parent__))
		{
			var _pos = __get_align_pos__();
			
			__xoffset__ = xx-_pos[0];
			__yoffset__ = yy-_pos[1];
		}
		else
		{
			if(__no_parent_action__ == "die"){instance_destroy(__self__);}
		}
		return self;
	}
	
	static set_position = function()
	{
		if(__activated__)
		{
			if(__last_frame__ != global.__mattgui_frame__)
			{
				__last_frame__ = global.__mattgui_frame__;
				__xx__ = __self__.x;
				__yy__ = __self__.y;
			}
		
			__self__.x = __xx__;
			__self__.y = __yy__;
		
			if(__parent__ == "none")
			{
				with(__self__)
				{
					var _func = method(id, other.__pos_function__);
					_func(other.__xx_first__+other.__xoffset__, other.__yy_first__+other.__yoffset__);
				}
				
				for(var i = 0; i < array_length(global.__mattgui_objects__); i++)
				{
					with(global.__mattgui_objects__[i])
					{
						if(__parent__ != "none" and instance_exists(__self__) and instance_exists(__parent__) and instance_exists(other.__self__) and __parent__.id == other.__self__.id)
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
					var _x,_y;
				
					var _pos = __get_align_pos__();
					_x = _pos[0];
					_y = _pos[1];
				
					with(__self__)
					{
						var _func = method(id, other.__pos_function__);
						_func(_x+other.__xoffset__, _y+other.__yoffset__);
					}
			
					if(__round_pos__){__self__.x = round(__self__.x); __self__.y = round(__self__.y);}
			
					for(var i = 0; i < array_length(global.__mattgui_objects__); i++)
					{
						with(global.__mattgui_objects__[i])
						{
							if(__parent__ != "none" and instance_exists(__self__) and instance_exists(__parent__) and instance_exists(other.__self__) and __parent__.id == other.__self__.id)
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
		
		return self;
	}

	static __get_align_pos__ = function()
	{
		var _x,_y;
		switch(__halign_to_parent__)
		{
			case "left": _x = __parent_xscale_flaxible__ ? __parent__.bbox_left : __parent__.x-sprite_get_xoffset(__parent__.sprite_index); break;
			case "center": _x = __parent_xscale_flaxible__ ? (__parent__.bbox_right+__parent__.bbox_left)/2 : (__parent__.x-sprite_get_xoffset(__parent__.sprite_index)+__parent__.x+sprite_get_width(__parent__.sprite_index)-sprite_get_xoffset(__parent__.sprite_index))/2; break;
			case "right": _x = __parent_xscale_flaxible__ ? __parent__.bbox_right : __parent__.x+sprite_get_width(__parent__.sprite_index)-sprite_get_xoffset(__parent__.sprite_index); break;
			case "origin": _x = __parent__.x; break;
				
			default:
				if(is_callable(__halign_to_parent__))
				{
					var _func = method(self,__halign_to_parent__);
					_x = _func(_x);
				}
				else
				{
					show_message("wrong parent_halign element!")
				}
			break;
		}
			
		switch(__valign_to_parent__)
		{
			case "top": _y = __parent_yscale_flaxible__ ? __parent__.bbox_top : __parent__.y-sprite_get_yoffset(__parent__.sprite_index); break;
			case "middle": _y = __parent_yscale_flaxible__ ? (__parent__.bbox_bottom+__parent__.bbox_top)/2 : (__parent__.x-sprite_get_yoffset(__parent__.sprite_index)+__parent__.x+sprite_get_height(__parent__.sprite_index)-sprite_get_yoffset(__parent__.sprite_index))/2; break;
			case "bottom": _y = __parent_xscale_flaxible__ ? __parent__.bbox_bottom : __parent__.y+sprite_get_height(__parent__.sprite_index)-sprite_get_yoffset(__parent__.sprite_index); break;
			case "origin": _y = __parent__.y; break;
				
			default:
				if(is_callable(__valign_to_parent__))
				{
					var _func = method(self,__valign_to_parent__);
					_y = _func(_y);
				}
				else
				{
					show_message("wrong parent_valign element!")
				}
			break;
		}
			
		switch(__halign__)
		{
			case "left": _x += __xscale_flaxible__ ? __self__.sprite_xoffset : sprite_get_xoffset(__self__.sprite_index)*__xscale__; break;
			case "center": _x += __xscale_flaxible__ ? __self__.sprite_xoffset-(__self__.bbox_right-__self__.bbox_left)/2 : (sprite_get_xoffset(__self__.sprite_index) - sprite_get_width(__self__.sprite_index)/2)*__xscale__; break;
			case "right": _x += __xscale_flaxible__ ? __self__.sprite_xoffset-(__self__.bbox_right-__self__.bbox_left) : (sprite_get_xoffset(__self__.sprite_index)-sprite_get_width(__self__.sprite_index))*__xscale__; break;
			case "origin": break;
				
			default:
				if(is_callable(__halign__))
				{
					var _func = method(self,__halign__);
					_x = _func(_x);
				}
				else
				{
					show_message("wrong halign element!")
				}
			break;
		}
			
		switch(__valign__)
		{
			case "top": _y += __yscale_flaxible__ ? __self__.sprite_yoffset : sprite_get_yoffset(__self__.sprite_index)*__yscale__; break;
			case "middle": _y += __yscale_flaxible__ ? __self__.sprite_yoffset-(__self__.bbox_bottom-__self__.bbox_top)/2 : (sprite_get_yoffset(__self__.sprite_index) - sprite_get_width(__self__.sprite_index)/2)*__yscale__; break;
			case "bottom": _y += __yscale_flaxible__ ? __self__.sprite_yoffset-(__self__.bbox_bottom-__self__.bbox_top) : (sprite_get_yoffset(__self__.sprite_index) - sprite_get_width(__self__.sprite_index))*__yscale__; break;
			case "origin": break;
				
			default:
				if(is_callable(__valign__))
				{
					var _func = method(self,__valign__);
					_y = _func(_y);
				}
				else
				{
					show_message("wrong valign element!")
				}
			break;
		}
	
		return [_x,_y];
	}
}



global.__mattgui_frame__ = 0;
global.__mattgui_objects__ = [];

function __mattgui_loop__()
{
	global.__mattgui_frame__++;

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