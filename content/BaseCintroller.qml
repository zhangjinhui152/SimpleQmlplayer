import QtQuick 2.15
import QtQuick.Controls 2.15
import my_player 1.0
Item {
    width: 700
    height: 100


    BaseControllerForm{
        mediaList_mouseArea.onClicked: {

            if(!clickAnimation_mediaList.running){

                clickAnimation_mediaList.running = true;
                if(!clickAnimation_mediaList.ifRotation){
                    clickAnimation_mediaList.angle = 180
                    clickAnimation_mediaList.ifRotation = true
                }
                else{
                    clickAnimation_mediaList.angle = 0
                    clickAnimation_mediaList.ifRotation =false
                }
            }


        }
        media_pause_mouseArea.onClicked: {


            if(!clickAnimation_media_pause.running){

                if(clickAnimation_media_pause.isPause){
                    clickAnimation_media_pause.img_src="image/controller/暂停_pause.svg"
                    clickAnimation_media_pause.isPause = false;
//                    Player.play()
                }
                else{
                    clickAnimation_media_pause.img_src="image/controller/play.svg"
                    clickAnimation_media_pause.isPause = true;

                    Player.pause()
                }
                clickAnimation_media_pause.running = true
            }
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
