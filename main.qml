import QtQuick 2.12
import QtQuick.Window 2.12

// 主窗口
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
        console.error("启动成功")
        console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    }

    Item {
        x: 100
        y: 100

        // BaseLearn{}
        // LayoutLearn{}
        // FoucsLearn{}
        // FluidElements{}
        // EasingCurvesLearn {}
        // StateLearn {}
        // ModelViewDelegateLearn {}
        JsLearn {}
    }
}
