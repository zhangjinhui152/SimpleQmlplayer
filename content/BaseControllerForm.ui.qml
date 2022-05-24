

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.14
import "Config.js" as Config

Item {

    id: bc
    width: Config.windwosWidth
    height: 100
    property alias folderOpenLyc: folderOpenLyc
    property alias folderOpen: folderOpen
    property alias addt_Menu: addt_Menu
    property alias mouseArea_addt_Menu: mouseArea_addt_Menu
    property string latsTimeText: "0.00"
    property alias volume_silde: volume_silde
    property alias volumenotice: volumenotice
    property alias media_mouseArea_Prev: media_mouseArea_Prev

    property alias mediaNext_mouseArea: mediaNext_mouseArea
    property alias clickAnimation_next: clickAnimation_next
    property alias clickAnimation_Prev: clickAnimation_Prev
    property alias clickAnimation_media_pause: clickAnimation_media_pause
    property alias volumenotice_mouseArea: volumenotice_mouseArea
    property alias slider: slider
    property alias currTime: currTime
    //    property alias mediaPlay_mouseArea: mediaPlay_mouseArea
    property alias media_pause_mouseArea: media_pause_mouseArea
    property alias mediaList_mouseArea: mediaList_mouseArea
    property alias clickAnimation_mediaList: clickAnimation_mediaList

    Image {
        id: mediaList
        x: 209
        width: Config.config.controls_size
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        sourceSize.height: 50
        sourceSize.width: 50
        source: "image/controller/24gl-playlist.svg"
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit
        SequentialAnimation {
            id: clickAnimation_mediaList
            property var target_name: mediaList
            property bool ifRotation: false
            property int angle: 180
            property string img_src: "image/controller/go-start.svg"
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
            anchors.fill: parent
        }
    }

    Image {
        id: mediaPrev
        x: 352
        width: Config.config.controls_size
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        sourceSize.height: 50
        sourceSize.width: 50
        source: "image/controller/24gl-previous.svg"
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit
        SequentialAnimation {
            id: clickAnimation_Prev
            property var target_name: mediaPrev
            running: false
            NumberAnimation {
                target: clickAnimation_Prev.target_name
                property: "scale"
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                to: 0
                duration: 300
            }
            NumberAnimation {
                target: clickAnimation_Prev.target_name
                property: "scale"
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                to: 1
                duration: 300
            }
            PropertyAnimation {
                target: clickAnimation_Prev
                property: "running"
                to: false
                duration: 5
            }
        }
        MouseArea {
            id: media_mouseArea_Prev
            anchors.fill: parent
        }
    }
    Image {
        id: mediaNext
        x: 521
        y: 0
        width: Config.config.controls_size
        height: parent.height

        sourceSize.height: 50
        sourceSize.width: 50
        source: "image/controller/24gl-next.svg"
        fillMode: Image.PreserveAspectFit
        SequentialAnimation {
            id: clickAnimation_next
            property var target_name: mediaNext
            running: false
            NumberAnimation {
                target: clickAnimation_next.target_name
                property: "scale"
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                to: 0
                duration: 300
            }
            NumberAnimation {
                target: clickAnimation_next.target_name
                property: "scale"
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                to: 1
                duration: 300
            }
            PropertyAnimation {
                target: clickAnimation_next
                property: "running"
                to: false
                duration: 5
            }
        }
        MouseArea {
            id: mediaNext_mouseArea
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
        }
    }

    Image {
        id: media_pause
        width: Config.config.controls_size
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        sourceSize.height: 50
        sourceSize.width: 50
        source: "image/controller/24gl-play.svg"
        smooth: true
        scale: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
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
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
        }
    }

    Image {
        id: volumenotice
        x: 696
        width: Config.config.controls_size
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        source: "image/controller/24gl-volumeMiddle.svg"
        anchors.verticalCenterOffset: 0
        sourceSize.height: 50
        sourceSize.width: 50
        fillMode: Image.PreserveAspectFit
        MouseArea {
            id: volumenotice_mouseArea
            anchors.fill: parent
        }
        Slider {
            id: volume_silde
            width: 133
            height: 22
            anchors.verticalCenter: parent.verticalCenter
            from: 0
            to: 100
            anchors.left: parent.left
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 43
            value: 50
        }
    }

    Text {
        id: text1
        x: 88
        width: 7
        height: 16
        color: "#1943e7"
        text: qsTr("/")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
    }

    Text {
        id: currTime
        x: 50
        width: 40
        height: parent.height
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 0
        text: qsTr("0.00")
        elide: Text.ElideMiddle
        anchors.verticalCenter: parent.verticalCenter
        layer.mipmap: false
        layer.wrapMode: ShaderEffectSource.ClampToEdge
        style: Text.Normal
        textFormat: Text.PlainText
        font.styleName: "Medium"
        fontSizeMode: Text.HorizontalFit
    }
    Slider {
        id: slider

        height: 25
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: -10

        value: 0.5
    }

    Text {
        id: latsTime
        x: 96
        width: 40
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 0
        height: parent.height
        color: "#143cd9"
        text: bc.latsTimeText
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: add_music
        x: 273

        width: Config.config.controls_size
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        sourceSize.height: 50
        sourceSize.width: 50
        source: "image/controller/24gl-playlistMusic4.svg"
        anchors.verticalCenterOffset: 0
        fillMode: Image.PreserveAspectFit
        MouseArea {
            id: mouseArea_addt_Menu
            anchors.fill: parent
        }
        Menu {
            focus: true
            id: addt_Menu

            MenuItem {
                id: folderOpen
                text: "打开文件夹"
            }
            MenuItem {
                id: folderOpenLyc
                text: "打开歌词文件夹"
            }
            MenuItem {
                text: "cancle"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/

