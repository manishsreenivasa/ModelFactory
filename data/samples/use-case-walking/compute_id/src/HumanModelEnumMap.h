#ifndef _HUMANMODELENUMMAP_H
#define _HUMANMODELENUMMAP_H

#include "HumanModelEnums.h"

struct PointMapEntry {
  PointId name_enum;
  const char* name_str;
};

extern PointMapEntry PointMap[];
PointId getPointIdFromString (const char* point_name_str);

struct ConstraintSetMapEntry {
  CSId name_enum;
  const char* name_str;
};

extern ConstraintSetMapEntry ConstraintSetMap[ConstraintSetNameLast + 1];
CSId getConstraintSetIdFromString (const char* point_name_str);
#endif
