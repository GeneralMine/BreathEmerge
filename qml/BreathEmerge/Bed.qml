import QtQuick 2.12
import QtQuick.Controls 2.12

Page{
    property var testName: "norm"
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        PagePatient {
        }

        PageMachine {
        }

        PageVerlauf{

        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: "Patient"
        }
        TabButton {
            text: qsTr("Verlauf")
        }
        TabButton {
            text: qsTr("Maschine")
        }
    }
}
