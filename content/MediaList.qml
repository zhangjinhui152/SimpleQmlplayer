import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: mediaList
    width: 300
    height: 200
    property alias mediaList_listView: listView
     property alias mediaList_listModel: song_List_Model

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
        y: 30
        width: 142
        height: parent.height - 50
        anchors.left: parent.left
        anchors.leftMargin: 4

        delegate:Song{
            song_text: songName
            img_src: imgSrc
            author_Text:authorText
            album_Text: albumText
            index:itemIndex
        }

        model: ListModel {
            id: song_List_Model

        }
    }


}
