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
CMAKE_SOURCE_DIR = /home/jendav/Stage-3.2.2-Source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jendav/Stage-3.2.2-Source/build

# Include any dependencies generated for this target.
include libstage/CMakeFiles/stagebinary.dir/depend.make

# Include the progress variables for this target.
include libstage/CMakeFiles/stagebinary.dir/progress.make

# Include the compile flags for this target's objects.
include libstage/CMakeFiles/stagebinary.dir/flags.make

libstage/CMakeFiles/stagebinary.dir/main.o: libstage/CMakeFiles/stagebinary.dir/flags.make
libstage/CMakeFiles/stagebinary.dir/main.o: ../libstage/main.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jendav/Stage-3.2.2-Source/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libstage/CMakeFiles/stagebinary.dir/main.o"
	cd /home/jendav/Stage-3.2.2-Source/build/libstage && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS)  -I/usr/include/freetype2   -D_THREAD_SAFE -D_REENTRANT -o CMakeFiles/stagebinary.dir/main.o -c /home/jendav/Stage-3.2.2-Source/libstage/main.cc

libstage/CMakeFiles/stagebinary.dir/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stagebinary.dir/main.i"
	cd /home/jendav/Stage-3.2.2-Source/build/libstage && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS)  -I/usr/include/freetype2   -D_THREAD_SAFE -D_REENTRANT -E /home/jendav/Stage-3.2.2-Source/libstage/main.cc > CMakeFiles/stagebinary.dir/main.i

libstage/CMakeFiles/stagebinary.dir/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stagebinary.dir/main.s"
	cd /home/jendav/Stage-3.2.2-Source/build/libstage && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS)  -I/usr/include/freetype2   -D_THREAD_SAFE -D_REENTRANT -S /home/jendav/Stage-3.2.2-Source/libstage/main.cc -o CMakeFiles/stagebinary.dir/main.s

libstage/CMakeFiles/stagebinary.dir/main.o.requires:
.PHONY : libstage/CMakeFiles/stagebinary.dir/main.o.requires

libstage/CMakeFiles/stagebinary.dir/main.o.provides: libstage/CMakeFiles/stagebinary.dir/main.o.requires
	$(MAKE) -f libstage/CMakeFiles/stagebinary.dir/build.make libstage/CMakeFiles/stagebinary.dir/main.o.provides.build
.PHONY : libstage/CMakeFiles/stagebinary.dir/main.o.provides

libstage/CMakeFiles/stagebinary.dir/main.o.provides.build: libstage/CMakeFiles/stagebinary.dir/main.o

# Object files for target stagebinary
stagebinary_OBJECTS = \
"CMakeFiles/stagebinary.dir/main.o"

# External object files for target stagebinary
stagebinary_EXTERNAL_OBJECTS =

libstage/stage: libstage/CMakeFiles/stagebinary.dir/main.o
libstage/stage: libstage/CMakeFiles/stagebinary.dir/build.make
libstage/stage: libstage/libstage.so.3.2.2
libstage/stage: /usr/lib/x86_64-linux-gnu/libGLU.so
libstage/stage: /usr/lib/x86_64-linux-gnu/libGL.so
libstage/stage: /usr/lib/x86_64-linux-gnu/libSM.so
libstage/stage: /usr/lib/x86_64-linux-gnu/libICE.so
libstage/stage: /usr/lib/x86_64-linux-gnu/libX11.so
libstage/stage: /usr/lib/x86_64-linux-gnu/libXext.so
libstage/stage: /usr/lib/x86_64-linux-gnu/libltdl.so
libstage/stage: libstage/CMakeFiles/stagebinary.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable stage"
	cd /home/jendav/Stage-3.2.2-Source/build/libstage && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stagebinary.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libstage/CMakeFiles/stagebinary.dir/build: libstage/stage
.PHONY : libstage/CMakeFiles/stagebinary.dir/build

libstage/CMakeFiles/stagebinary.dir/requires: libstage/CMakeFiles/stagebinary.dir/main.o.requires
.PHONY : libstage/CMakeFiles/stagebinary.dir/requires

libstage/CMakeFiles/stagebinary.dir/clean:
	cd /home/jendav/Stage-3.2.2-Source/build/libstage && $(CMAKE_COMMAND) -P CMakeFiles/stagebinary.dir/cmake_clean.cmake
.PHONY : libstage/CMakeFiles/stagebinary.dir/clean

libstage/CMakeFiles/stagebinary.dir/depend:
	cd /home/jendav/Stage-3.2.2-Source/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jendav/Stage-3.2.2-Source /home/jendav/Stage-3.2.2-Source/libstage /home/jendav/Stage-3.2.2-Source/build /home/jendav/Stage-3.2.2-Source/build/libstage /home/jendav/Stage-3.2.2-Source/build/libstage/CMakeFiles/stagebinary.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libstage/CMakeFiles/stagebinary.dir/depend

