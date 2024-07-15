import QtQuick 2.12

// 普通按钮
Rectangle {
    id: root
    property bool logEnable: true
    property alias text: textItem.text
    property alias textWidth: textItem.width
    width: textItem.width*1.3
    height: 40

    signal clicked

    Rectangle {
        id:baseColor
        anchors.fill: parent
        radius: 2
        color: inMouseArea.isHover?"#c3d3ef":"#d3e3fd"
        // Component.onCompleted: {color = "#d3e3fd"}
    }
    Rectangle{
        // width: parent.width/30
        width: 4
        radius: 2
        height: parent.height
        Component.onCompleted: {color = Qt.darker(baseColor.color)}

    }

    Text {
        id: textItem
        text: "value"
        font.family: "微软雅黑"
        font.pixelSize: parent.height*0.6
        wrapMode: Text.Wrap
        anchors.centerIn: parent
    }

    MouseArea {
        id:inMouseArea
        property bool isHover: false
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if (logEnable)
                console.log(parent, parent.text)
            root.clicked()
        }
        onEntered:isHover = true
        onExited: isHover = false

    }

    // onTextChanged: {
    //     if (textItem.width > this.width)
    //         textItem.width = this.width
    // }
}
