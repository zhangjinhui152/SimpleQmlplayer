cmake_minimum_required(VERSION 3.23)

project(MediaApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Gui Qml Quick)

qt_add_executable(MediaApp src/main.cpp src/qtplayer.cpp src/qtplayer.h)

set(qml_res

    "content/image/controller/播放一次_play-once.svg"
    "content/image/controller/汉堡图标_hamburger-button.svg"
    "content/image/controller/上一曲_go-start.svg"
    "content/image/controller/声音-大_volume-notice.svg"
    "content/image/controller/收起菜单1_menu-fold-one.svg"
    "content/image/controller/添加列表_list-add.svg"
    "content/image/controller/添加音乐_add-music.svg"
    "content/image/controller/洗牌_shuffle-one.svg"
    "content/image/controller/下一曲_go-end.svg"
    "content/image/controller/暂停_pause.svg"
    "content/image/controller/展开菜单1_menu-unfold-one.svg"
    "content/image/controller/展开菜单_menu-unfold.svg"
    "content/image/controller/play.svg"


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
