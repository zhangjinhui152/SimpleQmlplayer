cmake_minimum_required(VERSION 3.18)

project(MediaApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Gui Qml Quick)

qt_add_executable(MediaApp src/main.cpp)
set(qml_res
    "content/image/controller/player.svg"

)
qt_add_resources(MediaApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
        ${qml_res}
)

target_link_libraries(MediaApp PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
)

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
