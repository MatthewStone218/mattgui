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


matt_frame = mattgui({
	left: "5%",
	top: "25%",
	width: "43%",
	height: "50%"
},
root_gui
);
//instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: matt_frame});

gui_frame = mattgui({
	left: "52%",
	top: "25%",
	width: "43%",
	height: "50%"
},
root_gui
);
//instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: gui_frame});


var _gui = mattgui({
	left: 0,
	top: 0,
	width: $"7%",
	bottom: 0
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: $"7%",
	top: $"11%",
	width: $"7%",
	height: "22%"
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: $"14%",
	top: $"33%",
	width: $"7%",
	height: "22%"
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: $"21%",
	top: $"11%",
	width: $"7%",
	height: "22%"
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "28%",
	top: 0,
	width: $"7%",
	bottom: 0
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "42%",
	bottom: 0,
	width: $"21%",
	height: "33%"
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "33%",
	top: "33%",
	width: $"33%",
	height: "33%"
},
_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "63%",
	bottom: 0,
	width: $"7%",
	height: "11%"
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "63%",
	top: "22%",
	right: 0,
	height: "11%"
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "70%",
	top: "11%",
	width: "7%",
	bottom: 0
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "84%",
	top: "11%",
	width: "7%",
	bottom: 0
},
matt_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: 0,
	top: "22%",
	width: "7%",
	bottom: "22%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "7%",
	top: "11%",
	width: "7%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "7%",
	bottom: "11%",
	width: "7%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "14%",
	bottom: 0,
	width: "14%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "14%",
	top: 0,
	width: "14%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "28%",
	top: "11%",
	width: "7%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "28%",
	bottom: "11%",
	width: "7%",
	height: "33%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "21%",
	bottom: "33%",
	width: "21%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "49%",
	bottom: 0,
	width: "21%",
	height: "33%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "33%",
	bottom: "33%",
	right: "33%",
	top: 0
},
_gui
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "70%",
	bottom: 0,
	width: "7%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "88%",
	bottom: 0,
	width: "7%",
	height: "44%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});


var _gui = mattgui({
	left: "88%",
	bottom: "55%",
	width: "7%",
	height: "11%"
},
gui_frame
);
instance_create_depth(0,0,0,obj_mattgui_test_rectangle,{gui: _gui});