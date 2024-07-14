import QtQuick 2.12
import QtQuick.Controls 2.12
import "./Components"

// 模型视图代理学习
Item {

    // 这是不 ok 的,因为 child.objectName 一般都是空的
    function findChild(rootItem, childName) {
        //        console.log(rootItem.children.length)
        //        console.log(rootItem.children[0].objectName)
        for (var pro in (rootItem.children[0])) {
            //            if (child.objectName === childName) {
            //                console.log("find", childName)
            //                return child
            //            }
            console.log(pro, rootItem.children[0][pro])
        }
        //        console.log("find err")
    }

    Component {
        id: templateDelegate
        Rectangle {
            id: templateDelegateRect
            width: 200
            height: colorSquare.height + 20
            color: "#33007777"
            ColorSquare {
                id: colorSquare
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                text: index
                color: colorEnum[index % colorEnum.length]
            }
        }
    }

    Component {
        id: highlightCompoent
        Rectangle {
            width: ListView.view.width
            color: "lightGreen"
        }
    }

    Column {
        spacing: 8
        Repeater {
            model: 16
            delegate: templateDelegate
        }
    }

    Rectangle {
        x: 300
        height: childrenRect.height
        width: childrenRect.width
        ListView {
            id: listViewItem

            // width: 500
            // 这个 width 在 layoutDirection: Qt.RightToLeft 时会冲突 导致无限递归
            width: contentItem.childrenRect.width // 只有这一种方式能够读取到
            // width: childrenRect.width // 无效 -1
            // width: contentWidth   //  无效 -1
            height: 300 // 这非常重要,否则只会显示一条信息

            model: 10
            spacing: 8
            delegate: templateDelegate

            highlight: highlightCompoent
            focus: true
            Keys.onPressed: {
                if (event.key === Qt.Key_Return) {
                    console.log(currentItem.children[0].text)
                }
            }

            clip: true // 影响的是靠近边界的这个元素,而非所有元素

            //方向
            // orientation: ListView.Horizontal

            // 排列方向 (仅仅在水平布局下可用)
            // layoutDirection : Qt.RightToLeft

            // 布局方向 (垂直)
            verticalLayoutDirection: ListView.BottomToTop

            header: Item {
                property int vPadding: 10
                width: parent.width
                height: childrenRect.height + vPadding * 2
                ColorSquare {
                    width: parent.width
                    height: 60
                    text: "页眉"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            footer: ColorSquare {
                width: parent.width
                height: 60
                text: "页脚"
            }
        }
    }
}
