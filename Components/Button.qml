import QtQuick 2.12

// 普通按钮
Item {
    id: root
    property bool logEnable: true
    property alias text: textItem.text
    property alias textWidth: textItem.width
    width: 40
    height: 80

    signal clicked

    Rectangle {
        anchors.fill: parent
        color: "#d3e3fd"
    }

    Text {
        id: textItem
        text: "value"
        wrapMode: Text.Wrap
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (logEnable)
                console.log(parent, parent.text)
            root.clicked()
        }
    }

    onTextChanged: {
        if (textItem.width > this.width)
            textItem.width = this.width
    }
}
