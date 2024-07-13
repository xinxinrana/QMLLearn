import QtQuick 2.12
import QtQuick.Controls 2.12
import "./Components"

// 动态元素学习
Item {
    // 获取对象的所有属性
    function getObjectProperties(obj) {
        var properties = []
        var values = []
        while (obj) {
            for (var i in obj) {
                if (obj.hasOwnProperty(i)) {
                    properties.push(i)
                }
            }
            obj = Object.getPrototypeOf(obj)
        }
        return properties
    }

    // 动画
    Column {
        spacing: 30

        // 点击播放
        ColorRect {
            onClicked: {
                x += 40
            }
            Behavior on x {
                NumberAnimation {
                    duration: 1000
                }
            }
        }

        // 自动播放
        ColorRect {
            NumberAnimation on x {
                from: 0
                to: 40
                loops: Animation.Infinite
                duration: 1000
            }
        }

        // 独立动画与元素
        ColorRect {
            id: r3
            onClicked: animXPush40.start()
        }
        NumberAnimation {
            id: animXPush40
            target: r3
            properties: "x"
            to: r3.x + 40
            duration: 1000
        }

        // 实时控制动画
        Rectangle {
            id:realTimeAnimationRect
            property int textVar: 100
            width: rectGroup.width
            height: rectGroup.height
            Grid {
                id: rectGroup
                columns: 2
                Repeater {
                    model: 4
                    ColorRect {
                        color: colorEnum[index]
                    }
                }
            }
            MouseArea {
                id: rectGroupMouseArea
                property bool enter: false
                anchors.fill: parent
                hoverEnabled: true
                onEntered: enter = true
                onExited: enter = false
            }

            // 筛选出QML的定义过的参数
            Component.onCompleted: {
                var keys = Object.keys(this)
                            .filter(function(key){
                                return realTimeAnimationRect[key] !== undefined
                            })

//                console.log(keys)
            }
        }

        // 旋转动画
        RotationAnimation {
            target: rectGroup
            property: "rotation"
            duration: 2000
            loops: Animation.Infinite
            from: 0
            to: 360
            running: rectGroupMouseArea.enter
        }

        // 通过数字类型下的旋转动画
        NumberAnimation {
            id: rectGroupAnimation
            target: rectGroup
            property: "rotation"
            duration: 2000
            loops: Animation.Infinite
            from: 0
            to: 360
            running: rectGroupMouseArea.enter
        }
    }
}
