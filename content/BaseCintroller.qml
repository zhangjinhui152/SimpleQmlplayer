import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import my_player 1.0
import "Config.js" as Config
Item {
    id: item1
    property string currentLycPath: ""
    signal updataMedia();

    onUpdataMedia: function(){
        let time = Player.get_Current_Time();
        let sec = Math.floor((time/1000) % 60);
        let min = Math.floor((time/1000/60) << 0)
        if(sec<10){
            sec="0"+sec
        }
        if(min<10){
            min="0"+min
        }
        baseControllerForm.slider.value = time/1000
        let strTime = min+":"+sec

        baseControllerForm.currTime.text = strTime;
        switchPage.scrollerLyc(strTime)
    }

    Connections {
        target: Player
        onChangeMedia: function(index){
            baseControllerForm.changeMediaLoad();
            console.log(" onChangeMedia: function(index){",index)
            switchPage.changeImage(index);
        }
    }
    Connections {
        target: Player
        onAppendSong:function(value){
            switchPage.mediaListView.mediaList_listModel.append({songName:value[0],authorText:value[1],albumText:value[2],imgSrc:value[3],itemIndex:value[4]});
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
    Timer{
        interval: 1000; running: true; repeat: true
        onTriggered: {
            item1.updataMedia()
        }
    }


    SwitchPage{
        id:switchPage
        x: 0
        y: 0
        width: 900
        height: 400
        property var lycMap: new Map()
        function changeImage(index){

            mediaListView.mediaList_listView.currentIndex = index;
            mediaListView.sing_current_img =mediaListView.mediaList_listView.currentItem.img_src
            mediaListView.sing_current_img_bg=mediaListView.mediaList_listView.currentItem.img_src

            mediaLycListView.listModel_lyc.clear()
            let arrMap =  ConfigRead.getLycMap(mediaListView.mediaList_listView.currentItem.song_text)
            let timeArr= arrMap["time"];
            let a2 = arrMap["lyc"];
            let count = 0;
            lycMap = new Map();
            for(let item of a2) {
                mediaLycListView.listModel_lyc.append({lyc:item,fontBold:false})
            }
            for(let item2 of timeArr) {
                lycMap.set(item2,count)
                count++;
            }
            count = 0;
        }
        function scrollerLyc(strTime)
        {
//            mediaLycListView.listView_lyc.
            if(lycMap.get(strTime) !== undefined){
                  mediaLycListView.listView_lyc.currentItem.font_Bold = false
                  mediaLycListView.listView_lyc.currentIndex = lycMap.get(strTime)
                 mediaLycListView.listView_lyc.currentItem.font_Bold = true
            }


        }
    }


    width: Config.windwosWidth
    height: Config.windwosHeight
    property alias baseControllerForm: baseControllerForm
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
    Rectangle{
        color: Qt.rgba(255,255,255,0.7)
        anchors.fill: baseControllerForm
        x: baseControllerForm.x
        y: baseControllerForm.y
        z: 1

    }
    BaseControllerForm{
        property bool isFileExist: false

        id:baseControllerForm
        x: 0
        y: 329
        width: 900
        height: 71
        anchors.bottom: parent.bottom
        z: 2
        anchors.bottomMargin: 0

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
                clickAnimation_media_pause.img_src="image/controller/24gl-pause.svg"
                clickAnimation_media_pause.isPause = false;
                clickAnimation_media_pause.running = true
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
//                    console.log(seek);
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
            //            if(!baseControllerForm.isFileExist){

            //            }
            //            else{
            //                dialogFileExist.open();
            //            }
            if(!clickAnimation_mediaList.running){

                clickAnimation_mediaList.running = true;
                if(!clickAnimation_mediaList.ifRotation){
                    clickAnimation_mediaList.angle = 180
                    clickAnimation_mediaList.ifRotation = true
                    switchPage.switchIndex = 1
                }
                else{
                    clickAnimation_mediaList.angle = 0
                    clickAnimation_mediaList.ifRotation =false
                    switchPage.switchIndex = 0
                }
            }



        }
        media_pause_mouseArea.onClicked: {
            if(baseControllerForm.isFileExist){

                if(!clickAnimation_media_pause.running){

                    if(clickAnimation_media_pause.isPause){
                        clickAnimation_media_pause.img_src="image/controller/24gl-pause.svg"
                        clickAnimation_media_pause.isPause = false;
                        //                    Player.openfile("a4.mp3");
                        Player.play()
                    }
                    else{
                        clickAnimation_media_pause.img_src="image/controller/24gl-play.svg"
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

        mouseArea_addt_Menu.onClicked: {
            addt_Menu.open()
        }
        folderOpen.onTriggered: {
            folderDialog_player.open()
            console.log("  folderOpen.onTriggered: {")

        }
        folderOpenLyc.onTriggered: {
            folderDialog_Lyc.open()
            console.log("folderOpenLyc.onTriggered: {")
        }

    }

    FolderDialog {
        id: folderDialog_player
        onAccepted: {
            Player.openFileList(folderDialog_player.selectedFolder);
            console.log(" id: folderDialog_player"+folderDialog_player.selectedFolder)
        }
    }
    FolderDialog {
        id: folderDialog_Lyc
        onAccepted: {
            ConfigRead.setFilePath(folderDialog_Lyc.selectedFolder)
            console.log(" id: folderDialog_Lyc"+folderDialog_player.selectedFolder)
        }
    }



}


