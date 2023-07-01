# Install script for directory: /home/mohamed/Desktop/software_engineering_robotics_Udacity/projects/catkin_ws_home_service_robot/src/turtlebot_interactions/turtlebot_interactive_markers

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mohamed/Desktop/software_engineering_robotics_Udacity/projects/catkin_ws_home_service_robot/src/cmake-build-debug-1/turtlebot_interactions/turtlebot_interactive_markers/catkin_generated/installspace/turtlebot_interactive_markers.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_interactive_markers/cmake" TYPE FILE FILES
    "/home/mohamed/Desktop/software_engineering_robotics_Udacity/projects/catkin_ws_home_service_robot/src/cmake-build-debug-1/turtlebot_interactions/turtlebot_interactive_markers/catkin_generated/installspace/turtlebot_interactive_markersConfig.cmake"
    "/home/mohamed/Desktop/software_engineering_robotics_Udacity/projects/catkin_ws_home_service_robot/src/cmake-build-debug-1/turtlebot_interactions/turtlebot_interactive_markers/catkin_generated/installspace/turtlebot_interactive_markersConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_interactive_markers" TYPE FILE FILES "/home/mohamed/Desktop/software_engineering_robotics_Udacity/projects/catkin_ws_home_service_robot/src/turtlebot_interactions/turtlebot_interactive_markers/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers/turtlebot_marker_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers/turtlebot_marker_server")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers/turtlebot_marker_server"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers" TYPE EXECUTABLE FILES "/home/mohamed/Desktop/software_engineering_robotics_Udacity/projects/catkin_ws_home_service_robot/src/cmake-build-debug-1/devel/lib/turtlebot_interactive_markers/turtlebot_marker_server")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers/turtlebot_marker_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers/turtlebot_marker_server")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers/turtlebot_marker_server"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_interactive_markers/turtlebot_marker_server")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_interactive_markers" TYPE DIRECTORY FILES "/home/mohamed/Desktop/software_engineering_robotics_Udacity/projects/catkin_ws_home_service_robot/src/turtlebot_interactions/turtlebot_interactive_markers/launch")
endif()
