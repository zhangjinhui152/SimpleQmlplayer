cmake_minimum_required(VERSION 3.23)
set(CMAKE_AUTORCC ON)
project(MediaApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Gui Qml Quick)


qt_add_executable(MediaApp src/main.cpp src/qtplayer.cpp src/qtplayer.h res.qrc src/configread.h src/configread.cpp)


qt_add_resources(MediaApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
        ${qml_res}
)
add_subdirectory(player)

target_link_libraries(MediaApp PUBLIC my_player)
target_link_libraries(MediaApp PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
)
include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
