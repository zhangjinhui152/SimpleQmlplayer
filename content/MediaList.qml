import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: mediaList
    width: 900
    height: 350
    property alias sing_current_img: sing_current_img.source
    property alias mediaList_listView: listView
    property alias mediaList_listModel: song_List_Model


    ListView {
        z: 1
        id: listView
        x: 450
        y: 25
        width: parent.width/2
        height: parent.height - 50
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
        x: 25
        y: 17
        width: parent.width/3
        height: parent.height - 50

        source: "image/controller/defaultDisk.png"

    }



}


