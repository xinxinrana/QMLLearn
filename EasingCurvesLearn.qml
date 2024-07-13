import QtQuick 2.0
import "./Components"

// 速度曲线和动画分组
Item {
    Column {
        spacing: 40

        // 速度曲线
        Rectangle {
            id: r1
            width: 300
            height: container.height
            color: "#4400FFFF"
            Column {
                id: container
                spacing: 10
                width: parent.width
                Repeater {
                    model: ["Linear", "InQuad", "OutQuad", "InOutQuad", "InOutElastic"]
                    ColorRect {
                        Text {
                            text: modelData
                            anchors.right: parent.left
                            anchors.rightMargin: 10
                            color: "black"
                        }
                        NumberAnimation on x {
                            from: 0
                            to: r1.width - width
                            loops: Animation.Infinite
                            easing.type: modelData
                            duration: 3500
                        }
                    }
                }
            }
        }

        // 动画分组
        Rectangle {
            id: r2
            width: 200
            height: 200
            color: "#4400FFFF"
            ColorRect {
                id: groupAnimationRect
            }

            // 同时动画
            ParallelAnimation {
                id: anim2
                running: false
                loops: Animation.Infinite
                NumberAnimation {
                    target: groupAnimationRect
                    properties: "x"
                    to: r2.width - groupAnimationRect.width
                    duration: 2000
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: groupAnimationRect
                    properties: "y"
                    to: r2.height - groupAnimationRect.height
                    duration: 2000
                }
            }

            // 先后动画
            SequentialAnimation {
                id: anim3
                running: true
                loops: Animation.Infinite
                NumberAnimation {
                    target: groupAnimationRect
                    properties: "x"
                    to: r2.width - groupAnimationRect.width
                    duration: 2000
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: groupAnimationRect
                    properties: "y"
                    to: r2.height - groupAnimationRect.height
                    duration: 2000
                }
            }
        }
    }
}
