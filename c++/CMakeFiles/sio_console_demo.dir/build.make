# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/druepeters/Development/scoreboard/c++-comm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/druepeters/Development/scoreboard/c++-comm

# Include any dependencies generated for this target.
include CMakeFiles/sio_console_demo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sio_console_demo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sio_console_demo.dir/flags.make

CMakeFiles/sio_console_demo.dir/main.cpp.o: CMakeFiles/sio_console_demo.dir/flags.make
CMakeFiles/sio_console_demo.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/druepeters/Development/scoreboard/c++-comm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sio_console_demo.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sio_console_demo.dir/main.cpp.o -c /home/druepeters/Development/scoreboard/c++-comm/main.cpp

CMakeFiles/sio_console_demo.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sio_console_demo.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/druepeters/Development/scoreboard/c++-comm/main.cpp > CMakeFiles/sio_console_demo.dir/main.cpp.i

CMakeFiles/sio_console_demo.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sio_console_demo.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/druepeters/Development/scoreboard/c++-comm/main.cpp -o CMakeFiles/sio_console_demo.dir/main.cpp.s

# Object files for target sio_console_demo
sio_console_demo_OBJECTS = \
"CMakeFiles/sio_console_demo.dir/main.cpp.o"

# External object files for target sio_console_demo
sio_console_demo_EXTERNAL_OBJECTS =

sio_console_demo: CMakeFiles/sio_console_demo.dir/main.cpp.o
sio_console_demo: CMakeFiles/sio_console_demo.dir/build.make
sio_console_demo: CMakeFiles/sio_console_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/druepeters/Development/scoreboard/c++-comm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sio_console_demo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sio_console_demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sio_console_demo.dir/build: sio_console_demo

.PHONY : CMakeFiles/sio_console_demo.dir/build

CMakeFiles/sio_console_demo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sio_console_demo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sio_console_demo.dir/clean

CMakeFiles/sio_console_demo.dir/depend:
	cd /home/druepeters/Development/scoreboard/c++-comm && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/druepeters/Development/scoreboard/c++-comm /home/druepeters/Development/scoreboard/c++-comm /home/druepeters/Development/scoreboard/c++-comm /home/druepeters/Development/scoreboard/c++-comm /home/druepeters/Development/scoreboard/c++-comm/CMakeFiles/sio_console_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sio_console_demo.dir/depend

