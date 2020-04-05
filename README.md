# BreathEmerge
An IoT medical emergency machines management app for the ["Give a Breath Challenge" by Fraunhofer and Munich Re](https://give-a-breath-challenge.innosabi.com/topic/detail/default/28)

## Die Challenge
(From offical website: https://give-a-breath-challenge.innosabi.com/topic/detail/default/28)
### Non-invasive ventilators or O2 concentrator
We are seeking for designs (print-ready CAD-files)  / ideas of non-invasive emergency-ventilators or O2 concentrator which are ready for rapid and scalable global manufacturing.

We are seeking for digitally distributable designs (production-ready CAD-files) for non-invasive ventilators or O2 concentrator, to provide governments and states around the world access to blueprints of non-invasive ventilators or O2 concentrator for download. Based on this,  decentral production via global 3D-printing capacities is possible.

This equipment should only be used in state of emergency for a decentral treatment of non-intensive-COVID-19-patients to reduce the demand for hospitalization. Furthermore, the selected designs have to be distributed globally “free to use” in order to enable large scale production.

Prices for winning this challenge:

- First place: 100 T€
- Second place: 50 T€
- Third place: 25 T€

Criteria (the criteria can be refined during the challenge due to changes of the situation):

    It is important that these designs can be produced in a cost effective and resource saving manner, using rapid manufacturing techniques (e.g.3D-printing)
    The ventilators must be easily calibrated by non-/minimally-trained staff using basic patient information like height, weight, BMI and other easily accessible information;
    Provide, at minimum, 10 BPM (breaths per minute);
    Made using existing or easily available or printable parts;
    Uses no oxygen source, or ambient air as an oxygen source but can also be connected to existing portable oxygen machines used for CPAP or industrial use

Additional requirements:

    Applicants do not have to apply as a team but we strongly advise applicants to search for team members on our platform
    The team function that is provided when submitting an idea helps to find team members. Alternatively or/and additionally, applicants can comment on others ideas and ask them to work together.
    Working as a team is not only an additional requirement it will also allow applicants to better refine their idea when entering the 2nd phase

### BreathEmerge - MyTeam!
Hier gehts zu unserer Abgabe: https://give-a-breath-challenge.innosabi.com/topic/detail/default/28/participate/46/suggestion/84/detail

Das Team besteht aus:
- Franziska Braun, Fraunhofer IAO
- Jan Salzgeber, Fraunhofer IAO
- Martin Osuji, Uni Stuttgart
- Marvin Raiser, Technische Universität München

## Features
### Monitoring und Steuerung
- Überwachen von beliebig vielen Patienten kompakt in einer App
- dynamisches Hinzufügen und Verwalten von unterschiedlichen Geräten und Patienten
- Verbindung zu IoT Geräten über MQTT oder Bluetooth
- Steuerung und Konfiguration der IoT Geräte
- Statistiken über Daten der Patienten

### UX Design
- Anordnung der Bedienelemente richtet sich an den medizinischen Alltag
- Notfallbenachrichtigungssystem mit schnell Bedienung

### Liste medizinischer Daten und Toleranzen, die die App verwaltet
- Puls
- Sauerstoffsättigung des Patienten
- CO2 der ausgeatmeten Luft
- Lungendruck
- Sauerstoffsättigung der zugeführten Luft der Maschine
- Atemfrequenz
- Beatmungsvolumen
- Beatmungsdruck inklusive positiver endexspiratorischer Druck (PEEP)

## Design - Konzept
Für das Design wurden Krankenschwestern und Ärztehelfer befragt, um herauszufinden wo welche Informationen wie schnell dargestellt werden können müssen.
<div style="content: ""; clear: both; display: table; box-sizing: border-box;">
    <div style="float: left; width: 20%; padding: 5px; box-sizing: border-box;">
          Dashboard<a href="https://i.imgur.com/wgisPEf.png"><img style="height: auto; width: auto" src="https://i.imgur.com/wgisPEf.png"></a>
    </div>
    <div style="float: left; width: 20%; padding: 5px; box-sizing: border-box;">
          Drawer<a href="https://i.imgur.com/TitX7VO.png"><img style="height: auto; width: auto" src="https://i.imgur.com/TitX7VO.png"></a>
    </div>
    <div style="float: left; width: 20%; padding: 5px; box-sizing: border-box;">
          Bett-Patient<a href="https://i.imgur.com/ilUsJ5Y.png"><img style="height: auto; width: auto" src="https://i.imgur.com/ilUsJ5Y.png"></a>
    </div>
    <div style="float: left; width: 20%; padding: 5px; box-sizing: border-box;">
          Bett-Verlauf<a href="https://i.imgur.com/9kxxGs3.png"><img style="height: auto; width: auto" src="https://i.imgur.com/9kxxGs3.png"></a>
    </div>
    <div style="float: left; width: 20%; padding: 5px; box-sizing: border-box;">
          Bett-Maschine<a href="https://i.imgur.com/FXbyWVf.png"><img style="height: auto; width: auto" src="https://i.imgur.com/FXbyWVf.png"></a>
    </div>
    <div>
    -> erstes schnelles Mockup an Material Dark Design angelehnt
    </div>
  </div>

---

Im Folgenden werden die einzelnen Screens erklärt. Die Reihenfolge der Elemente wiederspiegelt die Reihenfolge auf dem Bildschirm (Beispiel Bett-Patient: "Wichtige Daten" ganz oben, "Live Messwerte" in der Mitte und "Persönliche Daten" ganz unten)
### Dashboard
Die Übersicht über alle Patienten
- Patienten
    - BoxLabel: belegte und freie Maschinen
    - Buttons: Patient hinzufügen, Freie Maschinen in der Umgebung
- Statistik
    - Graph: Altersverteilung mit Vorerkrankung (Bar series)
    - Button: zur Filterung der Liste nach Alter, Vorerkrankungen
    - 
### Drawer
Dient zur schnellen Übersicht über den Gesundheitszustand aller Patienten mit ihrem Namen und Station

### Bett
Ein "Bett" repräsentiert ein Patienten an einer zugehörigen Maschine. Diese Hierarchie dient der objekt orientierten Programmierung.

#### Patient
Eine Seite zu allen aktuellen Patienten relevanten Daten
- Wichtige Daten
    - Name
    - Station (Ort)
    - Alter
    - Geschlecht
- MesswerteDashboard
    - Puls
    - Sauerstoffsättigung
    - Lungendruck
    - CO2
- Persönliche Daten
    - Name
    - Geburtsdatum, Alter
    - Einweisungsdatum
    - Diagnose, Dauer
    - Vorerkrankungen
    - Organspender (Ja/Nein)
    - Notfallkontakt Telefonnummer
#### Verlauf
- Patient
    - Puls
    - Sauerstoffsättigung
    - CO2
    - Lungendruck
- Maschine
    - SauerstoffGerät
    - Atemfrequenz
    - Beatmungsvolumen
    - Beatmungsdruck mit sichtbarer Grenze
#### Maschine
- Wichtige Daten
    - Status des Betriebs + Verbindungsstatus der App zum Gerät
    - Modell und Version
- Steuerung
    - SauerstoffGerät
    - Atemfrequenz
    - Beatmungsvolumen
    - Beatmungsdruck und Druckgrenze festlegen
    - Speichern und Hochladen DelayButton
- Weitere Informationen
    - Kalibrieren
    - Hilfe zum Gerät (Hersteller,Rufnummer)
### Notfallsystem
- Notfallbereich
    - überlagert jeden Screen
    - springe direkt zum Patienten aus egal welchem Screen
    - Prioritätenliste der Notfälle
        - Fälle bei denen zu erst gehandelt werden muss
        - nach Daten wie überlebensnotwendige Messwerte, Zeit, Schwere der Abweichung, möglich aber auch Alter und Diagnose
- Systembenachrichtigung direkt zum Patient
- Screen Border Animation / leuchtender Bildschirmrand entsprechend des Zustands
- Statusleuchte als ToolButton zum öffnen des Notfallbereichs und UI Element in Drawer
- Bett-/Patientenstatus
    - Grün, alles im Rahmen
    - Gelb, schnelle Änderungen in der Nähe der Toleranzen
    - Rot, Notfall, Messwerte über längeren Zeitraum außerhalb akzeptabler Krankheitsgrenzen
    - Grau, Verbindung verloren
    
### Patientenregistrierung
//ToDo

### Geräteregistrierung
- Über MQTT Geräteauswahl
//ToDo

### Einstellungen
//ToDo

## Umsetzung
Die Umsetzung erfolgt in Qt für eine plattformübergreifende Nutzung und Kompatibilität zu diversen medizinischen Geräten

### Fortschritt
- Setup Qt QML App: done
- Setup QT Charts: done
- Setup Android Support: 90%
- Objektorientierungshierarchie implementiert: done
- Datenstruktur definiert: 90%
- Material Design implementieren: done
- Screens
    - Dashboard: 30%
    - Drawer: done
    - Bett
        - Patient: 20%
        - Verlauf
        - Maschine
    - Notfallsystem
        - Notfallpopup: done
        - Systembenachrichtigung
        - Screen Border Animation
        - Statusleuchte ToolButton: done
        - Statusleuchte Drawer: done
    - Patientenregistrierung
    - Geräteregistrierung
    - Einstellungen
