import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQuick.LocalStorage 2.15
import "../javascript/ServiceSelector.js" as KeyManager

Page {
  height: parent.height
  width: parent.width

  Component.onCompleted: KeyManager.setup_database()

    header: Text {
        text: qsTr("Step 2: Select services used in the analysis")
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Dialog {

      id: config
      width: 400
      height: 400

      property var service_name: "undefined"
      property var values : []

      title: "Configure " + service_name
      standardButtons: Dialog.Ok

      ListView {

          id: variables

          anchors.fill: parent

           model: config.values
           delegate: TextField {
                 text: ''
                 placeholderText: modelData.example
                 onEditingFinished: function() {
                    KeyManager.save( config.service_name, modelData.variable,text )
                 }
             }
        }

    }

    ListView {

      anchors.fill: parent

       model: ["Amazon", "Microsoft", "Google"]
       delegate:
            SwitchDelegate {
            text: modelData
            onToggled: function() {
              if( checked ) {
                var needs_config = ! KeyManager.has_been_configured( modelData )

                if( needs_config ) {
                  config.service_name = modelData
                  config.values = [
                    { variable : "username" , example : 'example@example.com', value : '' } ,
                    { variable : "password" , example : 'password', value : '' }
                  ]
                  config.open()

                 }
              }
            }
            // todo: add settings icon to allow settings config
      }
  }

}
