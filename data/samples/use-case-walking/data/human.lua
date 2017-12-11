return {
  configuration = {
    axis_front = { 1, 0, 0,},
    axis_right = { 0, -1, 0,},
    axis_up = { 0, 0, 1,},
  },
  constraint_sets = {
	 FootRightFlat = {
	{point = "Heel_Medial_R", normal = {1, 0, 0,},},
	{point = "Heel_Medial_R", normal = {0, 1, 0,},},
	{point = "Heel_Medial_R", normal = {0, 0, 1,},},
	{point = "Heel_Lateral_R", normal = {1, 0, 0,},},
	{point = "Heel_Lateral_R", normal = {0, 1, 0,},},
	{point = "Heel_Lateral_R", normal = {0, 0, 1,},},
	{point = "Toe_R", normal = {0, 1, 0,},},
	{point = "Toe_R", normal = {0, 0, 1,},},
	},
	 RightToe = {
	{point = "Toe_R", normal = {1, 0, 0,},},
	{point = "Toe_R", normal = {0, 1, 0,},},
	{point = "Toe_R", normal = {0, 0, 1,},},
	},
	 RightToeLeftHeel = {
	{point = "Toe_R", normal = {1, 0, 0,},},
	{point = "Toe_R", normal = {0, 1, 0,},},
	{point = "Toe_R", normal = {0, 0, 1,},},
	{point = "Heel_Medial_L", normal = {1, 0, 0,},},
	{point = "Heel_Medial_L", normal = {0, 1, 0,},},
	{point = "Heel_Medial_L", normal = {0, 0, 1,},},
	{point = "Heel_Lateral_L", normal = {1, 0, 0,},},
	{point = "Heel_Lateral_L", normal = {0, 1, 0,},},
	{point = "Heel_Lateral_L", normal = {0, 0, 1,},},
	},
	 RightToeLeftFlat = {
	{point = "Toe_R", normal = {1, 0, 0,},},
	{point = "Toe_R", normal = {0, 1, 0,},},
	{point = "Toe_R", normal = {0, 0, 1,},},
	{point = "Heel_Medial_L", normal = {1, 0, 0,},},
	{point = "Heel_Medial_L", normal = {0, 1, 0,},},
	{point = "Heel_Medial_L", normal = {0, 0, 1,},},
	{point = "Heel_Lateral_L", normal = {1, 0, 0,},},
	{point = "Heel_Lateral_L", normal = {0, 1, 0,},},
	{point = "Heel_Lateral_L", normal = {0, 0, 1,},},
	{point = "Toe_L", normal = {0, 1, 0,},},
	{point = "Toe_L", normal = {0, 0, 1,},},
	},
	 FootLeftFlat = {
	{point = "Heel_Medial_L", normal = {1, 0, 0,},},
	{point = "Heel_Medial_L", normal = {0, 1, 0,},},
	{point = "Heel_Medial_L", normal = {0, 0, 1,},},
	{point = "Heel_Lateral_L", normal = {1, 0, 0,},},
	{point = "Heel_Lateral_L", normal = {0, 1, 0,},},
	{point = "Heel_Lateral_L", normal = {0, 0, 1,},},
	{point = "Toe_L", normal = {0, 1, 0,},},
	{point = "Toe_L", normal = {0, 0, 1,},},
	},
	 LeftToe = {
	{point = "Toe_L", normal = {1, 0, 0,},},
	{point = "Toe_L", normal = {0, 1, 0,},},
	{point = "Toe_L", normal = {0, 0, 1,},},
	},
	 LeftToeRightHeel = {
	{point = "Toe_L", normal = {1, 0, 0,},},
	{point = "Toe_L", normal = {0, 1, 0,},},
	{point = "Toe_L", normal = {0, 0, 1,},},
	{point = "Heel_Medial_R", normal = {1, 0, 0,},},
	{point = "Heel_Medial_R", normal = {0, 1, 0,},},
	{point = "Heel_Medial_R", normal = {0, 0, 1,},},
	{point = "Heel_Lateral_R", normal = {1, 0, 0,},},
	{point = "Heel_Lateral_R", normal = {0, 1, 0,},},
	{point = "Heel_Lateral_R", normal = {0, 0, 1,},},
	},
	 LeftToeRightFlat = {
	{point = "Toe_L", normal = {1, 0, 0,},},
	{point = "Toe_L", normal = {0, 1, 0,},},
	{point = "Toe_L", normal = {0, 0, 1,},},
	{point = "Heel_Medial_R", normal = {1, 0, 0,},},
	{point = "Heel_Medial_R", normal = {0, 1, 0,},},
	{point = "Heel_Medial_R", normal = {0, 0, 1,},},
	{point = "Heel_Lateral_R", normal = {1, 0, 0,},},
	{point = "Heel_Lateral_R", normal = {0, 1, 0,},},
	{point = "Heel_Lateral_R", normal = {0, 0, 1,},},
	{point = "Toe_R", normal = {0, 1, 0,},},
	{point = "Toe_R", normal = {0, 0, 1,},},
	},
},
  frames = {
    {
      body = {
        com = { 0, 0, 0.089279,},
        inertia = {
          { 0.039717, 0, 0,},
          { 0, 0.034234, 0,},
          { 0, 0, 0.041761,},
        },
        mass = 6.8585,
      },
      joint = {
        { 0, 0, 0, 1, 0, 0,},
        { 0, 0, 0, 0, 0, 1,},
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, 0,},
      },
      markers = {
        LASI = { 0.080207496881485, 0.17409063875675, 0.09068151563406,},
        RASI = { 0.060644127428532, -0.064818859100342, 0.07122191041708,},
        SACR = { -0.097074590623379, 0.071472689509392, 0.10430230200291,},
      },
      name = "Pelvis_Sagittal",
      parent = "ROOT",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.24, 0.3, 0.26362,},
          mesh_center = { 0, 0, 0.043937,},
          src = "pelvis.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.128883,},
        inertia = {
          { 0.140924, 0, 0,},
          { 0, 0.137131, 0,},
          { 0, 0, 0.027162,},
        },
        mass = 8.129,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, -0.085, 0,},
      },
      markers = {
        RTHI = { -0.001928849495016, -0.011199534870684, -0.21751546859741,},
      },
      name = "ThighR_Sagittal",
      parent = "Pelvis_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.178409, 0.142727, 0.428182,},
          mesh_center = { 0, 0, -0.178409,},
          src = "thighR.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.184828,},
        inertia = {
          { 0.034016, 0, 0,},
          { 0, 0.033005, 0,},
          { 0, 0, 0.004039,},
        },
        mass = 2.6455,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.356818,},
      },
      markers = {
        RTIB = { 0.012278055772185, -0.023042879998684, -0.2375058978796,},
      },
      name = "ShankR_Sagittal",
      parent = "ThighR_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.127409, 0.127409, 0.509636,},
          mesh_center = { 0, 0, -0.212348,},
          src = "shankR.obj",
        },
      },
    },
    {
      body = {
        com = { 0.008735, 0, -0.045,},
        inertia = {
          { 0.0031, 0, 0,},
          { 0, 0.002699, 0,},
          { 0, 0, 0.00067,},
        },
        mass = 0.7095,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.424696,},
      },
      markers = {
        RTOE = { 0.14538286626339, 0.085545428097248, -0.03123315051198,},
      },
      name = "FootR_Sagittal",
      parent = "ShankR_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.221063, 0.09, 0.09,},
          mesh_center = { 0.030531, 0, -0.045,},
          src = "footR.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.128883,},
        inertia = {
          { 0.140924, 0, 0,},
          { 0, 0.137131, 0,},
          { 0, 0, 0.027162,},
        },
        mass = 8.129,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0.085, 0,},
      },
      markers = {
        LTHI = { 0.005092915147543, 0.13126994669437, -0.22719399631023,},
      },
      name = "ThighL_Sagittal",
      parent = "Pelvis_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.178409, 0.142727, 0.428182,},
          mesh_center = { 0, 0, -0.178409,},
          src = "thighL.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.184828,},
        inertia = {
          { 0.034016, 0, 0,},
          { 0, 0.033005, 0,},
          { 0, 0, 0.004039,},
        },
        mass = 2.6455,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.356818,},
      },
      markers = {
        LTIB = { 0.08341971039772, 0.14465835690498, -0.20331862568855,},
      },
      name = "ShankL_Sagittal",
      parent = "ThighL_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.127409, 0.127409, 0.509636,},
          mesh_center = { 0, 0, -0.212348,},
          src = "shankL.obj",
        },
      },
    },
    {
      body = {
        com = { 0.008735, 0, -0.045,},
        inertia = {
          { 0.0031, 0, 0,},
          { 0, 0.002699, 0,},
          { 0, 0, 0.00067,},
        },
        mass = 0.7095,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.424696,},
      },
      markers = {
        LHEE = { 0.096803553402424, 0.016856923699379, -0.084032855927944,},
      },
      name = "FootL_Sagittal",
      parent = "ShankL_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.221063, 0.09, 0.09,},
          mesh_center = { 0.030531, 0, -0.045,},
          src = "footL.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, 0.109097,},
        inertia = {
          { 0.0597, 0, 0,},
          { 0, 0.039903, 0,},
          { 0, 0, 0.05484,},
        },
        mass = 8.0575,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, 0.175746,},
      },
      markers = {
        CLAV = { 0.062055125832558, 0.076309472322464, 0.29743674397469,},
      },
      name = "MiddleTrunk_Sagittal",
      parent = "Pelvis_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.216, 0.264, 0.298188,},
          mesh_center = { 0, 0, 0.049698,},
          src = "middleTrunk.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, 0.109282,},
        inertia = {
          { 0.08994, 0, 0,},
          { 0, 0.040836, 0,},
          { 0, 0, 0.083497,},
        },
        mass = 8.4975,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, 0.198792,},
      },
      markers = {
        C7 = { -0.074412472546101, 0.0741902962327, 0.16786298155785,},
      },
      name = "UpperTrunk_Sagittal",
      parent = "MiddleTrunk_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.21, 0.4, 0.231811,},
          mesh_center = { 0, 0, 0.088309,},
          src = "upperTrunk.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, 0.121739,},
        inertia = {
          { 0.015025, 0, 0,},
          { 0, 0.017804, 0,},
          { 0, 0, 0.013936,},
        },
        mass = 3.674,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, 0.220772,},
      },
      markers = {},
      name = "Head_Sagittal",
      parent = "UpperTrunk_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.18878, 0.18878, 0.247773,},
          mesh_center = { 0, 0, 0.09439,},
          src = "head.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.153275,},
        inertia = {
          { 0.007691, 0, 0,},
          { 0, 0.006727, 0,},
          { 0, 0, 0.00218,},
        },
        mass = 1.4025,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, -0.2, 0.150772,},
      },
      markers = {},
      name = "UpperArmR_Sagittal",
      parent = "UpperTrunk_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.13319, 0.106552, 0.293017,},
          mesh_center = { 0, 0, -0.13319,},
          src = "upperArmR.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.116675,},
        inertia = {
          { 0.003386, 0, 0,},
          { 0, 0.003283, 0,},
          { 0, 0, 0.000439,},
        },
        mass = 0.759,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.266379,},
      },
      markers = {},
      name = "LowerArmR_Sagittal",
      parent = "UpperArmR_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.102369, 0.076776, 0.281514,},
          mesh_center = { 0, 0, -0.127961,},
          src = "lowerArmR.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.056445,},
        inertia = {
          { 0.000497, 0, 0,},
          { 0, 0.000361, 0,},
          { 0, 0, 0.000198,},
        },
        mass = 0.308,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.255922,},
      },
      markers = {},
      name = "Hand_SagittalR",
      parent = "LowerArmR_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.115295, 0.049412, 0.164708,},
          mesh_center = { 0, 0, -0.082354,},
          src = "handR.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.153275,},
        inertia = {
          { 0.007691, 0, 0,},
          { 0, 0.006727, 0,},
          { 0, 0, 0.00218,},
        },
        mass = 1.4025,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0.2, 0.150772,},
      },
      markers = {},
      name = "UpperArmL_Sagittal",
      parent = "UpperTrunk_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.13319, 0.106552, 0.293017,},
          mesh_center = { 0, 0, -0.13319,},
          src = "upperArmL.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.116675,},
        inertia = {
          { 0.003386, 0, 0,},
          { 0, 0.003283, 0,},
          { 0, 0, 0.000439,},
        },
        mass = 0.759,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.266379,},
      },
      markers = {},
      name = "LowerArmL_Sagittal",
      parent = "UpperArmL_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.102369, 0.076776, 0.281514,},
          mesh_center = { 0, 0, -0.127961,},
          src = "lowerArmL.obj",
        },
      },
    },
    {
      body = {
        com = { 0, 0, -0.056445,},
        inertia = {
          { 0.000497, 0, 0,},
          { 0, 0.000361, 0,},
          { 0, 0, 0.000198,},
        },
        mass = 0.308,
      },
      joint = {
        { 0, 1, 0, 0, 0, 0,},
      },
      joint_frame = {
        E = {
          { 1, 0, 0,},
          { 0, 1, 0,},
          { 0, 0, 1,},
        },
        r = { 0, 0, -0.255922,},
      },
      markers = {},
      name = "Hand_SagittalL",
      parent = "LowerArmL_Sagittal",
      visuals = {
        {
          color = { 0.2, 0.7, 0.3,},
          dimensions = { 0.115295, 0.049412, 0.164708,},
          mesh_center = { 0, 0, -0.082354,},
          src = "handL.obj",
        },
      },
    },
  },
  gravity = { 0, 0, -9.81,},
  metadata = {
    {
      scaling_used = "deLeva1996_segmentedTrunk",
      subject_age = 30,
      subject_footWidth = 0.09,
      subject_gender = "female",
      subject_heelAnkleXOffset = 0.08,
      subject_heelAnkleZOffset = 0.09,
      subject_height = 1.68,
      subject_hipCenterWidth = 0.17,
      subject_pelvisWidth = 0.24,
      subject_shoulderCenterWidth = 0.4,
      subject_shoulderNeckZOffset = 0.07,
      subject_weight = 55,
    },
  },
  points = {
    {
      body = "FootR_Sagittal",
      name = "Heel_Medial_R",
      point = { -0.08, 0.045, -0.09,},
    },
    {
      body = "FootR_Sagittal",
      name = "Heel_Lateral_R",
      point = { -0.08, -0.045, -0.09,},
    },
    {
      body = "FootR_Sagittal",
      name = "Toe_R",
      point = { 0.085797, 0, -0.09,},
    },
    {
      body = "FootL_Sagittal",
      name = "Heel_Medial_L",
      point = { -0.08, -0.045, -0.09,},
    },
    {
      body = "FootL_Sagittal",
      name = "Heel_Lateral_L",
      point = { -0.08, 0.045, -0.09,},
    },
    {
      body = "FootL_Sagittal",
      name = "Toe_L",
      point = { 0.085797, 0, -0.09,},
    },
  },
}
