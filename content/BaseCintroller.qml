import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 700
    height: 100


    BaseControllerForm{
        mediaList_mouseArea{
            onClicked: clickAnimation_mediaList.running = true
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
