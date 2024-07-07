/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

gui_1 = mattgui()
.set_move_func(function(xx,yy){
	x += (xx-x)/3;
	y += (yy-y)/3;
});

gui_2 = mattgui(obj_menu_list)
.set_align_to_parent("left","bottom")
.set_align("right","bottom")
.set_move_func(function(xx,yy){
	x += (xx-x)/3;
	y += (yy-y)/3;
});