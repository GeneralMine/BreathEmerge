import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Pane {
    property var materialBackground: "#121212"
    property var materialSurface: "#1D1D1D"
    property var materialPrimary: "#BB86FC"
    property var materialSecondary: "#03DAC6"
    property var materialOnBackground: "#E0E0E0"
    property var materialOnSurface: "#E1E1E1"
    property var materialOnPrimary: "#0A070D"
    property var materialOnSecondary: "#000000"
    property var materialToolBarBackground: "#1F1F1F"

    property alias frameTitle: frameLabel.text
    property alias frameContent: frameContentLabel.text
    Material.background: materialSurface
    Column{
        Label{
            id: frameLabel
            color: "#999999"
        }
        Rectangle{
            width: parent.width
            height: frameContentLabel.contentHeight
            color: "transparent"
            Label{
                id: frameContentLabel
                font.pixelSize: 28
                color: "#E1E1E1"
                anchors.centerIn: parent
            }
        }


    }


}
