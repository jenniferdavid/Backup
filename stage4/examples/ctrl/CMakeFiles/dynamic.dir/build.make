# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jendav/stage4/Stage

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jendav/stage4

# Include any dependencies generated for this target.
include examples/ctrl/CMakeFiles/dynamic.dir/depend.make

# Include the progress variables for this target.
include examples/ctrl/CMakeFiles/dynamic.dir/progress.make

# Include the compile flags for this target's objects.
include examples/ctrl/CMakeFiles/dynamic.dir/flags.make

examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o: examples/ctrl/CMakeFiles/dynamic.dir/flags.make
examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o: Stage/examples/ctrl/dynamic.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jendav/stage4/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o"
	cd /home/jendav/stage4/examples/ctrl && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dynamic.dir/dynamic.o -c /home/jendav/stage4/Stage/examples/ctrl/dynamic.cc

examples/ctrl/CMakeFiles/dynamic.dir/dynamic.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dynamic.dir/dynamic.i"
	cd /home/jendav/stage4/examples/ctrl && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jendav/stage4/Stage/examples/ctrl/dynamic.cc > CMakeFiles/dynamic.dir/dynamic.i

examples/ctrl/CMakeFiles/dynamic.dir/dynamic.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dynamic.dir/dynamic.s"
	cd /home/jendav/stage4/examples/ctrl && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jendav/stage4/Stage/examples/ctrl/dynamic.cc -o CMakeFiles/dynamic.dir/dynamic.s

examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.requires:
.PHONY : examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.requires

examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.provides: examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.requires
	$(MAKE) -f examples/ctrl/CMakeFiles/dynamic.dir/build.make examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.provides.build
.PHONY : examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.provides

examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.provides.build: examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o

# Object files for target dynamic
dynamic_OBJECTS = \
"CMakeFiles/dynamic.dir/dynamic.o"

# External object files for target dynamic
dynamic_EXTERNAL_OBJECTS =

examples/ctrl/dynamic.so: examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o
examples/ctrl/dynamic.so: examples/ctrl/CMakeFiles/dynamic.dir/build.make
examples/ctrl/dynamic.so: libstage/libstage.so.4.1.1
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libGLU.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libGL.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libSM.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libICE.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libX11.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libXext.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libltdl.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libjpeg.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libpng.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libz.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libGL.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libSM.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libICE.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libX11.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libXext.so
examples/ctrl/dynamic.so: /usr/lib/x86_64-linux-gnu/libm.so
examples/ctrl/dynamic.so: examples/ctrl/CMakeFiles/dynamic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module dynamic.so"
	cd /home/jendav/stage4/examples/ctrl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dynamic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/ctrl/CMakeFiles/dynamic.dir/build: examples/ctrl/dynamic.so
.PHONY : examples/ctrl/CMakeFiles/dynamic.dir/build

examples/ctrl/CMakeFiles/dynamic.dir/requires: examples/ctrl/CMakeFiles/dynamic.dir/dynamic.o.requires
.PHONY : examples/ctrl/CMakeFiles/dynamic.dir/requires

examples/ctrl/CMakeFiles/dynamic.dir/clean:
	cd /home/jendav/stage4/examples/ctrl && $(CMAKE_COMMAND) -P CMakeFiles/dynamic.dir/cmake_clean.cmake
.PHONY : examples/ctrl/CMakeFiles/dynamic.dir/clean

examples/ctrl/CMakeFiles/dynamic.dir/depend:
	cd /home/jendav/stage4 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jendav/stage4/Stage /home/jendav/stage4/Stage/examples/ctrl /home/jendav/stage4 /home/jendav/stage4/examples/ctrl /home/jendav/stage4/examples/ctrl/CMakeFiles/dynamic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/ctrl/CMakeFiles/dynamic.dir/depend

