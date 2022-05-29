import QtQuick 2.0

ListView {
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
            source: "/home/zjh/.cache/vlc/art/artistalbum/多田葵/Word of Dawn/art"
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



        ListElement{

        }

        ListElement{

        }


        ListElement{

        }



        ListElement{

        }

        ListElement{

        }
        ListElement{

        }



        ListElement{

        }

        ListElement{

        }
        ListElement{

        }



        ListElement{

        }

        ListElement{

        }



    }
}

