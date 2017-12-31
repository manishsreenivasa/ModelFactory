return {
metadata = {
	 {scaling_used = {"Box15kg_3D"},
	 subject_age = {30.0},
	 subject_height = {1.70},
	 subject_weight = {80.00},
	 subject_gender = {"male"},
	 subject_pelvisWidth = {0.2400},
	 subject_hipCenterWidth = {0.1700},
	 subject_shoulderCenterWidth = {0.4000},
	 subject_heelAnkleXOffset = {0.0800},
	 subject_heelAnkleZOffset = {0.0900},
	 subject_shoulderNeckZOffset = {0.0700},
	 subject_footWidth = {0.0900},
	},
},
gravity = { 0, 0, -9.81,},
configuration = {
	axis_front = { 1, 0, 0,},
	axis_right = { 0, -1, 0,},
	axis_up = { 0, 0, 1,},
},
points = {
	{name = "BoxAttach_L", body = "Box", point = {0.000000, 0.210000, 0.060000,},},
	{name = "BoxAttach_R", body = "Box", point = {0.000000, -0.210000, 0.060000,},},
	{name = "BoxBottom", body = "Box", point = {0.000000, 0.000000, -0.060000,},},
	{name = "BoxBottomLeftBack", body = "Box", point = {-0.120000, 0.138000, -0.060000,},},
},
constraint_sets = {
},
frames = {
	{name   = "Box",
	parent = "ROOT",
	joint_frame = {
		r = 	{ 0.000000, 0.000000, 0.000000,},
		E = 
			{{ 1.000000, 0.000000, 0.000000,},
			{ 0.000000, 1.000000, 0.000000,},
			{ 0.000000, 0.000000, 1.000000,},},
	},
	body = {
		mass   = 6.839995,
		com = 	{ -0.000000, -0.000000, 0.000000,},
		inertia = 
			{{ 0.054506, -0.000000, 0.000000,},
			{ -0.000000, 0.043833, -0.000000,},
			{ 0.000000, -0.000000, 0.081923,},},
	},
	joint = 
		{{ 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000,},
		{ 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000,},
		{ 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000,},
		{ 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 0.000000,},
		{ 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000,},
		{ 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000,},},
	markers = {},
	visuals = {{
		src         = "unit_cube.obj",
		dimensions  = 	{ 0.250000, 0.285000, 0.120000,},
		mesh_center = 	{ 0.000000, 0.000000, 0.000000,},
		color       = 	{ 0.250000, 0.250000, 0.250000,},
		},},
	},
	},
}