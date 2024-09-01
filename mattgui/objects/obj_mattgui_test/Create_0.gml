/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

root_gui = mattgui({
	left: 100,
	top: 100,
	width: 1920-200,
	height: 1080-200
});
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: root_gui});

var _gui;

_gui = mattgui({
	left: 0,
	top: 0,
	width: 200,
	height: "100%"
}
,
root_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});