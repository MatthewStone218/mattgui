/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(mouse_check_button(mb_left))
{
	root_gui.width += root_gui.left-mouse_x;
	root_gui.height += root_gui.top-mouse_y;
	root_gui.left = mouse_x;
	root_gui.top = mouse_y;
}

if(mouse_check_button(mb_right))
{
	root_gui.width = mouse_x-root_gui.left;
	root_gui.height = mouse_y-root_gui.top;
}