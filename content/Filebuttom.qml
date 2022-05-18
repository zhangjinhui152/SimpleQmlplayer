import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

Item {
//    id:file_buttom
    width: 80
    height: 30

    FileDialog {
        id: fileSelect
        title: "请选择文件"
        // 文件类型过滤器
        nameFilters: ["All Files (*.*)"]
        // 修改确认按钮名称
        acceptLabel: "好"
        // 保存对话框中当前选定的文件
        currentFile: "请先选择文件。。。。"
        // 对话框模式 OpenFile OpenFiles SaveFile
        fileMode: FileDialog.OpenFile
                // 确认之后的回调
        onAccepted: {
            // 获取文件名称
            let fileName = fileSelect.currentFile.toString().substring(
                    fileSelect.currentFolder.toString().length + 1)
            console.log("路径【" + fileSelect.currentFolder + "】")
            console.log("名称【" + fileName + "】")
        }
        // 取消回调
        onRejected: {
            console.log("Canceled")
        }
    }
    Button {
        id: fileSelectButton
        text: "选择文件"
        anchors.fill: parent
        onClicked: {
            fileSelect.open()
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:2}
}
##^##*/
