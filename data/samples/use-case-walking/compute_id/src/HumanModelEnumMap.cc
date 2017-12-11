#include "HumanModelEnumMap.h"

#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

PointMapEntry PointMap[] = {
    { PointHeelMedialR,          "Heel_Medial_R"               },
    { PointHeelMedialL,          "Heel_Medial_L"               },
    { PointHeelLateralR,         "Heel_Lateral_R"               },
    { PointHeelLateralL,         "Heel_Lateral_L"               },
    { PointToeR,                 "Toe_R"                },
    { PointToeL,                 "Toe_L"                },
    { PointNameLast,             "NameLast"                    }
};

PointId getPointIdFromString (const char* point_name_str) {
  unsigned int map_index = 0;

  while (map_index != PointNameLast) {
    if (string(PointMap[map_index].name_str) == string(point_name_str)) {
      break;
    }
    map_index++;
  }

  if (map_index == PointNameLast) {
    cerr << "Warning: could not find mapping for point '" << point_name_str
	 << "'." << endl;
    return PointNameLast;
  }

  return static_cast<PointId>(map_index);
}

ConstraintSetMapEntry ConstraintSetMap[ConstraintSetNameLast + 1] = {
    { CSFootRightFlat,      "FootRightFlat"},
    { CSFootLeftFlat,       "FootLeftFlat"},
    { CSLeftToe,            "LeftToe"},
    { CSLeftToeRightHeel,   "LeftToeRightHeel"},
    { CSLeftToeRightFlat,   "LeftToeRightFlat"},
    { CSHandRight,          "HandRight"},
    { CSHandLeft,           "HandLeft"},
    { ConstraintSetNameLast,"ConstraintSetNameLast"}
};

CSId getConstraintSetIdFromString (const char* constraint_set_name_str) {
  unsigned int map_index = 0;

  while (map_index != ConstraintSetNameLast) {
    if (string(ConstraintSetMap[map_index].name_str) ==
	string(constraint_set_name_str))
      break;

    map_index++;
  }

  if (map_index == ConstraintSetNameLast) {
    cerr << "Warning: could not find mapping for constraint set '" <<
      constraint_set_name_str << "'." << endl;
    return ConstraintSetNameLast;
  }

  return static_cast<CSId>(map_index);
}
