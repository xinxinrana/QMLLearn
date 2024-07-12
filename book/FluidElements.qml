import QtQuick 2.0

// 动态元素学习
Item {
    // 动画
    ColorRect {
        id: r1
        width: 80
        height: 80
        onClicked: {
            x += 40
            console.log("点击了", parent)
        }

        NumberAnimation on x {
            duration: 1000
        }
    }
}
