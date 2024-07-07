// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조

function mattgui(parent){
	return new __mattgui_class__(parent);
}

function __mattgui_class__(parent) constructor
{
	array_push(global.__mattgui_objects__,self);
	
	__parent__ = parent;
	
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
}



global.__mattgui_objects__ = [];