import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property alias value: cardLabel.text
    SilicaFlickable {
        id: cardView

        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "Back"
                onClicked: {
                    pageStack.pop()
                }
            }
        }
        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            height: page.height

            PageHeader {
                id: header
                title: "Click to reveal"
            }

            MouseArea {
                id: clickArea

                width: page.width
                height: page.height - header.height

                anchors.fill: parent
                onClicked: {
                    clickArea.visible = false
                    cardLabel.visible = true
                    backArea.visible = true
                    header.title = ""
                }
            }

            Label {
                id: cardLabel

                visible: false;

                width: page.width
                height: page.height - header.height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 300
                color: Theme.primaryColor
            }

            MouseArea {
                id: backArea

                visible: false;

                width: page.width
                height: page.height - header.height

                anchors.fill: parent
                onClicked: {
                    pageStack.pop()
                }
            }
        }
    }
}
