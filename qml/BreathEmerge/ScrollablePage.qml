import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: page

    default property alias content: pane.contentItem

    Flickable {
        anchors.fill: parent
        clip: false
        contentHeight: pane.implicitHeight
        flickableDirection: Flickable.VerticalFlick

        Pane {
            id: pane
            width: parent.width
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}
