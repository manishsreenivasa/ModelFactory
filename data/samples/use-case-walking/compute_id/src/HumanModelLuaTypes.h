#ifndef HUMANMODELLUATYPES
#define HUMANMODELLUATYPES

#include "HumanModel.h"
#include <rbdl/rbdl_math.h>
#include <rbdl/addons/luamodel/luatables.h>

template<> RigidBodyDynamics::Math::Vector3d 
LuaTableNode::getDefault<RigidBodyDynamics::Math::Vector3d>
(const RigidBodyDynamics::Math::Vector3d &default_value) {
  
  RigidBodyDynamics::Math::Vector3d result = default_value;

  if (stackQueryValue()) {
    LuaTable vector_table = LuaTable::fromLuaState (luaTable->L);

    if (vector_table.length() != 3) {
      std::cerr << "LuaModel Error: invalid 3d vector!" << std::endl;
      abort();
    }
			
    result[0] = vector_table[1];
    result[1] = vector_table[2];
    result[2] = vector_table[3];
  }

  stackRestore();

  return result;
}

template<> RigidBodyDynamics::Math::SpatialVector 
LuaTableNode::getDefault<RigidBodyDynamics::Math::SpatialVector>
(const RigidBodyDynamics::Math::SpatialVector &default_value) {
  
  RigidBodyDynamics::Math::SpatialVector result = default_value;

  if (stackQueryValue()) {
    LuaTable vector_table = LuaTable::fromLuaState (luaTable->L);
			
    if (vector_table.length() != 6) {
      std::cerr << "LuaModel Error: invalid 6d vector!" << std::endl;
      abort();
    }
    result[0] = vector_table[1];
    result[1] = vector_table[2];
    result[2] = vector_table[3];
    result[3] = vector_table[4];
    result[4] = vector_table[5];
    result[5] = vector_table[6];
  }

  stackRestore();

  return result;
}

template<> RigidBodyDynamics::Math::Matrix3d 
LuaTableNode::getDefault<RigidBodyDynamics::Math::Matrix3d>
(const RigidBodyDynamics::Math::Matrix3d &default_value) {
  
  RigidBodyDynamics::Math::Matrix3d result = default_value;

  if (stackQueryValue()) {
    LuaTable vector_table = LuaTable::fromLuaState (luaTable->L);
			
    if (vector_table.length() != 3) {
      std::cerr << "LuaModel Error: invalid 3d matrix!" << std::endl;
      abort();
    }

    if (vector_table[1].length() != 3
	|| vector_table[2].length() != 3
	|| vector_table[3].length() != 3) {
      std::cerr << "LuaModel Error: invalid 3d matrix!" << std::endl;
      abort();
    }

    result(0,0) = vector_table[1][1];
    result(0,1) = vector_table[1][2];
    result(0,2) = vector_table[1][3];

    result(1,0) = vector_table[2][1];
    result(1,1) = vector_table[2][2];
    result(1,2) = vector_table[2][3];

    result(2,0) = vector_table[3][1];
    result(2,1) = vector_table[3][2];
    result(2,2) = vector_table[3][3];
  }

  stackRestore();

  return result;
}

template<> RigidBodyDynamics::Math::SpatialTransform 
LuaTableNode::getDefault<RigidBodyDynamics::Math::SpatialTransform>
(const RigidBodyDynamics::Math::SpatialTransform &default_value) {
  
  RigidBodyDynamics::Math::SpatialTransform result = default_value;

  if (stackQueryValue()) {
    LuaTable vector_table = LuaTable::fromLuaState (luaTable->L);
    result.r = vector_table["r"]
      .getDefault<RigidBodyDynamics::Math::Vector3d>
      (RigidBodyDynamics::Math::Vector3d::Zero(3));
    result.E = vector_table["E"]
      .getDefault<RigidBodyDynamics::Math::Matrix3d>
      (RigidBodyDynamics::Math::Matrix3d::Identity (3,3));
  }

  stackRestore();
  return result;
}

template<> Point LuaTableNode::getDefault<Point>(const Point &default_value) {
  
  Point result = default_value;

  if (stackQueryValue()) {
    LuaTable point_table = LuaTable::fromLuaState (luaTable->L);
    result.name = point_table["name"].get<std::string>();
    result.point_local = point_table["point"];
    result.body_name = point_table["body"].get<std::string>();
  }

  stackRestore();
  return result;
}

template<> ConstraintInfo 
LuaTableNode::getDefault<ConstraintInfo>(const ConstraintInfo &default_value) {
  ConstraintInfo result = default_value;

  if (stackQueryValue()) {
    LuaTable cx_table = LuaTable::fromLuaState (luaTable->L);
    LuaTableNode cx_type = cx_table["ctype"];

    if (cx_type.length() == 0) {
      result.type = RigidBodyDynamics::ConstraintSet::ContactConstraint;
    } else {
      std::string cx_type_str = cx_type.get<std::string>();
      if (cx_type_str == "loop") {
	result.type = RigidBodyDynamics::ConstraintSet::LoopConstraint;
      } else {
	result.type = RigidBodyDynamics::ConstraintSet::ContactConstraint;
      }
    }

    switch (result.type) {
    case RigidBodyDynamics::ConstraintSet::ContactConstraint:
      result.point_name = cx_table["point"].get<std::string>();
      result.normal     = cx_table["normal"];
      break;
    case RigidBodyDynamics::ConstraintSet::LoopConstraint:
      result.name	      = cx_table["name"].get<std::string>();
      result.predecessor_body =
	cx_table["predecessor_body"].get<std::string>();
      result.successor_body = cx_table["successor_body"].get<std::string>();
      result.predecessor_transform = cx_table["predecessor_transform"]
	.get<RigidBodyDynamics::Math::SpatialTransform>();
      result.successor_transform = cx_table["successor_transform"]
	.get<RigidBodyDynamics::Math::SpatialTransform>();
      result.axis = cx_table["axis"]
	.get<RigidBodyDynamics::Math::SpatialVector>();
      result.baumgarte_enabled = cx_table["baumgarte_enabled"].get<bool>();
      if (result.baumgarte_enabled) {
	result.stabilization_coefficient =
	  cx_table["stabilization_coefficient"].get<double>();
      } else {
	if (cx_table["stabilization_coefficient"].exists()) {
	  result.stabilization_coefficient =
	    cx_table["stabilization_coefficient"].get<double>();
	}
      }
      break;
    case RigidBodyDynamics::ConstraintSet::ConstraintTypeLast:
      break;
    }
  }

  stackRestore();
  return result;
}


template<> MetaData 
LuaTableNode::getDefault<MetaData>(const MetaData &default_value) {
  
  MetaData result = default_value;

  if (stackQueryValue()) {
    LuaTable metadata_table = LuaTable::fromLuaState (luaTable->L);

    result.scaling_used = metadata_table["scaling_used"].get<std::string>();
    result.subject_gender =
      metadata_table["subject_gender"].get<std::string>();
    result.subject_age  	= metadata_table["subject_age"];
    result.subject_height = metadata_table["subject_height"];
    result.subject_weight = metadata_table["subject_weight"];		
    result.subject_pelvisWidth = metadata_table["subject_pelvisWidth"];
    result.subject_hipCenterWidth = metadata_table["subject_hipCenterWidth"];
  }
  stackRestore();
  return result;
}
#endif
