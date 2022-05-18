
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
Item {
    width: 80
    height: 30

//    FolderDialog {
//        id: folderDialog_player
//        onAccepted: {
//            console.log(folderDialog_player.selectedFolder)
//        }
//    }

    Button {
        id: folderButton_b
        text: qsTr("Folder")
         anchors.fill: parent
        onClicked: {
            folderDialog_player.open()
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

