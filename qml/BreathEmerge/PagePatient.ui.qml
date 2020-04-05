import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.0
import QtCharts 2.14
ScrollablePage {
    id: page

    GroupBox {
        title: "Puls"
        anchors.horizontalCenter: parent.horizontalCenter
        leftInset: 5
        rightInset: 5
        width: parent.width

        Column {
            spacing: 10
            width: parent.width

            Switch{
                checked: true
                text: "Pulssteuerung"
            }

            Slider {
                id: button
                width: parent.width
            }

            RangeSlider {
                width: parent.width
            }

            ChartView{
                width: parent.width
                height: 250
                antialiasing: true

                LineSeries {
                    name: "Puls"
                    XYPoint { x: 0; y: 0 }
                    XYPoint { x: 1.1; y: 2.1 }
                    XYPoint { x: 1.9; y: 3.3 }
                    XYPoint { x: 2.1; y: 2.1 }
                    XYPoint { x: 2.9; y: 4.9 }
                    XYPoint { x: 3.4; y: 3.0 }
                    XYPoint { x: 4.1; y: 3.3 }
                }
            }
        }
    }
}


/*##^##
Designer {
    D{i:3;anchors_width:200;anchors_x:66}D{i:2;anchors_height:400;anchors_width:200}D{i:1;anchors_height:300;anchors_width:300}
}
##^##*/
