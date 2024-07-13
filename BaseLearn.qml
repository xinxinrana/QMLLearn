import QtQuick 2.0
import "./Components"

// 基础内容学习
Item {
    id: module1

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
