import QtQuick 2.0

// 默认颜色矩形
Rectangle {
    property var colorEnum: ["#909", "#990", "#099", "#9f85ff"]

    width: 40
    height: 40
    color: colorEnum[0]

    signal clicked

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.clicked()
            console.log("点击了", parent)
        }
    }
}
