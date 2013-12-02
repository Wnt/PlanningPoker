import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    onStatusChanged: {
         if (status == PageStatus.Deactivating) {
             mainWindow.cover = Qt.resolvedUrl("CoverPage.qml")
         }
    }

    property alias value: cardLabel.text

    CoverActionList {
        id: twoCoverActions

        enabled: false

        CoverAction {
            iconSource: "image://theme/icon-m-dialpad"
            onTriggered: {
                pageStack.pop();
                mainWindow.activate();
            }
        }

    }
    CoverBackground {
        id: cardCover

        anchors.fill: parent
        visible: false // ApplicationWindow will override this

        Label {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            y: Theme.paddingMedium
            color: Theme.primaryColor
            font.pixelSize: 30
            text: "Planning poker"
        }
        Label {
            anchors.centerIn: parent
            color: Theme.primaryColor
            font.pixelSize: 150
            text: value
        }
    }

    SilicaFlickable {
        id: cardView

        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                id: hideAgain
                text: "Hide again"
                onClicked: {
                    hideAgain.visible = false
                    clickArea.visible = true
                    cardLabel.visible = false
                    backArea.visible = false
                    header.visible = true
                    mainWindow.cover = Qt.resolvedUrl("CoverPage.qml")
                }
                visible: false
            }
            MenuItem {
                id: pullBack
                text: "Back"
                onClicked: {
                    pageStack.pop()
                }
            }
        }
        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // factory for dynamic menu items
        Component {
            id: menuItemComp
            MenuItem {}
        }

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            height: page.height

            PageHeader {
                id: header
                title: "Tap to reveal"
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
                    hideAgain.visible = true
                    header.visible = false

                    twoCoverActions.enabled = true

                    //console.log(mainWindow.cover)
                    mainWindow.cover = cardCover
                    //console.log(mainWindow.cover)
                    //coverLabel.text = "asd"

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
