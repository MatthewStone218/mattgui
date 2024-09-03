/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
show_debug_overlay(true);

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
	
	for(var ii = 0; ii < 3; ii++)
	{
		var _gui = mattgui({
			left: string((100*ii/3)+100/6)+"%",
			top: "50%",
			width: 40,
			height: 40,
			offset:
			{
				x: "50%",
				y: "50%"
			}
		}
		,
		left_slot_gui[i]
		);
		instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});
	}
}

right_gui = mattgui({
	right: 0,
	bottom: 0,
	width: "35%",
	height: "35%"
}
,
root_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: right_gui});

for(var i = 0; i < 3; i++)
{
	right_gui_inner = mattgui({
		left: "10%",
		right: "10%",
		top: string(10+(80/3)*i) +"%",
		height: string(80/3)+"%"
	}
	,
	right_gui
	);
	instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: right_gui_inner});
}

right_up_gui = mattgui({
	right: 20,
	top: 20,
	width: 100,
	height: 100
}
,
root_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: right_up_gui});


top_gui = mattgui({
	left: "50%",
	top: 0,
	width: 100,
	height: 50,
	offset:{x: "50%", y:0}
}
,
root_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: top_gui});