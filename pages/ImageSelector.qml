import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Page {

    height: parent.height
    width: parent.width

    header: Text {
        text: qsTr("Step 1: Select images for analysis")
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Flickable {

        clip: true

        ScrollBar.vertical: ScrollBar { }

        anchors.left: parent.left
        anchors.top: parent.header.bottom
        anchors.bottom: image_drop.top

        width: parent.width
        height: parent.height

        contentHeight: 160 * Math.ceil( images.count / image_grid.columns )

        Grid {
            id: image_grid

            width: parent.width
            height: parent.contentHeight

            anchors.fill: parent

            columns: 6
            spacing: 10

            Repeater {
                model: images
                delegate: Image {
                    source: _source
                    fillMode: Image.PreserveAspectCrop
                    width: ( parent.width / parent.columns ) - parent.spacing
                    height: 150
                }
            }
        }
    }


    Rectangle {
        id: image_drop
        height: parent.height/4
        width: parent.width

        anchors.left: parent.left
        anchors.bottom: parent.bottom

        color: "blue"
        ColorAnimation on color { from: "yellow"; to: "red"; duration: 1000; loops: Animation.Infinite }

        Text {
            text: qsTr("Drop images here")
            anchors.left: parent.left
            anchors.top: parent.top
        }

        DropArea {
                enabled: true
                anchors.fill: parent
                onDropped: {
                    console.log(drop.text);
                    images.append( { _source: drop.text } )
                    console.log( image_grid.height )
                    console.log( images.count )

                }
        }
    }
}