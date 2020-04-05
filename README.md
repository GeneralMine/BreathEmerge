# BreathEmerge
An IoT medical emergency machines management app for the "Give a Breath Challenge" by Fraunhofer and Munich Re

## Liste medizinischer Daten und Toleranzen, die die App verwalten kann
- Puls
- Sauerstoffsättigung
- CO2
- Lungendruck
- Sauerstoffsättigung der zugeführten Luft der Maschine
- Atemfrequenz
- Beatmungsvolumen
- BeatmungsdruckEin
- BeatmungsdruckAus
    - min: PEEP: 5-10

## Design
### Dashboard
- Patienten
    - BoxLabel: belegte und freie Maschinen
    - Buttons: Patient hinzufügen, Freie Maschinen in der Umgebung
- Statistik
    - Graph: Altersverteilung mit Vorerkrankung (Bar series)
    - Button: zur Filterung der Liste nach Alter, Vorerkrankungen
### Bett
- Patient
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
- Verlauf
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
- Maschine
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
        - Hilfe zum Gerät (Rufnummer)
### Notfallsystem
- Notfallarea
    - Bett-/Patientenstatus
        - Grün, alles im Rahmen
        - Gelb, schnelle Änderungen in der Nähe der Toleranzen
        - Rot, Notfall, Messwerte über längeren Zeitraum außerhalb akzeptabler Krankheitsgrenzen
        - Grau, Verbindung verloren
    - schiebt sich über jeden Screen
### Patientenregistrieren
- Über LAN Geräte auswahl
### Appeinstellungen
