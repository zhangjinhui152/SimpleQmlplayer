cmake_minimum_required(VERSION 3.23)

project(MediaApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Gui Qml Quick )


qt_add_executable(MediaApp src/main.cpp src/qtplayer.cpp src/qtplayer.h res.qrc)

set(qml_res

    "content/image/controller/play-once.svg"
    "content/image/controller/hamburger-button.svg"
    "content/image/controller/go-start.svg"
    "content/image/controller/volume-notice.svg"
    "content/image/controller/menu-fold-one.svg"
    "content/image/controller/list-add.svg"
    "content/image/controller/add-music.svg"
    "content/image/controller/shuffle-one.svg"
    "content/image/controller/go-end.svg"
    "content/image/controller/pause.svg"
    "content/image/controller/menu-unfold-one.svg"
    "content/image/controller/menu-unfold.svg"
    "content/image/controller/play.svg"
    "content/image/controller/defaultDisk.png"
    "content/image/controller/bg_test.png"


)
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
