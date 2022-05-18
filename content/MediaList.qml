import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: mediaList
    width: 300
    height: 400
    Filebuttom{
        width:  mediaList.width /2
        height: 30
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.topMargin: 0
        z: 2
    }
    FolderButtom{
        x: 150
        width:  mediaList.width /2
        height: 30
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        z: 2
    }
    ListView {
        z: 1
        id: listView
        x: 0
        y: 30
        width: 300
        height: 370
        delegate:Row {

            width: 200
            height: 60
            spacing: 10
            Image {
                width: 50
                height: 50
                id: test1
                y:5
                source: "file:///home/zjh/.cache/vlc/art/artistalbum/%E5%A4%9A%E7%94%B0%E8%91%B5/Word%20of%20Dawn/art"
            }

            Column {
                y:5
                width: 140
                height: 50
                Text {
                    text: qsTr("1")

                    font.bold: true
                }
                Text {
                    text: qsTr("song")
                    horizontalAlignment: Text.AlignLeft
                    font.italic: false
                    font.bold: false
                }
                Text {
                    text: qsTr("auotur")
                    horizontalAlignment: Text.AlignLeft
                    font.italic: false
                    font.bold: true
                }
            }


        }

        model: ListModel {

            ListElement{

            }



        }
    }



}
