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
        anchors.verticalCenterOffset: -72
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        highlightMoveDuration:1250
        preferredHighlightBegin:180
        preferredHighlightEnd:200
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlight: Rectangle { color: Qt.rgba(255,255,255,0); radius: 5 }
        delegate: Item {
            id: item1
            width: Config.windwosWidth
            property alias font_Bold: my_lyc_text.font.bold
            height: 50
            Text {
                id:my_lyc_text
                width: parent.width
                height: 50
                text: lyc
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeightMode: Text.FixedHeight
                anchors.horizontalCenter: parent.horizontalCenter
                font.strikeout: false
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
                fontBold:false
            }
            ListElement {
                lyc:"-----Test-----"
                fontBold:false
            }
            ListElement {
                lyc:"-----Test-----"
                fontBold:false
            }



        }

    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
