import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
ScrollablePage {
    Material.background: materialBackground
    Material.foreground: materialOnBackground
    Material.accent: materialPrimary
    //Material.primary: primaryColor

    property var materialBackground: "#121212"
    property var materialSurface: "#1D1D1D"
    property var materialPrimary: "#BB86FC"
    property var materialSecondary: "#03DAC6"
    property var materialOnBackground: "#E0E0E0"
    property var materialOnSurface: "#E1E1E1"
    property var materialOnPrimary: "#0A070D"
    property var materialOnSecondary: "#000000"
    property var materialToolBarBackground: "#1F1F1F"

    GridLayout{
        anchors.fill: parent
        columns: 2
        rows: 2
        CustomBox{
            frameTitle: "Freie Betten"
            frameContent: "123.4"
            Layout.fillWidth: true
        }
        CustomBox{
            frameTitle: "Freie Betten"
            frameContent: "7"
            Layout.fillWidth: true
        }
        CustomBox{
            frameTitle: "Freie Betten"
            frameContent: "7"
            Layout.fillWidth: true
        }
        CustomBox{
            frameTitle: "Freie Betten"
            frameContent: "7"
            Layout.fillWidth: true
        }
    }



}
