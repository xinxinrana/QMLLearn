import QtQuick 2.12
import "./Components"

// 布局学习
Item {
    id: root
    // 定位元素
    // Row
    // Column
    Column {
        id: columnList
        spacing: 10

        ColorSquare {
            color: colorEnum[0]
        }
        ColorSquare {
            color: colorEnum[1]
            width: this.width + 20
        }
        ColorSquare {
            color: colorEnum[2]
        }
    }

    // 定位元素
    Grid {
        id: gridList
        x: 100
        rows: 3
        spacing: 6
        ColorSquare {}
        ColorSquare {}
        ColorSquare {}
        ColorSquare {}
        ColorSquare {}
        ColorSquare {}
    }

    // 重复元素（循环）
    Grid {
        id: repeaterList
        x: 300
        rows: 4
        spacing: 10
        Repeater {
            model: 16
            ColorSquare {
                color: colorEnum[index % 3]
                text: index
            }
        }
    }

    // 布局元素
    Column {
        y: 200
        spacing: 10

        ColorSquare {
            width: 200
            height: 200
            randomNumber: 0

            ColorSquare {
                randomNumber: 2
                anchors.fill: parent
                anchors.margins: 10
                text: "✔"
            }
        }
        ColorSquare {
            width: 200
            height: 200
            randomNumber: 0

            ColorSquare {
                randomNumber: 2
                anchors.centerIn: parent
                anchors.margins: 10
                text: "✔"
            }
            ColorSquare {
                randomNumber: 2
                anchors.right: parent.right
                // anchors.bottom: parent.bottom
                anchors.margins: 10
                text: "×"
            }
        }
    }
}
