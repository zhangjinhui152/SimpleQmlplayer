import QtQuick 2.0
import my_player 1.0
Item {
    id:my_song
    width: 400
    height: 100
    signal changeMedia()
    property int index: 0
    property alias img_src: songImg.source
    property alias album_Text: album.text
    property alias author_Text: authorText.text
    property alias song_text: songText.text
    MouseArea{
        width: parent.width
        height: parent.height
        id:click_song
        onClicked: {
            Player.play_index(my_song.index)
            console.log(my_song.index)
        }
    }

    Item {
        id: row
        x: 0
        y: 0
        width: parent.width
        height:parent.height
//        spacing: 10
        Image {
            id:songImg
            width: 0.8*parent.height
            height: 0.8*parent.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: "   file:///home/zjh/.cache/vlc/art/artistalbum/%E5%A4%9A%E7%94%B0%E8%91%B5/Word%20of%20Dawn/art"
            anchors.leftMargin: 5
            sourceSize.height: 50
            sourceSize.width: 50
        }

        Column {
            width: parent.width*0.75
            height: 0.8*parent.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            Text {
                id:album
                width: parent.width
                height: parent.height/3
                text: qsTr("1")
                font.bold: true
                clip: true
                elide: Text.ElideRight
            }
            Text {
                id:songText
                width: parent.width
                text: qsTr("song")
                height: parent.height/3
                horizontalAlignment: Text.AlignLeft
                font.italic: false
                font.bold: false
                clip: true
                elide: Text.ElideRight
            }
            Text {
                id:authorText
                width: parent.width
                height: parent.height/3
                text: qsTr("auot111111111111111ur")
                horizontalAlignment: Text.AlignLeft
                font.italic: false
                font.bold: true
                clip: true
                elide: Text.ElideRight
            }
        }


    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}D{i:3}D{i:4}
}
##^##*/
