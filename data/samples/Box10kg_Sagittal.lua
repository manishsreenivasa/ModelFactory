return {
metadata = {
	 {scaling_used = {"Box10kg_Sagittal"},
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
	 subject_footWidth = {0.0900},},
},
gravity = { 0, 0, -9.81,},
configuration = {
	axis_front = { 1, 0, 0,},
	axis_right = { 0, -1, 0,},
	axis_up = { 0, 0, 1,},
},
points = {
	{name = "BoxAttach_Sagittal", body = "Box10kg", point = {0.000000, 0.000000, 0.030000,},},
	{name = "BoxBottom_Sagittal", body = "Box10kg", point = {0.000000, 0.000000, -0.060000,},},
},
constraint_sets = {
},
frames = {
	{name   = "Box10kg",
	parent = "ROOT",
	joint_frame = {
		r = 	{ 0.000000, 0.000000, 0.000000,},
		E = 
			{{ 1.000000, 0.000000, 0.000000,},
			{ 0.000000, 1.000000, 0.000000,},
			{ 0.000000, 0.000000, 1.000000,},},
	},
	body = {
		mass   = 10.000000,
		com = 	{ 0.000000, 0.000000, 0.000000,},
		inertia = 
			{ 0.156250, 0.000000, 0.000000, 0.000000, 0.001000, 0.000000, 0.000000, 0.000000, 0.036000,},
	},
	joint= 
		{{ 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000,},
		{ 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000,},
		{ 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000,},
		{ 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 0.000000,},
		{ 1.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000,},
		{ 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000,},},
	markers = {},
	visuals = {{
		src         = "unit_cube.obj",
		dimensions  = 	{ 0.250000, 0.020000, 0.120000,},
		mesh_center = 	{ 0.000000, 0.000000, 0.000000,},
		color       = 	{ 0.250000, 0.250000, 0.250000,},
		},},
	},
	},
}