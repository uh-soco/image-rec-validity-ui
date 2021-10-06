import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

import "pages"

ApplicationWindow {
    id: window

    width: 500
    height: 500
    visible: true

    title: qsTr("Automated image recognition runner and verifier")

    property int step: 0

    ListModel {
            id: images
    }

    header:   ToolBar {
    }

    footer: Item {

        height: 40

        PageIndicator {
            id: pageIndicator
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            count: 4 // todo: make adaptive
            currentIndex: window.step
            interactive: false
        }

        Button {
            id: previousPage
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Previous step")
            onClicked: {
                window.step -= 1

            }
            enabled: window.step > 0
        }

        Button {
            id: nextPage
            anchors.right: parent.right
            anchors.top: parent.top
            text: qsTr("Next step")
            onClicked: {
                window.step += 1
            }
            enabled: window.step < ( pageIndicator.count - 1 ) // indexing issue
        }

    }

    StackView {
        id: main
        anchors.fill: parent

        ImageSelector { visible: window.step == 0 }
        ServiceSelector { visible: window.step == 1 }
        RunningAnalysis { visible: window.step == 2 }
        Results { visible: window.step == 3 }

    }

}
