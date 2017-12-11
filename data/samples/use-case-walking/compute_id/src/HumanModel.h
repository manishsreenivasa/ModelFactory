#ifndef _HUMANMODEL_H
#define _HUMANMODEL_H

#include <limits>
#include <vector>

#include <rbdl/rbdl.h>
#include <rbdl/addons/muscle/muscle.h>

#include "HumanModelEnums.h"
#include "HumanModelEnumMap.h"

struct Point {
  Point() :
    name ("unknown"),
    body_id (-1),
    body_name (""),
    point_local (
      std::numeric_limits<double>::signaling_NaN(),
      std::numeric_limits<double>::signaling_NaN(),
      std::numeric_limits<double>::signaling_NaN()
      )
  { }

  std::string name;
  unsigned int body_id;
  std::string body_name;
  RigidBodyDynamics::Math::Vector3d point_local;
};

//==============================================================================
struct MetaData {
  MetaData() :
    scaling_used("nan"),
    subject_ageGroup("nan"),
    subject_gender("nan"),
    subject_age(std::numeric_limits<double>::signaling_NaN()),
    subject_height(std::numeric_limits<double>::signaling_NaN()),
    subject_weight(std::numeric_limits<double>::signaling_NaN()),
    subject_pelvisWidth(std::numeric_limits<double>::signaling_NaN()),
    subject_hipCenterWidth(std::numeric_limits<double>::signaling_NaN())
  { }

  std::string   scaling_used;
  std::string   subject_ageGroup;
  std::string   subject_gender;
  double        subject_age;
  double        subject_height;
  double        subject_weight;  
  double        subject_pelvisWidth;
  double        subject_hipCenterWidth;
};

/** Data of a single constraint **/
struct ConstraintInfo {
	ConstraintInfo() :
		point_id (PointNameLast),
		type (RigidBodyDynamics::ConstraintSet::ConstraintTypeLast),
		point_name (""),
    normal (
      std::numeric_limits<double>::signaling_NaN(),
      std::numeric_limits<double>::signaling_NaN(),
      std::numeric_limits<double>::signaling_NaN()
			),
		name(""),
		predecessor_body(""),
		successor_body(""),
		predecessor_transform(RigidBodyDynamics::Math::SpatialTransform()),
		successor_transform(RigidBodyDynamics::Math::SpatialTransform()),
		axis(RigidBodyDynamics::Math::SpatialVector::Zero()),
		baumgarte_enabled(false),
		stabilization_coefficient(0.0) {
	}
	unsigned int point_id;
	RigidBodyDynamics::ConstraintSet::ConstraintType type;

	// case type == ContactConstraint
	std::string point_name;
	RigidBodyDynamics::Math::Vector3d normal;

	// case type == LoopConstraint
	std::string name;
	std::string predecessor_body;
	std::string successor_body;
	RigidBodyDynamics::Math::SpatialTransform predecessor_transform;
	RigidBodyDynamics::Math::SpatialTransform successor_transform;
	RigidBodyDynamics::Math::SpatialVector axis;
	bool   baumgarte_enabled;
	double stabilization_coefficient;
};

/** Structure that holds data of a complete constraint set */
struct ConstraintSetInfo {
  ConstraintSetInfo() :
    name ("undefined") {
  }
  std::vector<ConstraintInfo> constraints;
  std::string name;
};

struct HumanModel{
  HumanModel();

  unsigned int activeConstraintSet;
  unsigned int nDof;
  RigidBodyDynamics::Math::VectorNd q;          // multibody gen. coord.
  RigidBodyDynamics::Math::VectorNd qdot;       // multibody gen. vel

  RigidBodyDynamics::Model model;

  MetaData subjectMetaData;

  Point pointInfos[PointNameLast];
  /// Information of the constraint sets (mostly used when parsing Lua file)
  ConstraintSetInfo cs_infos[ConstraintSetNameLast];

  /** RDBL constraint sets that are used during forward dynamics and collision
  computations */
  std::vector<RigidBodyDynamics::ConstraintSet> constraint_sets;
  CSId getConstraintSetId(unsigned int phase);

  RigidBodyDynamics::Math::Matrix3d getBodyWorldOrientation(
      const PointId &point_name);
  RigidBodyDynamics::Math::Vector3d getPointPosition (
			const PointId &point_name);
  RigidBodyDynamics::Math::Vector3d getPointVelocity (
			const PointId &point_name);
  RigidBodyDynamics::Math::SpatialVector getPointVelocity6D (
      const PointId &point_name);

  bool loadFromFile (std::string modelfilename, bool verbose = false);
  bool loadPoints (std::string filename, bool verbose = false);
  bool loadConstraintSets (std::string filename, bool verbose = false);
  bool loadMetaData (std::string filename, bool verbose = false);
};
#endif
