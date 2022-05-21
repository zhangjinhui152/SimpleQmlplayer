import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15


Item {
    width: 900
    height: 350
    property alias mediaListView: mediaListView
    property alias switchIndex: switchLayout.currentIndex
    SwipeView {
        id: switchLayout
        y: 0
        width: 100
        height: 400
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        currentIndex: 0

       MediaList{
           id:mediaListView
           clip: true
       }

        Item {
            Label {
                text: qsTr("Page 2")
                font.family: "Verdana"
                anchors.centerIn: parent

            }
        }
    }

    //    Button {
    //        id: switchButtom
    //        property int change: 0
    //        x: 0
    //        y: 0
    //        width: 700
    //        height: 31
    //        text: qsTr("switchButtom")
    //        onClicked: switchButtom.change = (switchButtom.change + 1) % 2
    //    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
