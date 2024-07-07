/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

gui_1 = mattgui();

gui_2 = mattgui(obj_menu_list)
.set_align_to_parent("left","bottom")
.set_align("right","bottom");

if(obj_menu_list.image_alpha == 1)
{
	gui_1.set_activation(false);
	gui_2.set_activation(true);
}