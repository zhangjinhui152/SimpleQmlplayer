# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zjh/program/c++/Media

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zjh/program/c++/Media/build

# Include any dependencies generated for this target.
include player/CMakeFiles/player.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include player/CMakeFiles/player.dir/compiler_depend.make

# Include the progress variables for this target.
include player/CMakeFiles/player.dir/progress.make

# Include the compile flags for this target's objects.
include player/CMakeFiles/player.dir/flags.make

player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o: player/CMakeFiles/player.dir/flags.make
player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o: player/player_autogen/mocs_compilation.cpp
player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o: player/CMakeFiles/player.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o -MF CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o -c /home/zjh/program/c++/Media/build/player/player_autogen/mocs_compilation.cpp

player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.i"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjh/program/c++/Media/build/player/player_autogen/mocs_compilation.cpp > CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.i

player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.s"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjh/program/c++/Media/build/player/player_autogen/mocs_compilation.cpp -o CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.s

player/CMakeFiles/player.dir/vlcpp/include/a.cpp.o: player/CMakeFiles/player.dir/flags.make
player/CMakeFiles/player.dir/vlcpp/include/a.cpp.o: ../player/vlcpp/include/a.cpp
player/CMakeFiles/player.dir/vlcpp/include/a.cpp.o: player/CMakeFiles/player.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object player/CMakeFiles/player.dir/vlcpp/include/a.cpp.o"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT player/CMakeFiles/player.dir/vlcpp/include/a.cpp.o -MF CMakeFiles/player.dir/vlcpp/include/a.cpp.o.d -o CMakeFiles/player.dir/vlcpp/include/a.cpp.o -c /home/zjh/program/c++/Media/player/vlcpp/include/a.cpp

player/CMakeFiles/player.dir/vlcpp/include/a.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/player.dir/vlcpp/include/a.cpp.i"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjh/program/c++/Media/player/vlcpp/include/a.cpp > CMakeFiles/player.dir/vlcpp/include/a.cpp.i

player/CMakeFiles/player.dir/vlcpp/include/a.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/player.dir/vlcpp/include/a.cpp.s"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjh/program/c++/Media/player/vlcpp/include/a.cpp -o CMakeFiles/player.dir/vlcpp/include/a.cpp.s

player/CMakeFiles/player.dir/player.cpp.o: player/CMakeFiles/player.dir/flags.make
player/CMakeFiles/player.dir/player.cpp.o: ../player/player.cpp
player/CMakeFiles/player.dir/player.cpp.o: player/CMakeFiles/player.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object player/CMakeFiles/player.dir/player.cpp.o"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT player/CMakeFiles/player.dir/player.cpp.o -MF CMakeFiles/player.dir/player.cpp.o.d -o CMakeFiles/player.dir/player.cpp.o -c /home/zjh/program/c++/Media/player/player.cpp

player/CMakeFiles/player.dir/player.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/player.dir/player.cpp.i"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjh/program/c++/Media/player/player.cpp > CMakeFiles/player.dir/player.cpp.i

player/CMakeFiles/player.dir/player.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/player.dir/player.cpp.s"
	cd /home/zjh/program/c++/Media/build/player && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjh/program/c++/Media/player/player.cpp -o CMakeFiles/player.dir/player.cpp.s

# Object files for target player
player_OBJECTS = \
"CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/player.dir/vlcpp/include/a.cpp.o" \
"CMakeFiles/player.dir/player.cpp.o"

# External object files for target player
player_EXTERNAL_OBJECTS =

player/libplayer.so: player/CMakeFiles/player.dir/player_autogen/mocs_compilation.cpp.o
player/libplayer.so: player/CMakeFiles/player.dir/vlcpp/include/a.cpp.o
player/libplayer.so: player/CMakeFiles/player.dir/player.cpp.o
player/libplayer.so: player/CMakeFiles/player.dir/build.make
player/libplayer.so: ../player/vlcpp/lib/libvlc.so
player/libplayer.so: ../player/vlcpp/lib/libvlccore.so
player/libplayer.so: player/CMakeFiles/player.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library libplayer.so"
	cd /home/zjh/program/c++/Media/build/player && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/player.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
player/CMakeFiles/player.dir/build: player/libplayer.so
.PHONY : player/CMakeFiles/player.dir/build

player/CMakeFiles/player.dir/clean:
	cd /home/zjh/program/c++/Media/build/player && $(CMAKE_COMMAND) -P CMakeFiles/player.dir/cmake_clean.cmake
.PHONY : player/CMakeFiles/player.dir/clean

player/CMakeFiles/player.dir/depend:
	cd /home/zjh/program/c++/Media/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zjh/program/c++/Media /home/zjh/program/c++/Media/player /home/zjh/program/c++/Media/build /home/zjh/program/c++/Media/build/player /home/zjh/program/c++/Media/build/player/CMakeFiles/player.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : player/CMakeFiles/player.dir/depend
