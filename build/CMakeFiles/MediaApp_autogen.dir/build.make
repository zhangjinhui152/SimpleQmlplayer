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

# Utility rule file for MediaApp_autogen.

# Include any custom commands dependencies for this target.
include CMakeFiles/MediaApp_autogen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MediaApp_autogen.dir/progress.make

CMakeFiles/MediaApp_autogen: .rcc/qmlcache/MediaApp_qmlcache_loader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC for target MediaApp"
	/usr/bin/cmake -E cmake_autogen /home/zjh/program/c++/Media/build/CMakeFiles/MediaApp_autogen.dir/AutogenInfo.json Debug

.rcc/qmlcache/MediaApp_qmlcache_loader.cpp: /usr/lib/qt6/qmlcachegen
.rcc/qmlcache/MediaApp_qmlcache_loader.cpp: .rcc/qmlcache/MediaApp_qml_loader_file_list.rsp
.rcc/qmlcache/MediaApp_qmlcache_loader.cpp: .rcc/configuration.qrc
.rcc/qmlcache/MediaApp_qmlcache_loader.cpp: .rcc/qmake_Main.qrc
.rcc/qmlcache/MediaApp_qmlcache_loader.cpp: .rcc/MediaApp_raw_qml_0.qrc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating .rcc/qmlcache/MediaApp_qmlcache_loader.cpp"
	/usr/lib/qt6/qmlcachegen --resource-name qmlcache_MediaApp --resource /home/zjh/program/c++/Media/build/.rcc/configuration.qrc --resource /home/zjh/program/c++/Media/build/.rcc/qmake_Main.qrc --resource /home/zjh/program/c++/Media/build/.rcc/MediaApp_raw_qml_0.qrc -o /home/zjh/program/c++/Media/build/.rcc/qmlcache/MediaApp_qmlcache_loader.cpp @/home/zjh/program/c++/Media/build/.rcc/qmlcache/MediaApp_qml_loader_file_list.rsp

MediaApp_autogen: .rcc/qmlcache/MediaApp_qmlcache_loader.cpp
MediaApp_autogen: CMakeFiles/MediaApp_autogen
MediaApp_autogen: CMakeFiles/MediaApp_autogen.dir/build.make
.PHONY : MediaApp_autogen

# Rule to build all files generated by this target.
CMakeFiles/MediaApp_autogen.dir/build: MediaApp_autogen
.PHONY : CMakeFiles/MediaApp_autogen.dir/build

CMakeFiles/MediaApp_autogen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MediaApp_autogen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MediaApp_autogen.dir/clean

CMakeFiles/MediaApp_autogen.dir/depend:
	cd /home/zjh/program/c++/Media/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zjh/program/c++/Media /home/zjh/program/c++/Media /home/zjh/program/c++/Media/build /home/zjh/program/c++/Media/build /home/zjh/program/c++/Media/build/CMakeFiles/MediaApp_autogen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MediaApp_autogen.dir/depend
