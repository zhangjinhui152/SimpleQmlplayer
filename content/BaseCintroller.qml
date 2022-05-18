import QtQuick 2.15
import QtQuick.Controls 2.15
import my_player 1.0
Item {


    Connections {
        target: Player
        onChangeMedia: baseControllerForm.changeMediaLoad();
    }

    width: 900
    height: 500
    MediaList{
        x: 0
        y: 227
        width: 297
        height: 101
    }

    BaseControllerForm{

        id:baseControllerForm
        x: 0
        y: 128

        function changeMediaLoad(){
            let duration = Player.get_duration();
            transformTime(duration);
        }

        function transformTime(time){
            let sec = Math.floor((time/1000) % 60);
            let min = Math.floor((time/1000/60) << 0)

            let strTime = min+":"+sec
            latsTimeText  = strTime
            slider.from = 0
            slider.to = time/1000
            slider.value = 0;
            currTime.text = strTime;
            console.log(strTime)
        }

        Timer{
            interval: 1000; running: true; repeat: true
                   onTriggered: {
                       let time = 0;
                       let sec = Math.floor((time/1000) % 60);
                       let min = Math.floor((time/1000/60) << 0)
                       let strTime = min+":"+sec
                       console.log()
                   }
        }

        volume_silde.onMoved: {
            emit:Player.setVolume(volume_silde.value)

        }
        slider.onMoved: {

            let seek = (slider.value /slider.to)*100;
            console.log(seek);
            emit:Player.setDurationSlot(seek);
        }


        mediaNext_mouseArea.onClicked: {
            clickAnimation_next.running = true;
            Player.next()

        }
        media_mouseArea_Prev.onClicked: {
            clickAnimation_Prev.running = true;
            Player.previous()
        }

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
//                    Player.openfile("a4.mp3");
                    Player.play()
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
