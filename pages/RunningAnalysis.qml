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

    Button {
      id: start
      text: "Start image analysis"
      onClicked: {
        previousPage.enabled = false
        nextPage.enabled = false
        start.visible = false
        running.visible = true
        running.running = true

        var image_array = []
        for( var i = 0; i < images.count; i++ ) {
          var image_path = images.get(i)._source;
          backend.analyse_image( image_path, 'amazon' );
        }

        window.step += 1 // when ready, move to next screen


      }
    }

    BusyIndicator {
        id: running
        visible: false
        running: false
        anchors.fill: parent
    }

}
