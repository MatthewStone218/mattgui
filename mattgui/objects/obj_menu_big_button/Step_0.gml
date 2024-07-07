/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

if(obj_menu_list.image_alpha == 0)
{
	if(mouse_check_button(mb_left) and position_meeting(mouse_x,mouse_y,id))
	{
		with(obj_menu_list_element)
		{
			image_alpha = 1;
		}
		
		with(obj_menu)
		{
			gui_1.set_activation(false);
			gui_2.set_activation(true);
			gui_2.set_position();
		}
	}
}