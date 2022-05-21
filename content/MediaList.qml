import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
Item {
    id: mediaList
    width: 900
    height: 400
    property alias sing_current_img: sing_current_img.source
    property alias sing_current_img_bg: sing_current_img_bg.source

    property alias mediaList_listView: listView
    property alias mediaList_listModel: song_List_Model


        ListView {
            z: 1
            id: listView
            x: 450
            y: 25
            width: parent.width/2
            height: parent.height - 120
            highlight: Rectangle { color: Qt.rgba(0,0,0,0.2); radius: 5 }
            focus: true
            clip: true
            highlightMoveDuration:100
            highlightMoveVelocity:50
            delegate:Song{
                id:my_song_myBeat
                song_text: songName
                img_src: imgSrc
                author_Text:authorText
                album_Text: albumText
                index:itemIndex
            }

            model: ListModel {
                id: song_List_Model
    //            ListElement{

    //            }
    //            ListElement{

    //            }
    //            ListElement{

    //            }
            }
        }



    BorderImage {
        id: sing_current_img
        x: 50
        y: 50
        width: 227
        height: 228


        source: "image/controller/defaultDisk.png"
        z: 1

    }

    Image {
        id: sing_current_img_bg
        x: 48
        y: -116
        width: 852
        height: 595
        source: "image/controller/bg_test.png"
        z: -1
        fillMode: Image.PreserveAspectFit

        clip: true
    }
    FastBlur {
           anchors.fill: sing_current_img_bg
           source: sing_current_img_bg
           anchors.rightMargin: -185
           anchors.bottomMargin: -120
           anchors.leftMargin: -230
           anchors.topMargin: -149
           radius:64
     }


}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
