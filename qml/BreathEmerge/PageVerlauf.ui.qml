import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0
import QtCharts 2.3

ScrollablePage {
    id: pageMachine
    width: 750 / 2
    height: 1334 / 2
    property alias groupBoxAnchorsrightMargin: groupBox.anchors.rightMargin

    Flickable {
        id: flickable
        anchors.fill: parent

        Column {
            id: column
            anchors.fill: parent

            GroupBox {
                id: groupBox
                width: 150
                height: 200
                anchors.right: parent.right
                anchors.left: parent.left
                font.pointSize: 11
                contentHeight: 30
                contentWidth: 150
                clip: false
                title: "Persönliche Daten"

                GridLayout {
                    anchors.fill: parent
                    rows: 3
                    columns: 2

                    Label {
                        id: label
                        text: qsTr("Name: ")
                        Layout.minimumHeight: 12
                        Layout.minimumWidth: 12
                    }

                    Label {
                        id: label1
                        text: qsTr("Annika Frauendorfer")
                    }

                    Label {
                        id: label2
                        text: qsTr("Alter")
                    }

                    Label {
                        id: label3
                        text: qsTr("19")
                    }

                    Label {
                        id: label4
                        text: qsTr("Einweisung")
                    }

                    Label {
                        id: label5
                        text: qsTr("01.04.2020 vor 3 Tagen")
                    }
                }
            }

            GroupBox {
                id: groupBox1
                width: 150
                height: 200
                title: "Persönliche Daten"
                contentWidth: 150
                clip: false
                GridLayout {
                    rows: 3
                    Label {
                        id: label6
                        text: qsTr("Name: ")
                        Layout.minimumHeight: 12
                        Layout.minimumWidth: 12
                    }

                    Label {
                        id: label7
                        text: qsTr("Annika Frauendorfer")
                    }

                    Label {
                        id: label8
                        text: qsTr("Alter")
                    }

                    Label {
                        id: label9
                        text: qsTr("19")
                    }

                    Label {
                        id: label10
                        text: qsTr("Einweisung")
                    }

                    Label {
                        id: label11
                        text: qsTr("01.04.2020 vor 3 Tagen")
                    }
                    columns: 2
                    anchors.fill: parent
                }
                anchors.right: parent.right
                anchors.left: parent.left
                font.pointSize: 11
                contentHeight: 30
            }
        }
    }
}

/*##^##
Designer {
    D{i:3;anchors_width:200;anchors_x:66}D{i:2;anchors_height:400;anchors_width:200}D{i:1;anchors_height:300;anchors_width:300}
}
##^##*/

