import QtQuick 2.0

// 默认样式输入框
Rectangle {
    width: 190
    height: 80
    color: "lightsteelblue"
    border.color: "gray"

    property alias text: input.text
    property alias input: input

    TextInput {
        id: input
        width:parent.width
        height: parent.height
        anchors.margins: 4
    }
}
