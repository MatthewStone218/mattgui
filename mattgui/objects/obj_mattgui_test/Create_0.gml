/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

root_gui = mattgui({
	left: 100,
	top: 100,
	width: 1920-200,
	height: 1080-200
});
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: root_gui});


left_gui = mattgui({
	left: 0,
	top: 0,
	width: 200,
	height: "100%"
}
,
root_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: left_gui});


left_inner_gui = mattgui({
	left: 10,
	top: 10,
	right: 10,
	bottom: 10
}
,
left_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: left_gui});


for(var i = 0; i < 10; i++)
{
	left_slot_gui[i] = mattgui({
		left: 10,
		top: 10+120*i,
		right: 10,
		height: 100
	}
	,
	left_inner_gui
	);
	instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: left_slot_gui[i]});
}