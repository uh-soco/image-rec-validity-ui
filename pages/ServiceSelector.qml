import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Page {

    header: Text {
        text: qsTr("Step 2: Select services used in the analysis")
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ColumnLayout{
        spacing: 2

        CheckBox {
            id: amazon
            text: qsTr("Amazon")
        }

        TextField {
            id: amazon_username
            text: "Username"
            placeholderText: qsTr("Text Field")
            visible: amazon.checked
        }

        TextField {
            id: amazon_password
            text: "Password"
            placeholderText: qsTr("Text Field")
            visible: amazon.checked
        }

        CheckBox {
            id: google
            text: qsTr("Google")
        }

        TextField {
            id: google_username
            text: "Username"
            placeholderText: qsTr("Text Field")
            visible: google.checked
        }

        TextField {
            id: google_password
            text: "Password"
            placeholderText: qsTr("Text Field")
            visible: google.checked
        }


        CheckBox {
            id: microsoft
            text: qsTr("microsoft")
        }

        TextField {
            id: microsoft_username
            text: "Username"
            placeholderText: qsTr("Text Field")
            visible: microsoft.checked
        }

        TextField {
            id: microsoft_password
            text: "Password"
            placeholderText: qsTr("Text Field")
            visible: microsoft.checked
        }

    }

}
