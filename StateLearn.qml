import QtQuick 2.12
import "./Components"

// 状态,内联组件学习
Item {

    // 内联组件
    Component {
        id: led

        // 状态学习
        Item {
            id: sta
            states: [
                State {
                    name: "go"
                    PropertyChanges {
                        target: light1
                        color: "green"
                    }
                    PropertyChanges {
                        target: light2
                        color: "black"
                    }
                },
                State {
                    name: "stop"
                    PropertyChanges {
                        target: light1
                        color: "red"
                    }
                    PropertyChanges {
                        target: light2
                        color: "red"
                    }
                }
            ]
            width: _container.width
            height: _container.height
            Column {
                id: _container
                spacing: 20
                ColorCircle {
                    id: light1
                }
                ColorCircle {
                    id: light2
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    sta.state = (sta.state === "stop" ? "go" : "stop")
                }
            }
        }
    }

    // 生成内联组件
    Row {
        spacing: 30
        Repeater {
            model: ["go", "stop"]
            Column {
                spacing: 20
                Loader {
                    id: loader
                    sourceComponent: led

                    // 可以通过 js 的 item 去访问到子对象
                    Component.onCompleted: this.item.state = modelData
                }
                Text {
                    text: loader.item.state
                    anchors.horizontalCenter: loader.horizontalCenter
                }
            }
        }
    }

    // 过渡 (在状态改变时设定的动画)
    transitions: [
        Transition {}
    ]
}
