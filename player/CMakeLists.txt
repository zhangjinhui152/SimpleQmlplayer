cmake_minimum_required(VERSION 3.23)

# aux_source_directory(./vlcpp VLC_CPP)
file(GLOB_RECURSE VLC_CPP vlcpp/include/*pp)
file(GLOB_RECURSE VLC_H  vlcpp/include/vlc/*.h)
file(GLOB_RECURSE VLC_L vlcpp/lib/*.so*)

message(STATUS "HOW IS ${VLC_CPP}" )
message(STATUS "HOW IS ${VLC_H}" )
message(STATUS "HOW IS ${VLC_L}" )


# add_executable(a1 main.cpp ${VLC_CPP} ${VLC_H} player.h player.cpp )
add_library(my_player SHARED ${VLC_CPP} ${VLC_H} player.h player.cpp)
# set_target_properties(VLC_LIB PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(my_player  ${VLC_L})
