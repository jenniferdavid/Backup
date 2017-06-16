# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rosbuzz: 1 messages, 0 services")

set(MSG_I_FLAGS "-Irosbuzz:/home/jendav/catkin_ws/src/code/rosbuzz/msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rosbuzz_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg" NAME_WE)
add_custom_target(_rosbuzz_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbuzz" "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg" "sensor_msgs/NavSatStatus:std_msgs/Header:sensor_msgs/NavSatFix"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rosbuzz
  "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbuzz
)

### Generating Services

### Generating Module File
_generate_module_cpp(rosbuzz
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbuzz
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rosbuzz_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rosbuzz_generate_messages rosbuzz_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg" NAME_WE)
add_dependencies(rosbuzz_generate_messages_cpp _rosbuzz_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbuzz_gencpp)
add_dependencies(rosbuzz_gencpp rosbuzz_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbuzz_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rosbuzz
  "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbuzz
)

### Generating Services

### Generating Module File
_generate_module_lisp(rosbuzz
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbuzz
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rosbuzz_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rosbuzz_generate_messages rosbuzz_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg" NAME_WE)
add_dependencies(rosbuzz_generate_messages_lisp _rosbuzz_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbuzz_genlisp)
add_dependencies(rosbuzz_genlisp rosbuzz_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbuzz_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rosbuzz
  "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbuzz
)

### Generating Services

### Generating Module File
_generate_module_py(rosbuzz
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbuzz
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rosbuzz_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rosbuzz_generate_messages rosbuzz_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jendav/catkin_ws/src/code/rosbuzz/msg/neigh_pos.msg" NAME_WE)
add_dependencies(rosbuzz_generate_messages_py _rosbuzz_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbuzz_genpy)
add_dependencies(rosbuzz_genpy rosbuzz_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbuzz_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbuzz)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbuzz
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(rosbuzz_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbuzz)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbuzz
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(rosbuzz_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbuzz)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbuzz\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbuzz
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(rosbuzz_generate_messages_py sensor_msgs_generate_messages_py)
endif()
