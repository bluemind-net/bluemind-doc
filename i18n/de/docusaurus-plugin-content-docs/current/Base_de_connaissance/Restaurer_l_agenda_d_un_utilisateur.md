---
title: "Wiederherstellen des Kalenders eines Benutzers"
confluence_id: 57771957
position: 72
---
# Wiederherstellen des Kalenders eines Benutzers


## Präsentation

Diese Seite enthält die verschiedenen Schritte, um einen zuvor durch das automatisierte System gesicherten Kalender wiederherstellen zu können, unabhängig davon, ob die Backups ausgelagert sind oder nicht.

## Verfahren

### Backup-Wiederherstellung

Wenn Backups ausgelagert werden, ist der erste Schritt die Wiederherstellung des gewünschten Backups: [Wiederherstellen eines Backups von einem externen Speicherort](/Guide_de_l_administrateur/Sauvegarde_et_restauration/Restauration_unitaire_Navigation_DataProtect/Restauration_d_une_sauvegarde_depuis_un_emplacement_externe/)

### Wiederherstellung DataProtect

Sobald der gewünschte Backup vorhanden ist, gehen Sie zur BlueMind-Verwaltungskonsole > Sichern und Wiederherstellen > DataProtect-Navigation, um eine [Gerätewiederherstellung](/Guide_de_l_administrateur/Sauvegarde_et_restauration/Restauration_unitaire_Navigation_DataProtect/) durchzuführen.

Der Backup muss auf der Seite erscheinen. Ist dies nicht der Fall, klicken Sie auf die Schaltfläche Aktualisieren oben auf der Seite.

Um den Kalender wiederherzustellen:

1. Klicken Sie auf den gewünschten Backup: das System startet eine vorübergehende  Wiederherstellung der Daten und Sie können durch den Backup durchsuchen
2. Klicken Sie auf Schließen, um auf die Daten zuzugreifen
3. Suchen Sie den gewünschten Benutzer entweder durch direkte Navigation oder mit Hilfe von Schaltflächen und Suchfeld
4. Klicken Sie auf die Schaltfläche "Wiederherstellen" der entsprechenden Zeile
5. Es erscheint das Popup mit den möglichen Aktionen: ![](../attachments/57771733/57771738.png)2 Auswahlmöglichkeiten entsprechen der Wiederherstellung des Kalenders:
    1. ****Senden eines ICS-Exports per E-Mail****: Exportiert den Kalender der Benutzers im [ICS-Format ](http://fr.wikipedia.org/wiki/.ics) durch und versendet ihn per E-Mail. Sofern der Ziel-Kalender zuvor nicht [manuell zurückgesetzt](/Guide_de_l_utilisateur/L_agenda/Préférences_de_l_agenda/) wurde, werden beim Importieren der Datei die Termine **hinzugefügt**: Die nach der Sicherung vorgenommenen Änderungen und Erstellungen werden beibehalten, aber es besteht die Gefahr von Doppelgängern.
    2. ****Inhalt des Kalenders ersetzen****: Stellt den gesamten Kalender zum Datum der Sicherung wieder her. Alle Änderungen (neue Termine, Löschungen, Verschiebungen usw.), die seither vorgenommen wurden, gehen verloren.
6. Markieren Sie die gewünschte Option und klicken Sie auf "Wiederherstellen"
7. Der Fortschritt wird in Echtzeit im Popup angezeigt. Wenn der Vorgang beendet ist, erscheint die Schaltfläche "Schließen".


