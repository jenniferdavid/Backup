# Install script for directory: /home/jendav/stage4/Stage/worlds

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/jendav/stg")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/stage/worlds" TYPE FILE FILES
    "/home/jendav/stage4/Stage/worlds/autolab.cfg"
    "/home/jendav/stage4/Stage/worlds/roomba.cfg"
    "/home/jendav/stage4/Stage/worlds/mbicp.cfg"
    "/home/jendav/stage4/Stage/worlds/nd.cfg"
    "/home/jendav/stage4/Stage/worlds/uoa_robotics_lab.cfg"
    "/home/jendav/stage4/Stage/worlds/wavefront.cfg"
    "/home/jendav/stage4/Stage/worlds/amcl-sonar.cfg"
    "/home/jendav/stage4/Stage/worlds/everything.cfg"
    "/home/jendav/stage4/Stage/worlds/camera.cfg"
    "/home/jendav/stage4/Stage/worlds/test.cfg"
    "/home/jendav/stage4/Stage/worlds/wifi.cfg"
    "/home/jendav/stage4/Stage/worlds/vfh.cfg"
    "/home/jendav/stage4/Stage/worlds/lsp_test.cfg"
    "/home/jendav/stage4/Stage/worlds/wavefront-remote.cfg"
    "/home/jendav/stage4/Stage/worlds/simple.cfg"
    "/home/jendav/stage4/Stage/worlds/sensor_noise_module_demo.world"
    "/home/jendav/stage4/Stage/worlds/camera.world"
    "/home/jendav/stage4/Stage/worlds/uoa_robotics_lab.world"
    "/home/jendav/stage4/Stage/worlds/autolab.world"
    "/home/jendav/stage4/Stage/worlds/simple.world"
    "/home/jendav/stage4/Stage/worlds/wifi.world"
    "/home/jendav/stage4/Stage/worlds/roomba.world"
    "/home/jendav/stage4/Stage/worlds/fasr_plan.world"
    "/home/jendav/stage4/Stage/worlds/large.world"
    "/home/jendav/stage4/Stage/worlds/sensor_noise_demo.world"
    "/home/jendav/stage4/Stage/worlds/pioneer_flocking.world"
    "/home/jendav/stage4/Stage/worlds/everything.world"
    "/home/jendav/stage4/Stage/worlds/SFU.world"
    "/home/jendav/stage4/Stage/worlds/pioneer_walle.world"
    "/home/jendav/stage4/Stage/worlds/mbicp.world"
    "/home/jendav/stage4/Stage/worlds/fasr2.world"
    "/home/jendav/stage4/Stage/worlds/fasr.world"
    "/home/jendav/stage4/Stage/worlds/lsp_test.world"
    "/home/jendav/stage4/Stage/worlds/beacons.inc"
    "/home/jendav/stage4/Stage/worlds/pioneer.inc"
    "/home/jendav/stage4/Stage/worlds/objects.inc"
    "/home/jendav/stage4/Stage/worlds/pantilt.inc"
    "/home/jendav/stage4/Stage/worlds/ubot.inc"
    "/home/jendav/stage4/Stage/worlds/uoa_robotics_lab_models.inc"
    "/home/jendav/stage4/Stage/worlds/chatterbox.inc"
    "/home/jendav/stage4/Stage/worlds/map.inc"
    "/home/jendav/stage4/Stage/worlds/irobot.inc"
    "/home/jendav/stage4/Stage/worlds/walle.inc"
    "/home/jendav/stage4/Stage/worlds/hokuyo.inc"
    "/home/jendav/stage4/Stage/worlds/sick.inc"
    "/home/jendav/stage4/Stage/worlds/test.sh"
    "/home/jendav/stage4/Stage/worlds/cfggen.sh"
    "/home/jendav/stage4/Stage/worlds/worldgen.sh"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/jendav/stage4/worlds/benchmark/cmake_install.cmake")
  INCLUDE("/home/jendav/stage4/worlds/bitmaps/cmake_install.cmake")
  INCLUDE("/home/jendav/stage4/worlds/wifi/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

