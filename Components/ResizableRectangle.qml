import QtQuick 2.12

Rectangle {
    id: root
    property int initialX: 0
    property int initialY: 0
    width: 100
    height: 100
    color: "lightblue"

    Rectangle {
        width: 10
        height: width
        color: "#00FF00"
        x: parent.width - width / 2
        y: parent.height - height / 2
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: {
                // 记录鼠标按下时的位置和Rectangle的原始尺寸
                initialX = mouse.x
                initialY = mouse.y
            }
            onPositionChanged: {
                // 计算新的尺寸
                var dx = mouse.x - initialX
                var dy = mouse.y - initialY
                // 防止负数宽度和高度
                root.width = Math.max(root.width + dx, 0)
                root.height = Math.max(root.height + dy, 0)
            }
        }
    }
}
