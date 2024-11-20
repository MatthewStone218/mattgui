/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

draw_set_color(c_white);
draw_set_alpha(1);

var _struct = gui.get_calculated_values();

draw_rectangle(_struct.left,_struct.top,_struct.right,_struct.bottom,true);