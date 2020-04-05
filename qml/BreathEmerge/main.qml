import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import QtQuick.Extras 1.4
Item {
    id: window
    visible: true
    width: 750/2
    height: 1334/2
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
    property var materialRed: "#E30425"
    property var materialYellow: "#FFEB3B"
    property var materialGreen: "#4CAF50"
    property var materialGrey: "#9E9E9E"

    readonly property bool inPortrait: window.width < window.height
    Page {
        id: page
        anchors.fill: parent

        Action{
            id: emergencyBoxAction
            onTriggered: emergencyBox.state = emergencyBox.state === "open" ? "close" : "open"
        }

        GroupBox{
            //z: 5
            id: emergencyBox
            anchors.top: parent.top

            Material.primary: materialToolBarBackground
            Material.foreground: materialRed
            title: "Notfälle"
            //anchors.topMargin: 15
            padding: 5
            leftInset: 5
            rightInset: 5

            anchors.left: parent.left
            anchors.right: parent.right
            ListView{
                id: emergencyBoxView
                focus: true
                anchors.fill: parent
                currentIndex: -1
                highlight: Rectangle{
                    color: materialPrimary
                    opacity: 0.12
                    border.color: materialPrimary
                    border.width: 3
                    radius: 5
                }
                delegate: ItemDelegate {
                    id: emergencyBoxViewDelegate
                    Material.primary: materialToolBarBackground

                    Material.foreground: {
                        switch(model.zustand){
                        case "red":
                            return materialRed;
                        case "yellow":
                            return materialYellow;
                        case "green":
                            return materialGreen;
                        case "grey":
                            return materialGrey;
                        }
                    }
                    Material.background: materialToolBarBackground
                    width: parent.width
                    text: model.station + ": " + model.name + ": " + model.zustandsInfo
                    font.pixelSize: 16
                    onClicked: {
                        drawerListView.currentIndex = model.index
                        emergencyBoxView.currentIndex = index
                        stackView.push("qrc:/qml/BreathEmerge/Bed.qml", {"testName": model.name})
                        drawer.close()
                    }
                }


                // hardcoded test values!!!
                model: ListModel{
                    ListElement{
                        zustand: "red"
                        zustandsInfo: "Puls über 160!"
                        name: "Jan Salzgeber"
                        station: "D.1.067"
                        listIndex: 2
                    }
                    ListElement{
                        zustand: "grey"
                        zustandsInfo: "Connection lost!"
                        name: "Franziska Braun"
                        station: "E.2.314"
                        listIndex: 3
                    }
                }
            }

            state: "close"
            states: [
                State{
                    name: "close"
                    PropertyChanges{
                        target: emergencyBox
                        height: 0
                        //visible: false
                    }
                },
                State{
                    name: "open"
                    PropertyChanges{
                        target: emergencyBox
                        height: emergencyBoxView.contentHeight + 46
                        //visible: true
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "close"
                    to: "open"

                    NumberAnimation {
                        target: emergencyBox
                        property: "height"
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                },
                Transition {
                    from: "open"
                    to: "close"

                    NumberAnimation {
                        target: emergencyBox
                        property: "height"
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }]
        }

        Settings {
            id: settings
            property string style: "Material"
        }

        Shortcut {
            sequences: ["Esc", "Back"]
            enabled: stackView.depth > 1
            onActivated: navigateBackAction.trigger()
        }

        Action {
            id: navigateBackAction
            icon.name: stackView.depth > 1 ? "back" : "drawer"
            onTriggered: {
                if (stackView.depth > 1) {
                    stackView.pop()
                    drawerListView.currentIndex = -1
                    emergencyBoxView.currentIndex = -1
                } else {
                    drawer.open()
                }
            }
        }

        Shortcut {
            sequence: "Menu"
            onActivated: optionsMenuAction.trigger()
        }

        Action {
            id: optionsMenuAction
            icon.name: "menu"
            onTriggered: drawer.open()
        }

        header: ToolBar {
            id: toolBar
            Material.primary: materialToolBarBackground
            Material.foreground: materialPrimary
            RowLayout {
                spacing: 20
                anchors.fill: parent

                ToolButton {
                    action: navigateBackAction
                }

                Label {
                    id: titleLabel
                    text: drawerListView.currentItem ? drawerListView.currentItem.delegateText : "Dashboard"
                    font.pixelSize: 20
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }

                ToolButton {
                    action: emergencyBoxAction

                    StatusIndicator{
                        anchors.fill: parent
                        anchors.margins: 8
                        active: true
                        color: materialRed
                    }
                }
            }
        }

        Drawer {
            id: drawer
            width: Math.min(window.width, window.height) / 3 * 2
            height: window.height

            background: Rectangle{
                anchors.fill: parent
                color: materialSurface
            }

            ListView {
                id: drawerListView

                focus: true
                currentIndex: -1
                anchors.fill: parent

                header: Pane{
                    Material.primary: materialToolBarBackground
                    Material.foreground: materialPrimary
                    background: Rectangle{
                        anchors.fill: parent
                        color: materialSurface
                    }

                    width: parent.width
                    padding: 0

                    ItemDelegate {
                        Material.primary: materialToolBarBackground
                        Material.foreground: materialPrimary

                        width: parent.width
                        height: toolBar.height
                        highlighted: ListView.isCurrentItem
                        text: qsTr("Patientenübersicht")
                        font.pixelSize: 16
                        MenuSeparator {
                            anchors.verticalCenter: parent.bottom
                            width: parent.width
                        }
                    }

                }

                headerPositioning: ListView.OverlayHeader

                delegate: Pane{
                    Material.primary: materialToolBarBackground
                    Material.foreground: materialPrimary
                    Material.background: materialToolBarBackground
                    width: parent.width
                    padding: 0
                    property alias delegateText: delegateTextElement.text
                    ItemDelegate {
                        id: delegateTextElement
                        width: parent.width
                        text: model.station + ": " + model.name
                        highlighted: ListView.isCurrentItem
                        onClicked: {
                            drawerListView.currentIndex = index
                            stackView.push("qrc:/qml/BreathEmerge/Bed.qml", {"testName": model.name})
                            drawer.close()
                        }

                        StatusIndicator{
                            active: true
                            color: {
                                switch(model.zustand){
                                case "red":
                                    return materialRed;
                                case "yellow":
                                    return materialYellow;
                                case "green":
                                    return materialGreen;
                                case "grey":
                                    return materialGrey;
                                }
                            }
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                model: bedDataModel

                footer: Pane{
                    Material.primary: materialToolBarBackground
                    Material.foreground: materialPrimary
                    Material.background: materialToolBarBackground
                    width: parent.width
                    padding: 0
                    Column{
                        width: parent.width
                        ItemDelegate {
                            text: qsTr("Patient hinzufügen")
                            width: parent.width
                        }

                        MenuSeparator {
                            width: parent.width
                        }

                        ItemDelegate {
                            text: qsTr("Einstellungen")
                            width: parent.width
                        }
                    }
                }

                ScrollIndicator.vertical: ScrollIndicator { }
            }
        }

        StackView {
            //z:1
            id: stackView
            anchors.top: emergencyBox.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            initialItem: Dashboard{

            }
        }



        Dialog {
            id: settingsDialog
            x: Math.round((window.width - width) / 2)
            y: Math.round(window.height / 6)
            width: Math.round(Math.min(window.width, window.height) / 3 * 2)
            modal: true
            focus: true
            title: "Settings"

            standardButtons: Dialog.Ok | Dialog.Cancel
            onAccepted: {
                settings.style = styleBox.displayText
                settingsDialog.close()
            }
            onRejected: {
                styleBox.currentIndex = styleBox.styleIndex
                settingsDialog.close()
            }

            contentItem: ColumnLayout {
                id: settingsColumn
                spacing: 20

                RowLayout {
                    spacing: 10

                    Label {
                        text: "Style:"
                    }

                    ComboBox {
                        id: styleBox
                        property int styleIndex: -1
                        model: availableStyles
                        Component.onCompleted: {
                            styleIndex = find(settings.style, Qt.MatchFixedString)
                            if (styleIndex !== -1)
                                currentIndex = styleIndex
                        }
                        Layout.fillWidth: true
                    }
                }

                Label {
                    text: "Restart required"
                    color: "#e41e25"
                    opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                    horizontalAlignment: Label.AlignHCenter
                    verticalAlignment: Label.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }

        Dialog {
            id: aboutDialog
            modal: true
            focus: true
            title: "About"
            x: (window.width - width) / 2
            y: window.height / 6
            width: Math.min(window.width, window.height) / 3 * 2
            contentHeight: aboutColumn.height

            Column {
                id: aboutColumn
                spacing: 20

                Label {
                    width: aboutDialog.availableWidth
                    text: "The Qt Quick Controls 2 module delivers the next generation user interface controls based on Qt Quick."
                    wrapMode: Label.Wrap
                    font.pixelSize: 12
                }

                Label {
                    width: aboutDialog.availableWidth
                    text: "In comparison to the desktop-oriented Qt Quick Controls 1, Qt Quick Controls 2 "
                          + "are an order of magnitude simpler, lighter and faster, and are primarily targeted "
                          + "towards embedded and mobile platforms."
                    wrapMode: Label.Wrap
                    font.pixelSize: 12
                }
            }
        }
        ListModel {
            id: bedDataModel
            // hardcoded test values!!!
            // repräsentiert Datenstruktur
            ListElement {
                //Patient - Wichtige Daten
                zustand: "green"
                name: "Annika Frauendorfer"
                station: "C.4.227"
                // Patient - Messwerte Dashboard
                puls: 67
                sauerstoff: 95
                co2: 5
                lungendruck: 34
                // Patient - Persönliche Daten
                personal: [
                    ListElement{}
                ]
                geburtsdatum: "05.01.2001"
                einweisungsdatum: "01.04.2020"
                diagnose: "COVID-19"
                diagnosedatum: "01.04.2020"
                vorerkrankungen: "Leichte Lüngenentzündung, Astma"
                organspender: "ja"
                notfallkontaktNummer: "+491721519175"
                /*
                // Verlauf - Patient
                pulsDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                sauerstoffDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                co2Daten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                lungendruckDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                //Verlauf - Gerät
                sauerstoffLuftDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                atemfrequenzDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsvolumenDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckEinDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckAusDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                */
                // Gerät - Wichtige Daten
                status: "in Betrieb"
                verbindungsstatus: "Verbunden"
                modell: "Fraunhofer Breath"
                version: "v0.1"
                // Gerät - Steuerung
                sauerstoffmaschine: 98
                atemfrequenz: 20
                beatmungsvolumen: 3
                beatmungsdruckEin: 12
                beatmungsdruckAus: 5
                peep: 5
                // Gerät - Hinweise
                hinweis: "Das Gerät wurde vom Fraunhofer IAO Team hinter Truong entwickelt. Notfallnummer: +123456789102"

                // Toleranzen
                pulsToleranzLow: 60
                pulsToleranzHigh: 60

                sauerstoffToleranz: 90

                co2ToleranzLow: 4
                co2ToleranzHigh: 40

                lungendruckToleranzLow: 1
                lungendruckToleranzHigh: 100

                sauerstoffmaschineToleranz: 90

                atemfrequenzToleranzLow: 5
                atemfrequenzToleranzHigh: 40

                beatmungsvolumenToleranzLow: 2
                beatmungsvolumenToleranzHigh: 5

                beatmungsdruckToleranzEinLow: 10
                beatmungsdruckToleranzEinHigh: 20
                beatmungsdruckToleranzAusLow: 5
                beatmungsdruckToleranzAusHigh: 10

                peepToleranz: 5
            }
            ListElement {
                //Patient - Wichtige Daten
                zustand: "yellow"
                name: "Marvin Raiser"
                station: "C.3.223"
                // Patient - Messwerte Dashboard
                puls: 67
                sauerstoff: 95
                co2: 5
                lungendruck: 34
                // Patient - Persönliche Daten
                personal: [
                    ListElement{}
                ]
                geburtsdatum: "05.01.2001"
                einweisungsdatum: "01.04.2020"
                diagnose: "COVID-19"
                diagnosedatum: "01.04.2020"
                vorerkrankungen: "Leichte Lüngenentzündung, Astma"
                organspender: "ja"
                notfallkontaktNummer: "+491721519175"
                /*
                // Verlauf - Patient
                pulsDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                sauerstoffDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                co2Daten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                lungendruckDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                //Verlauf - Gerät
                sauerstoffLuftDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                atemfrequenzDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsvolumenDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckEinDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckAusDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                */
                // Gerät - Wichtige Daten
                status: "in Betrieb"
                verbindungsstatus: "Verbunden"
                modell: "Fraunhofer Breath"
                version: "v0.1"
                // Gerät - Steuerung
                sauerstoffmaschine: 98
                atemfrequenz: 20
                beatmungsvolumen: 3
                beatmungsdruckEin: 12
                beatmungsdruckAus: 5
                peep: 5
                // Gerät - Hinweise
                hinweis: "Das Gerät wurde vom Fraunhofer IAO Team hinter Truong entwickelt. Notfallnummer: +123456789102"

                // Toleranzen
                pulsToleranzLow: 60
                pulsToleranzHigh: 60

                sauerstoffToleranz: 90

                co2ToleranzLow: 4
                co2ToleranzHigh: 40

                lungendruckToleranzLow: 1
                lungendruckToleranzHigh: 100

                sauerstoffmaschineToleranz: 90

                atemfrequenzToleranzLow: 5
                atemfrequenzToleranzHigh: 40

                beatmungsvolumenToleranzLow: 2
                beatmungsvolumenToleranzHigh: 5

                beatmungsdruckToleranzEinLow: 10
                beatmungsdruckToleranzEinHigh: 20
                beatmungsdruckToleranzAusLow: 5
                beatmungsdruckToleranzAusHigh: 10

                peepToleranz: 5
            }
            ListElement {
                //Patient - Wichtige Daten
                zustand: "red"
                zustandsInfo: "Puls über 160!"
                name: "Jan Salzgeber"
                station: "D.1.067"
                // Patient - Messwerte Dashboard
                puls: 160
                sauerstoff: 95
                co2: 5
                lungendruck: 34
                // Patient - Persönliche Daten
                personal: [
                    ListElement{}
                ]
                geburtsdatum: "05.01.2001"
                einweisungsdatum: "01.04.2020"
                diagnose: "COVID-19"
                diagnosedatum: "01.04.2020"
                vorerkrankungen: "Leichte Lüngenentzündung, Astma"
                organspender: "ja"
                notfallkontaktNummer: "+491721519175"
                /*
                // Verlauf - Patient
                pulsDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                sauerstoffDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                co2Daten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                lungendruckDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                //Verlauf - Gerät
                sauerstoffLuftDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                atemfrequenzDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsvolumenDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckEinDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckAusDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                */
                // Gerät - Wichtige Daten
                status: "in Betrieb"
                verbindungsstatus: "Verbunden"
                modell: "Fraunhofer Breath"
                version: "v0.1"
                // Gerät - Steuerung
                sauerstoffmaschine: 98
                atemfrequenz: 20
                beatmungsvolumen: 3
                beatmungsdruckEin: 12
                beatmungsdruckAus: 5
                peep: 5
                // Gerät - Hinweise
                hinweis: "Das Gerät wurde vom Fraunhofer IAO Team hinter Truong entwickelt. Notfallnummer: +123456789102"

                // Toleranzen
                pulsToleranzLow: 60
                pulsToleranzHigh: 60

                sauerstoffToleranz: 90

                co2ToleranzLow: 4
                co2ToleranzHigh: 40

                lungendruckToleranzLow: 1
                lungendruckToleranzHigh: 100

                sauerstoffmaschineToleranz: 90

                atemfrequenzToleranzLow: 5
                atemfrequenzToleranzHigh: 40

                beatmungsvolumenToleranzLow: 2
                beatmungsvolumenToleranzHigh: 5

                beatmungsdruckToleranzEinLow: 10
                beatmungsdruckToleranzEinHigh: 20
                beatmungsdruckToleranzAusLow: 5
                beatmungsdruckToleranzAusHigh: 10

                peepToleranz: 5
            }
            ListElement {
                //Patient - Wichtige Daten
                zustand: "grey"
                name: "Franziska Braun"
                station: "E.2.314"
                // Patient - Messwerte Dashboard
                puls: 67
                sauerstoff: 95
                co2: 5
                lungendruck: 34
                // Patient - Persönliche Daten
                personal: [
                    ListElement{}
                ]
                geburtsdatum: "05.01.2001"
                einweisungsdatum: "01.04.2020"
                diagnose: "COVID-19"
                diagnosedatum: "01.04.2020"
                vorerkrankungen: "Leichte Lüngenentzündung, Astma"
                organspender: "ja"
                notfallkontaktNummer: "+491721519175"
                /*
                // Verlauf - Patient
                pulsDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                sauerstoffDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                co2Daten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                lungendruckDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                //Verlauf - Gerät
                sauerstoffLuftDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                atemfrequenzDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsvolumenDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckEinDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                beatmungsdruckAusDaten: [[1,67],[2,75],[3,88],[4,100],[5,92],[6,110]]
                */
                // Gerät - Wichtige Daten
                status: "in Betrieb"
                verbindungsstatus: "Verbunden"
                modell: "Fraunhofer Breath"
                version: "v0.1"
                // Gerät - Steuerung
                sauerstoffmaschine: 98
                atemfrequenz: 20
                beatmungsvolumen: 3
                beatmungsdruckEin: 12
                beatmungsdruckAus: 5
                peep: 5
                // Gerät - Hinweise
                hinweis: "Das Gerät wurde vom Fraunhofer IAO Team hinter Truong entwickelt. Notfallnummer: +123456789102"

                // Toleranzen
                pulsToleranzLow: 60
                pulsToleranzHigh: 60

                sauerstoffToleranz: 90

                co2ToleranzLow: 4
                co2ToleranzHigh: 40

                lungendruckToleranzLow: 1
                lungendruckToleranzHigh: 100

                sauerstoffmaschineToleranz: 90

                atemfrequenzToleranzLow: 5
                atemfrequenzToleranzHigh: 40

                beatmungsvolumenToleranzLow: 2
                beatmungsvolumenToleranzHigh: 5

                beatmungsdruckToleranzEinLow: 10
                beatmungsdruckToleranzEinHigh: 20
                beatmungsdruckToleranzAusLow: 5
                beatmungsdruckToleranzAusHigh: 10

                peepToleranz: 5
            }
        }

        Component.onCompleted: addBed()
        function addBed(){
            //bedDataModel.append("qrc:/qml/BreathEmerge/BedDataElement.qml")
        }
    }
}
