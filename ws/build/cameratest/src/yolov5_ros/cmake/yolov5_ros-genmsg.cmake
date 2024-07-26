# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolov5_ros: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iyolov5_ros:/home/robocon/ws/src/cameratest/src/yolov5_ros/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Iyolov5_ros_msgs:/home/robocon/ws/src/cameratest/src/yolov5_ros_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yolov5_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg" NAME_WE)
add_custom_target(_yolov5_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5_ros" "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg" ""
)

get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg" NAME_WE)
add_custom_target(_yolov5_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5_ros" "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg" "std_msgs/Header:yolov5_ros/BoundingBox"
)

get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg" NAME_WE)
add_custom_target(_yolov5_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5_ros" "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg" ""
)

get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg" NAME_WE)
add_custom_target(_yolov5_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5_ros" "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_ros
)
_generate_msg_cpp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_ros
)
_generate_msg_cpp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_ros
)
_generate_msg_cpp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(yolov5_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yolov5_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yolov5_ros_generate_messages yolov5_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_cpp _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_cpp _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_cpp _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_cpp _yolov5_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_ros_gencpp)
add_dependencies(yolov5_ros_gencpp yolov5_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_ros
)
_generate_msg_eus(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_ros
)
_generate_msg_eus(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_ros
)
_generate_msg_eus(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_ros
)

### Generating Services

### Generating Module File
_generate_module_eus(yolov5_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yolov5_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yolov5_ros_generate_messages yolov5_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_eus _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_eus _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_eus _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_eus _yolov5_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_ros_geneus)
add_dependencies(yolov5_ros_geneus yolov5_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_ros
)
_generate_msg_lisp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_ros
)
_generate_msg_lisp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_ros
)
_generate_msg_lisp(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(yolov5_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yolov5_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yolov5_ros_generate_messages yolov5_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_lisp _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_lisp _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_lisp _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_lisp _yolov5_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_ros_genlisp)
add_dependencies(yolov5_ros_genlisp yolov5_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_ros
)
_generate_msg_nodejs(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_ros
)
_generate_msg_nodejs(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_ros
)
_generate_msg_nodejs(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_ros
)

### Generating Services

### Generating Module File
_generate_module_nodejs(yolov5_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yolov5_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yolov5_ros_generate_messages yolov5_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_nodejs _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_nodejs _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_nodejs _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_nodejs _yolov5_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_ros_gennodejs)
add_dependencies(yolov5_ros_gennodejs yolov5_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros
)
_generate_msg_py(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros
)
_generate_msg_py(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros
)
_generate_msg_py(yolov5_ros
  "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros
)

### Generating Services

### Generating Module File
_generate_module_py(yolov5_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yolov5_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yolov5_ros_generate_messages yolov5_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_py _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_py _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Silos.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_py _yolov5_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robocon/ws/src/cameratest/src/yolov5_ros/msg/Judge.msg" NAME_WE)
add_dependencies(yolov5_ros_generate_messages_py _yolov5_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_ros_genpy)
add_dependencies(yolov5_ros_genpy yolov5_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yolov5_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(yolov5_ros_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(yolov5_ros_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_cpp)
  add_dependencies(yolov5_ros_generate_messages_cpp yolov5_ros_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yolov5_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(yolov5_ros_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(yolov5_ros_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_eus)
  add_dependencies(yolov5_ros_generate_messages_eus yolov5_ros_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yolov5_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(yolov5_ros_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(yolov5_ros_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_lisp)
  add_dependencies(yolov5_ros_generate_messages_lisp yolov5_ros_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_ros_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_ros_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_ros_generate_messages_nodejs yolov5_ros_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yolov5_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(yolov5_ros_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(yolov5_ros_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET yolov5_ros_msgs_generate_messages_py)
  add_dependencies(yolov5_ros_generate_messages_py yolov5_ros_msgs_generate_messages_py)
endif()
