import QtQuick 2.0

Rectangle {
    property var colorEnum: ["#303", "#330", "#033"]

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
