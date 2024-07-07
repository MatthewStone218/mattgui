// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function mattgui(parent){
	return new __mattgui_class__(parent);
}

function __mattgui_class__(parent) constructor
{
	array_push(global.__mattgui_objects__,self);
	
	__parent__ = parent;
	
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
				case "left": _x += sprite_xoffset; break;
				case "center": _x += sprite_xoffset-(bbox_right-bbox_left)/2; break;
				case "right": _x += sprite_xoffset-(bbox_right-bbox_left); break;
				case "origin": break;
				
				default: show_message("wrong halign element!") break;
			}
			
			switch(__valign__)
			{
				case "top": _x += sprite_yoffset; break;
				case "middle": _x += sprite_yoffset-(bbox_bottom-bbox_top)/2; break;
				case "bottom": _x += sprite_yoffset-(bbox_bottom-bbox_top); break;
				case "origin": break;
				
				default: show_message("wrong valign element!") break;
			}
			
			x = _x;
			y = _y;
			
			if(__round_pos__){x = round(x); y = round(y);}
		}
		else
		{
			if(__no_parent_action__ == "die"){instance_destroy();}
		}
	}
}



global.__mattgui_objects__ = [];