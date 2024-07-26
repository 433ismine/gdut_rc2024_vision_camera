# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolov5_findball: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iyolov5_findball:/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Iyolov5_ros_msgs:/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_ros_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yolov5_findball_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg" NAME_WE)
add_custom_target(_yolov5_findball_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5_findball" "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg" ""
)

get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg" NAME_WE)
add_custom_target(_yolov5_findball_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5_findball" "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg" "yolov5_findball/BoundingBox:std_msgs/Header"
)

get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg" NAME_WE)
add_custom_target(_yolov5_findball_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5_findball" "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_findball
)
_generate_msg_cpp(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_findball
)
_generate_msg_cpp(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_findball
)

### Generating Services

### Generating Module File
_generate_module_cpp(yolov5_findball
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_findball
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yolov5_findball_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yolov5_findball_generate_messages yolov5_findball_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_cpp _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_cpp _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_cpp _yolov5_findball_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_findball_gencpp)
add_dependencies(yolov5_findball_gencpp yolov5_findball_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_findball_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_findball
)
_generate_msg_eus(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_findball
)
_generate_msg_eus(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_findball
)

### Generating Services

### Generating Module File
_generate_module_eus(yolov5_findball
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_findball
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yolov5_findball_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yolov5_findball_generate_messages yolov5_findball_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_eus _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_eus _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_eus _yolov5_findball_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_findball_geneus)
add_dependencies(yolov5_findball_geneus yolov5_findball_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_findball_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_findball
)
_generate_msg_lisp(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_findball
)
_generate_msg_lisp(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_findball
)

### Generating Services

### Generating Module File
_generate_module_lisp(yolov5_findball
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_findball
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yolov5_findball_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yolov5_findball_generate_messages yolov5_findball_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_lisp _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_lisp _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_lisp _yolov5_findball_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_findball_genlisp)
add_dependencies(yolov5_findball_genlisp yolov5_findball_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_findball_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_findball
)
_generate_msg_nodejs(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_findball
)
_generate_msg_nodejs(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_findball
)

### Generating Services

### Generating Module File
_generate_module_nodejs(yolov5_findball
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_findball
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yolov5_findball_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yolov5_findball_generate_messages yolov5_findball_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_nodejs _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_nodejs _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_nodejs _yolov5_findball_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_findball_gennodejs)
add_dependencies(yolov5_findball_gennodejs yolov5_findball_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_findball_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_findball
)
_generate_msg_py(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_findball
)
_generate_msg_py(yolov5_findball
  "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_findball
)

### Generating Services

### Generating Module File
_generate_module_py(yolov5_findball
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_findball
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yolov5_findball_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yolov5_findball_generate_messages yolov5_findball_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_py _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_py _yolov5_findball_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yuyu/workspace/robocon/camera/cameratest/src/yolov5_findball/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_findball_generate_messages_py _yolov5_findball_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_findball_genpy)
add_dependencies(yolov5_findball_genpy yolov5_findball_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_findball_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_findball)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_findball
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yolov5_findball_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(yolov5_findball_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_cpp)
  add_dependencies(yolov5_findball_generate_messages_cpp yolov5_ros_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_findball)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_findball
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yolov5_findball_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(yolov5_findball_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_eus)
  add_dependencies(yolov5_findball_generate_messages_eus yolov5_ros_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_findball)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_findball
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yolov5_findball_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(yolov5_findball_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_lisp)
  add_dependencies(yolov5_findball_generate_messages_lisp yolov5_ros_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_findball)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_findball
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_findball_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_findball_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_findball_generate_messages_nodejs yolov5_ros_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_findball)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_findball\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_findball
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yolov5_findball_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(yolov5_findball_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_py)
  add_dependencies(yolov5_findball_generate_messages_py yolov5_ros_msgs_generate_messages_py)
endif()
