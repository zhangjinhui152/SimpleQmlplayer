import QtQuick 2.0
import my_player 1.0
Item {
    id:my_song
    width: 200
    height: 60
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
            changeMedia()
            console.log(my_song.index)
        }
    }

    Row {
        x: 0
        y: 0
        width: 200
        height: 60
        spacing: 10
        Image {
            id:songImg
            width: 50
            height: 50
            y:5
            source: "file:///home/zjh/.cache/vlc/art/artistalbum/%E5%A4%9A%E7%94%B0%E8%91%B5/Word%20of%20Dawn/art"
            sourceSize.height: 50
            sourceSize.width: 50
        }

        Column {
            y:5
            width: 140
            height: 50
            Text {
                id:album
                width: parent.width
                text: qsTr("1")
                font.bold: true
                clip: true
                elide: Text.ElideRight
            }
            Text {
                id:songText
                width: parent.width
                text: qsTr("song")
                horizontalAlignment: Text.AlignLeft
                font.italic: false
                font.bold: false
                clip: true
                elide: Text.ElideRight
            }
            Text {
                id:authorText
                width: parent.width
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
    D{i:0;formeditorZoom:2}
}
##^##*/
