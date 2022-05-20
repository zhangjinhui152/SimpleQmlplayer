import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import my_player 1.0
Item {
    id: item1


    Connections {
        target: Player
        onChangeMedia: baseControllerForm.changeMediaLoad();
    }
    Connections {
        target: Player
        onAppendSong:function(value){
            mediaListView.mediaList_listModel.append({songName:value[0],authorText:value[1],albumText:value[2],imgSrc:value[3],itemIndex:value[4]});
            console.log("onAppendSong:function(value){"+value[0]);
            baseControllerForm.isFileExist = true;

            Player.play()
            Player.pause()
            let time = Player.get_duration();
            let sec = Math.floor((time/1000) % 60);
            let min = Math.floor((time/1000/60) << 0)

            if(sec<10){
                sec="0"+sec
            }
            let strTime = min+":"+sec
            baseControllerForm.latsTimeText  = strTime
            baseControllerForm.slider.from = 0
            baseControllerForm.slider.to = time/1000
            baseControllerForm.slider.value = 0;
        }
    }

    Item {
        width: parent.width /2
        height: parent.height /2
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Dialog {
            width: parent.width /2
            height: parent.height /2
            id: dialogFileExist
            modal: true
            title: "ERROR!"
            standardButtons: Dialog.Ok | Dialog.Cancel
            onAccepted: console.log("Ok clicked")
            onRejected: console.log("Cancel clicked")
            Text {
                text: qsTr("请选择文件")
            }
        }
    }
    width: 900
    height: 400
    MediaList{
        id:mediaListView
        x: 0
        y: 0
        width: 305
        height: 301
    }

    BaseControllerForm{
        property bool isFileExist: false

        id:baseControllerForm
        x: 0
        y: 300

        function changeMediaLoad(){
            let duration = Player.get_duration();
            transformTime(duration);
        }

        function transformTime(time){
            let sec = Math.floor((time/1000) % 60);
            let min = Math.floor((time/1000/60) << 0)

            if(sec<10){
                sec="0"+sec
            }
            let strTime = min+":"+sec
            latsTimeText  = strTime
            slider.from = 0
            slider.to = time/1000
            slider.value = 0;

            if(clickAnimation_media_pause.isPause){
                clickAnimation_media_pause.img_src="image/controller/pause.svg"
                clickAnimation_media_pause.isPause = false;
                clickAnimation_media_pause.running = true
            }


        }

        Timer{
            interval: 1000; running: true; repeat: true
            onTriggered: {
                let time = Player.get_Current_Time();
                let sec = Math.floor((time/1000) % 60);
                let min = Math.floor((time/1000/60) << 0)

                if(sec<10){
                    sec="0"+sec
                }
                baseControllerForm.slider.value = time/1000
                let strTime = min+":"+sec
                baseControllerForm.currTime.text = strTime;
            }
        }

        volume_silde.onMoved: {
            if(baseControllerForm.isFileExist){


                emit:Player.setVolume(volume_silde.value)
            }
            else{
                dialogFileExist.open();
            }



        }
        slider.onMoved: {

            if(baseControllerForm.isFileExist){
                let seek = (slider.value /slider.to)*100;
                if(seek == 100){
                    Player.pause()
                    slider.value=slider.to;
                    Player.next()
//                    console.log("shit!")
                }
                else{
                    console.log(seek);
                    emit:Player.setDurationSlot(seek);

                }

            }
            else{
                dialogFileExist.open();
            }

        }
        mediaNext_mouseArea.onClicked: {
            if(baseControllerForm.isFileExist){
                clickAnimation_next.running = true;
                Player.next()
            }
            else{
                dialogFileExist.open();
            }


        }
        media_mouseArea_Prev.onClicked: {
            if(baseControllerForm.isFileExist){
                clickAnimation_Prev.running = true;
                Player.previous()
            }
            else{
                dialogFileExist.open();
            }

        }

        mediaList_mouseArea.onClicked: {
            if(baseControllerForm.isFileExist){
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
            else{
                dialogFileExist.open();
            }




        }
        media_pause_mouseArea.onClicked: {
            if(baseControllerForm.isFileExist){

                if(!clickAnimation_media_pause.running){

                    if(clickAnimation_media_pause.isPause){
                        clickAnimation_media_pause.img_src="image/controller/pause.svg"
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
            else{
                dialogFileExist.open();
            }
        }


    }




}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
