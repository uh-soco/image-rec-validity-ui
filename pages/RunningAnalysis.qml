import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Page {

    height: parent.height
    width: parent.width

    header: Text {
        text: qsTr("Step 3: Analysis is running")
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    BusyIndicator {
        running: true
        anchors.fill: parent
    }

}
