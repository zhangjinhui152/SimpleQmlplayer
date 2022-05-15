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

# Utility rule file for MediaApp_qmltyperegistration.

# Include any custom commands dependencies for this target.
include CMakeFiles/MediaApp_qmltyperegistration.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MediaApp_qmltyperegistration.dir/progress.make

CMakeFiles/MediaApp_qmltyperegistration: mediaapp_qmltyperegistrations.cpp
CMakeFiles/MediaApp_qmltyperegistration: Main/MediaApp.qmltypes

mediaapp_qmltyperegistrations.cpp: qmltypes/MediaApp_foreign_types.txt
mediaapp_qmltyperegistrations.cpp: meta_types/qt6mediaapp_debug_metatypes.json
mediaapp_qmltyperegistrations.cpp: /usr/lib/qt6/qmltyperegistrar
mediaapp_qmltyperegistrations.cpp: /usr/lib/metatypes/qt6core_relwithdebinfo_metatypes.json
mediaapp_qmltyperegistrations.cpp: /usr/lib/metatypes/qt6gui_relwithdebinfo_metatypes.json
mediaapp_qmltyperegistrations.cpp: /usr/lib/metatypes/qt6quick_relwithdebinfo_metatypes.json
mediaapp_qmltyperegistrations.cpp: /usr/lib/metatypes/qt6qml_relwithdebinfo_metatypes.json
mediaapp_qmltyperegistrations.cpp: /usr/lib/metatypes/qt6network_relwithdebinfo_metatypes.json
mediaapp_qmltyperegistrations.cpp: /usr/lib/metatypes/qt6qmlmodels_relwithdebinfo_metatypes.json
mediaapp_qmltyperegistrations.cpp: /usr/lib/metatypes/qt6opengl_relwithdebinfo_metatypes.json
mediaapp_qmltyperegistrations.cpp: CMakeFiles/MediaApp_qmltyperegistration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic QML type registration for target MediaApp"
	/usr/lib/qt6/qmltyperegistrar --generate-qmltypes=/home/zjh/program/c++/Media/build/Main/MediaApp.qmltypes --import-name=Main --major-version=1 --minor-version=0 @/home/zjh/program/c++/Media/build/qmltypes/MediaApp_foreign_types.txt -o /home/zjh/program/c++/Media/build/mediaapp_qmltyperegistrations.cpp /home/zjh/program/c++/Media/build/meta_types/qt6mediaapp_debug_metatypes.json
	/usr/bin/cmake -E make_directory /home/zjh/program/c++/Media/build/.generated
	/usr/bin/cmake -E touch /home/zjh/program/c++/Media/build/.generated/MediaApp.qmltypes

Main/MediaApp.qmltypes: mediaapp_qmltyperegistrations.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate Main/MediaApp.qmltypes

meta_types/qt6mediaapp_debug_metatypes.json.gen: /usr/lib/qt6/moc
meta_types/qt6mediaapp_debug_metatypes.json.gen: meta_types/MediaApp_json_file_list.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zjh/program/c++/Media/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Running moc --collect-json for target MediaApp"
	/usr/lib/qt6/moc -o /home/zjh/program/c++/Media/build/meta_types/qt6mediaapp_debug_metatypes.json.gen --collect-json @/home/zjh/program/c++/Media/build/meta_types/MediaApp_json_file_list.txt
	/usr/bin/cmake -E copy_if_different /home/zjh/program/c++/Media/build/meta_types/qt6mediaapp_debug_metatypes.json.gen /home/zjh/program/c++/Media/build/meta_types/qt6mediaapp_debug_metatypes.json

meta_types/qt6mediaapp_debug_metatypes.json: meta_types/qt6mediaapp_debug_metatypes.json.gen
	@$(CMAKE_COMMAND) -E touch_nocreate meta_types/qt6mediaapp_debug_metatypes.json

MediaApp_qmltyperegistration: CMakeFiles/MediaApp_qmltyperegistration
MediaApp_qmltyperegistration: Main/MediaApp.qmltypes
MediaApp_qmltyperegistration: mediaapp_qmltyperegistrations.cpp
MediaApp_qmltyperegistration: meta_types/qt6mediaapp_debug_metatypes.json
MediaApp_qmltyperegistration: meta_types/qt6mediaapp_debug_metatypes.json.gen
MediaApp_qmltyperegistration: CMakeFiles/MediaApp_qmltyperegistration.dir/build.make
.PHONY : MediaApp_qmltyperegistration

# Rule to build all files generated by this target.
CMakeFiles/MediaApp_qmltyperegistration.dir/build: MediaApp_qmltyperegistration
.PHONY : CMakeFiles/MediaApp_qmltyperegistration.dir/build

CMakeFiles/MediaApp_qmltyperegistration.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MediaApp_qmltyperegistration.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MediaApp_qmltyperegistration.dir/clean

CMakeFiles/MediaApp_qmltyperegistration.dir/depend:
	cd /home/zjh/program/c++/Media/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zjh/program/c++/Media /home/zjh/program/c++/Media /home/zjh/program/c++/Media/build /home/zjh/program/c++/Media/build /home/zjh/program/c++/Media/build/CMakeFiles/MediaApp_qmltyperegistration.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MediaApp_qmltyperegistration.dir/depend
