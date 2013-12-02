
import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    SilicaFlickable {
        id: infoView

        anchors.fill: parent

        Column {
            PageHeader {
                title: "Information"
            }
            Label {
                x: Theme.paddingSmall
                width: page.width;
                color: Theme.primaryColor
                textFormat: Text.RichText
                text: "<style>a:link { color: " + Theme.highlightColor + "; }</style>General information about planning poker on <a href=\"https://en.wikipedia.org/wiki/Planning_poker\">Wikipedia</a>, source code and more information about this application on <a href=\"https://github.com/Wnt/PlanningPoker\">GitHub</a>."
                wrapMode: Text.WordWrap
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
        }
    }
}
