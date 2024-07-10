import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 840
    height: 680
    visible: true
    title: qsTr("Hello QML")

    function funcCall() {
        console.trace()
    }

    Component.onCompleted: {
        console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        console.trace()
        console.error("错误消息")
        console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    }

    Item {
        id: module1
        visible: false

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
            text: "Test English"
            color: "#000000"
            font.family: "Consolas"
            font.pixelSize: 24

            // 省略号 (中间)
            // elide: Text.ElideMiddle
            // 末尾 (右边)
            // elide: Text.ElideRight

            // 自动换行
            wrapMode: Text.WordWrap

            // 文字外框
            style: Text.Sunken
            styleColor: "#FF4444"
        }

        // 不同轮廓文本
        Item {
            id: textRow
            x: 100
            y: 300
            Column {
                Text {
                    font.pointSize: 24
                    text: "Normal"
                }
                Text {
                    font.pointSize: 24
                    text: "Raised"
                    style: Text.Raised
                    styleColor: "#AAAAAA"
                }
                Text {
                    font.pointSize: 24
                    text: "Outline"
                    style: Text.Outline
                    styleColor: "red"
                }
                Text {
                    font.pointSize: 24
                    text: "Sunken"
                    style: Text.Sunken
                    styleColor: "#AAAAAA"
                }
            }
        }

        // 图像
        Image {
            id: img1
            x: 300
            y: 100
            width: 50
            height: 100
            // fillMode: Image.PreserveAspectCrop
            fillMode: Image.PreserveAspectFit
            source: "./img/rocket.png"
            // clip: true

            // 图像外轮廓(观测实际大小)
            Rectangle {
                color: "red"
                property int outSize: 1
                // visible: false
                x: -outSize
                y: -outSize
                z: parent.z - 1
                width: parent.width + outSize * 2
                height: parent.height + outSize * 2
            }
        }

        // 鼠标区域元素
        Rectangle {
            id: mouseAreaDemo
            x: 400
            y: 100
            width: 50
            height: 100
            color: "lightsteelblue"
            Text {
                anchors.centerIn: parent
                text: "请点击"
                color: "#555555"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    img1.visible = !img1.visible
                    funcCall()
                }
            }
        }

        // 组件
        Button {
            id: btn
            x: 400
            y: 300
            width: 50
            // logEnable: false
            text: "Btn Click"
            onClicked: {
                this.text = this.text + "C"
                console.log(this.textWidth)
            }
        }

        // 转换
        Item {
            x: 500
            y: 100

            ClickableImage {
                id: rocked2
                width: 30
                fillMode: Image.PreserveAspectFit
                source: "./img/rocket.png"
                onClicked: {
                    y -= 50
                }

                Behavior on y {
                    NumberAnimation {
                        duration: 1000
                    }
                }
            }

            ClickableImage {
                id: rocked3
                x: 100
                width: 30
                fillMode: Image.PreserveAspectFit
                source: "./img/rocket.png"
                onClicked: {
                    rotation += 60
                }

                Behavior on rotation {
                    NumberAnimation {
                        duration: 1000
                    }
                }
            }

            ClickableImage {
                id: rocked4
                y: 100
                width: 30
                fillMode: Image.PreserveAspectFit
                source: "./img/rocket.png"
                onClicked: {
                    rotation += 60
                    scale = 0.3
                    x += 50
                    y -= 100
                }

                Behavior on x {
                    NumberAnimation {
                        duration: 1000
                    }
                }
                Behavior on y {
                    NumberAnimation {
                        duration: 1000
                    }
                }
                Behavior on scale {
                    NumberAnimation {
                        duration: 1000
                    }
                }
                Behavior on rotation {
                    NumberAnimation {
                        duration: 1000
                    }
                }
            }
        }
    }

    Item {
        id: module2
        visible: true
        x: 100
        y: 100

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
}
