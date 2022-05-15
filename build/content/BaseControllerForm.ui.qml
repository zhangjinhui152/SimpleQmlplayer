

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.14

Item {
    id: bc
    width: 700
    height: 100
    property alias clickAnimation_media_pause: clickAnimation_media_pause
    property alias volumenotice_mouseArea: volumenotice_mouseArea
    property alias latsTime: latsTime
    property alias slider: slider
    property alias currTime: currTime
    property alias mediaPlay_mouseArea: mediaPlay_mouseArea
    property alias media_pause_mouseArea: media_pause_mouseArea
    property alias media_mouseArea: media_mouseArea
    property alias mediaList_mouseArea: mediaList_mouseArea
    property alias clickAnimation_mediaList: clickAnimation_mediaList

    Image {
        id: mediaList
        x: 0
        y: 0
        width: 50
        height: 100
        source: "image/controller/展开菜单1_menu-unfold-one.svg"
        fillMode: Image.PreserveAspectFit
        SequentialAnimation {
            id: clickAnimation_mediaList
            property var target_name: mediaList
            property bool ifRotation: false
            property int angle: 180
            property string img_src: "image/controller/上一曲_go-start.svg"
            running: false
            NumberAnimation {
                target: clickAnimation_mediaList.target_name
                property: "rotation"
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                to: clickAnimation_mediaList.angle
                duration: 500
            }
            PropertyAnimation {
                target: clickAnimation_mediaList
                property: "running"
                to: false
                duration: 5
            }
        }

        MouseArea {

            id: mediaList_mouseArea
            x: mediaList.x
            y: mediaList.y
            width: mediaList.width
            height: mediaList.height
        }
    }

    Image {
        id: mediaPrev
        x: 56
        y: 0
        width: 50
        height: 100

        source: "image/controller/上一曲_go-start.svg"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            id: media_mouseArea
            anchors.fill: parent
        }
    }
    Image {
        id: mediaPlay
        x: 168
        y: 0
        width: 50
        height: 100

        source: "image/controller/下一曲_go-end.svg"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            id: mediaPlay_mouseArea
            anchors.fill: parent
        }
    }

    Image {
        id: media_pause
        x: 112
        y: 0
        width: 50
        height: 100
        source: "image/controller/play.svg"
        fillMode: Image.PreserveAspectFit
        SequentialAnimation {
            id: clickAnimation_media_pause
            property var target_name: media_pause
            property string img_src: "image/controller/play.svg"
            property bool isPause: true
            running: false
            NumberAnimation {
                target: clickAnimation_media_pause.target_name
                property: "scale"
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                to: 0
                duration: 250
            }
            PropertyAnimation {
                id: propertyAnimation
                target: clickAnimation_media_pause.target_name
                property: "source"
                to: clickAnimation_media_pause.img_src
                duration: 10
            }

            NumberAnimation {
                target: clickAnimation_media_pause.target_name
                property: "scale"
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                to: 1
                duration: 250
            }
            PropertyAnimation {
                target: clickAnimation_media_pause
                property: "running"
                to: false
                duration: 5
            }
        }

        MouseArea {
            id: media_pause_mouseArea
            anchors.fill: parent
        }
    }
    Slider {
        id: slider
        x: 285
        y: 39
        width: 286
        height: 22
        value: 0.5
    }

    Image {
        id: volumenotice
        x: 650
        y: 1
        width: 50
        height: 100
        source: "image/controller/声音-大_volume-notice.svg"
        fillMode: Image.PreserveAspectFit
        MouseArea {
            id: volumenotice_mouseArea
            anchors.fill: parent
        }
    }

    Text {
        id: currTime
        x: 231
        y: 39
        width: 40
        height: 24
        text: qsTr("0.00")
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: latsTime
        x: 586
        y: 39
        width: 40
        height: 24
        text: qsTr("0.00")
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
    }
}