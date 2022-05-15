

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 1920
    height: 1080
    Rectangle {
        y: win.height / 2
        id: source
        width: 100
        height: 100
        color: "red"
    }
    NumberAnimation {
        id: xChange
        target: source
        to: win.width - source.width
        property: "x"
        duration: 5000
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id: rotationChange
        target: source
        to: 360 * 5
        property: "rotation"
        duration: 5000
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id: radiusChange
        target: source
        to: 100
        property: "radius"
        duration: 5000
        easing.type: Easing.InOutQuad
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            xChange.start()
            rotationChange.start()
            radiusChange.start()
        }
    }
}
