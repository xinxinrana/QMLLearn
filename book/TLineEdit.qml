import QtQuick 2.0

Rectangle {
    width: 190
    height: 80
    color: "lightsteelblue"
    border.color: "gray"

    property alias text: input.text
    property alias input: input

    TextInput {
        id: input
        //        horizontalAlignment: TextInput.AlignHCenter
        //        verticalAlignment: TextInput.verticalAlignment

        //        Layout.alignment: Qt.AlignHCenter
        //        horizontalAlignment: Text.AlignHCenter
        //        anchors.horizontalCenter: parent.horizontalCenter
        //        anchors.verticalCenter: parent
        anchors.margins: 4
    }
}
