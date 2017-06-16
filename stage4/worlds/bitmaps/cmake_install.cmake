# Install script for directory: /home/jendav/stage4/Stage/worlds/bitmaps

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/stage/worlds/bitmaps" TYPE FILE FILES
    "/home/jendav/stage4/Stage/worlds/bitmaps/ghost.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/SRI-AIC-kwing.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/space_invader.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/mbicp.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/889_05.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/table.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/hospital_section.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/simple_rooms.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/submarine_small.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/hospital.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/uoa_robotics_lab.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/human_outline.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/submarine.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/autolab.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/frieburg.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/SFU_1200x615.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/cave_filled.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/cave_compact.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/sal2.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/rink.png"
    "/home/jendav/stage4/Stage/worlds/bitmaps/cave.png"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

