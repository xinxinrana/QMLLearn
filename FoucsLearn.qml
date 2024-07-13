import QtQuick 2.12
import "./Components"


// 焦点学习
Item {
    x: 100
    y: 100
    visible: true
    Column {
        // 文本输入
        TextInput {
            id: input1
            width: 90
            height: 30
            text: "这是一个输入框"
            color: "black"
            KeyNavigation.down: input2
        }

        TextInput {
            id: input2
            width: 90
            height: 30
            text: "这是一个输入框2"
            color: "black"
            KeyNavigation.up: input1
            KeyNavigation.down: tInput.input
        }

        TLineEdit {
            id: tInput
            height: 40
            KeyNavigation.up: input2
        }
    }

    // 焦点区域
    // 焦点区域所定义的组件可以在做邻居时可以实现自动切换
    Item {
        y: 140
        // 切换不了
        FocusScope {
            x: 0
            TextInput {
                text: "区域一"
            }
        }
        FocusScope {
            x: 140
            TextInput {
                text: "区域二"
            }
        }
    }

    // 文本输入
    TextEdit {
        id: textEdit
        y: 200
        x: 0
        width: 400
        height: 30
        text: "这是一个TextEdit组件"
        Rectangle {
            anchors.fill: parent
            z: parent.z - 1
            color: "lightsteelblue"
        }
    }

    // 按键元素
    Rectangle {
        color: "grey"
        x: 0
        y: 240
        width: 100
        height: 100

        Rectangle {
            id: square
            width: 60
            height: 60
            color: "#666600"
        }

        focus: true
        Keys.onLeftPressed: square.x -= 4
        Keys.onRightPressed: square.x += 4
        Keys.onPressed: {
            if (event.key === Qt.Key_R) {
                square.rotation += 30
            } else if (event.key === Qt.Key_T) {
                square.scale += 0.03
            }
        }
    }
}
