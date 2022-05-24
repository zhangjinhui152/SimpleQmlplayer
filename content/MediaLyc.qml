import QtQuick 2.0
import QtQuick.Controls 6.3
import QtQuick.Layouts 6.3
import "Config.js" as Config
Item {
    id: listView_lyc_page
    property alias listView_lyc: listView_lyc
    property alias listModel_lyc: listModel_lyc
    width: Config.windwosWidth
    ListView {
        id: listView_lyc
        height: parent.height*0.7
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenterOffset: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        highlightMoveDuration:1250
        preferredHighlightBegin:70
        preferredHighlightEnd:80
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        delegate: Item {
            width: Config.windwosWidth
            height: 50
            Text {
                width: parent.width
                height: 50
                text: lyc
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                font.bold: fontBold
                font.italic: false
                font.family: "Source Code Pro"
                font.pointSize: 18

            }
            clip: true
        }
        model: ListModel {
            id:listModel_lyc
            ListElement {
                lyc:"-----Test-----"
                fontBold:true
            }
            ListElement {
                lyc:"-----Test-----"
                fontBold:true
            }
            ListElement {
                lyc:"-----Test-----"
                fontBold:true
            }



        }

    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/