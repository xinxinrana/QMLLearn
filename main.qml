import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rect1
        x: 100
        y: 100
        width: 40
        height: 40
        color: "blue"
    }

    Rectangle {
        id: rect2
        x: 200
        y: 100
        width: 40
        height: 40
        color: "white"
        border.color: "lightsteelblue"
        border.width: 2
        radius: 5
    }

    Rectangle {
        id: rect3
        x: 100
        y: 200
        width: 40
        height: 40
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "lightsteelblue"
            }
            GradientStop {
                position: 1.0
                color: "slategray"
            }
        }
        border.color: "slategray"
    }

    // 文本元素
    Text {
        x: 200
        y: 200
        width: 100
        // text: "这是一段中文"
        text: "This is a passage in English"
        color: "#000000"
        font.family: "Consolas"
        font.pixelSize: 24

        // 省略号 (中间)
        // elide: Text.ElideMiddle
        // 末尾 (右边)
        // elide: Text.ElideRight

        // 自动换行
        wrapMode: Text.WordWrap
    }
}
