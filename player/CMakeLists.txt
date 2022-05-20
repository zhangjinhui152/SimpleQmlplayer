cmake_minimum_required(VERSION 3.23)
set(CMAKE_CXX_STANDARD 17)
# aux_source_directory(./vlcpp VLC_CPP)




file(GLOB_RECURSE VLC_CPP vlcpp/include/*pp)
file(GLOB_RECURSE VLC_H  vlcpp/include/vlc/*.h)

IF (CMAKE_SYSTEM_NAME MATCHES "Linux")
    file(GLOB_RECURSE VLC_L vlcpp/lib/*.so.*)
    MESSAGE(STATUS "current platform: Linux ")
    ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
file(GLOB_RECURSE VLC_L vlcpp/lib/*.dll)
    MESSAGE(STATUS "current platform: Windows")
ELSE ()
    MESSAGE(STATUS "other platform: ${CMAKE_SYSTEM_NAME}")
ENDIF (CMAKE_SYSTEM_NAME MATCHES "Linux")





message(STATUS "HOW IS ${VLC_CPP}" )
message(STATUS "HOW IS ${VLC_H}" )
message(STATUS "HOW IS ${VLC_L}" )


#add_executable(my_player main.cpp ${VLC_CPP} ${VLC_H} player.h my_player.h my_player.cpp my_player_list.h my_player_list.cpp)
add_library(my_player SHARED ${VLC_CPP} ${VLC_H} player.h my_player.h my_player.cpp my_player_list.h my_player_list.cpp)
#set_target_properties(VLC_LIB PROPERTIES LINKER_LANGUAGE CXX)
INCLUDE_DIRECTORIES(my_player PUBLIC player/vlcpp/inlcude/vlc)

target_link_libraries(my_player ${VLC_L})
