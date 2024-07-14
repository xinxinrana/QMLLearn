import QtQuick 2.12

// 默认颜色文字矩形
Rectangle {

    // 枚举模拟
    property int randomNumber: Math.floor(Math.random() * 3)
    property var colorEnum: ["#ea7025", "#67c111", "#00bde3"]
    property alias text: textItem.text

    width: 48
    height: width

    color: colorEnum[randomNumber]
    border.color: Qt.lighter(color)

    Text {
        id: textItem
        anchors.centerIn: parent
        color: "white"
        font.pointSize: 24
        font.family: "微软雅黑"
        text: qsTr("X")
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(textItem.text)
        }
    }
}
