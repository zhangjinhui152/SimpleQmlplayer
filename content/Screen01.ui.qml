

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Media
import FlowView 6.0
import QtQuick.Layouts 6.0

Rectangle {
    id: rectangle
    width: 400
    height: 700

    color: Constants.backgroundColor
    state: "State1"

    Text {
        id: text1
        color: "#820909"
        text: qsTr("Hello Me1di1111a")
        transformOrigin: Item.Left
        anchors.centerIn: parent
        font.family: Constants.font.family
    }

    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: rectangle
                color: "#e45b5b"
            }
        },
        State {
            name: "State2"

            PropertyChanges {
                target: text1
                color: "#f6d2d2"
            }
        }
    ]
}
