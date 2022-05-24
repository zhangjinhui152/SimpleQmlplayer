import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "Config.js" as Config
import my_player
Item {
    id: mediaList
    width: Config.windwosWidth
    height: Config.windwosHeight
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

    Loader{
        id:loadStyle
        anchors.fill:sing_current_img_bg
        sourceComponent: Config.changeBgEffect(ConfigRead.configMap["bg_blur_effect"])
        width: sing_current_img_bg.width
        height: sing_current_img_bg.height


    }
    Image {
        id: sing_current_img_bg
        y: -parent.height/2

        width: parent.width
        source: "image/controller/bg_test.png"
        fillMode: Image.PreserveAspectCrop
        z: -1
        opacity: 1
        clip: true
    }


    Component{
        id:blurImage
        FastBlur {
               anchors.fill: sing_current_img_bg
               source: sing_current_img_bg
               radius:ConfigRead.getConfigMap()["bg_blur_num"]
         }

    }
    Component{
        id:transparentImage
        Rectangle{
            anchors.fill: sing_current_img_bg
            color: Qt.rgba(255,255,255, ConfigRead.getConfigMap()["bg_effect_transparent_num"]);
            z: 1
        }

    }




}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
