# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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
CMAKE_SOURCE_DIR = /home/zihaoye/Documents/EECS583_Project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zihaoye/Documents/EECS583_Project/build

# Utility rule file for install-CoalPass-stripped.

# Include any custom commands dependencies for this target.
include coalpass/CMakeFiles/install-CoalPass-stripped.dir/compiler_depend.make

# Include the progress variables for this target.
include coalpass/CMakeFiles/install-CoalPass-stripped.dir/progress.make

coalpass/CMakeFiles/install-CoalPass-stripped:
	cd /home/zihaoye/Documents/EECS583_Project/build/coalpass && /usr/bin/cmake -DCMAKE_INSTALL_COMPONENT="CoalPass" -DCMAKE_INSTALL_DO_STRIP=1 -P /home/zihaoye/Documents/EECS583_Project/build/cmake_install.cmake

install-CoalPass-stripped: coalpass/CMakeFiles/install-CoalPass-stripped
install-CoalPass-stripped: coalpass/CMakeFiles/install-CoalPass-stripped.dir/build.make
.PHONY : install-CoalPass-stripped

# Rule to build all files generated by this target.
coalpass/CMakeFiles/install-CoalPass-stripped.dir/build: install-CoalPass-stripped
.PHONY : coalpass/CMakeFiles/install-CoalPass-stripped.dir/build

coalpass/CMakeFiles/install-CoalPass-stripped.dir/clean:
	cd /home/zihaoye/Documents/EECS583_Project/build/coalpass && $(CMAKE_COMMAND) -P CMakeFiles/install-CoalPass-stripped.dir/cmake_clean.cmake
.PHONY : coalpass/CMakeFiles/install-CoalPass-stripped.dir/clean

coalpass/CMakeFiles/install-CoalPass-stripped.dir/depend:
	cd /home/zihaoye/Documents/EECS583_Project/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zihaoye/Documents/EECS583_Project /home/zihaoye/Documents/EECS583_Project/coalpass /home/zihaoye/Documents/EECS583_Project/build /home/zihaoye/Documents/EECS583_Project/build/coalpass /home/zihaoye/Documents/EECS583_Project/build/coalpass/CMakeFiles/install-CoalPass-stripped.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : coalpass/CMakeFiles/install-CoalPass-stripped.dir/depend

