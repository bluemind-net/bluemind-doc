---
title: "Lokale Kontakte in BlueMind importieren"
confluence_id: 57771116
position: 76
---
# Lokale Kontakte in BlueMind importieren


## Präsentation

Beim Migrieren verfügen Sie möglicherweise bereits über Kontakte auf Ihrem IOS-Gerät. Diese Prozedur erklärt, wie Sie Ihre alten IOS-Kontakte in BlueMind integrieren, so dass sie auf all Ihren synchronisierten Geräten (Smartphone, Web, Fat Client) verfügbar sind.


:::info

Diese Anleitung wurde mit einem IPad-Modell erstellt. Die Bildschirme sind im Allgemeinen bei allen Apple-Produkten identisch, können aber je nach Version abweichen.

:::

## Verfahren


:::info

Ein E-Mail-Konto muss auf dem Gerät vorhanden sein, um Kontakte an den BlueMind-Benutzer zu senden. Wenn der Benutzer keine andere Mailbox als BlueMind hat, kann er sein BlueMind-Konto entweder über EAS oder über ein IMAP-Konto einrichten, dies hat keine negativen Auswirkungen auf das Verfahren.

:::

1. Zunächst müssen die Kontakte auf dem IOS-Gerät im vCard-Format (.vcf-Datei) exportiert werden:


    - IOS allein ist nicht in der Lage, das gesamte Adressbuch zu exportieren, Sie müssen die Anwendung eines Drittanbieters verwenden, wie z. B. [Backup Contacts + Share](https://itunes.apple.com/us/app/backup-contacts-+-share/id486537944?mt=8&ign-mpt=uo%3D4) , das im App Store erhältlich ist.
Mit dieser Anwendung können Sie die Kontakte Ihrer Wahl in einer Datei speichern und per E-Mail teilen. *(Weitere Informationen finden Sie auf der Website des Herausgebers)*


:::info

Wenn Sie nach dem Erstellen des BlueMind EAS-Kontos exportieren, exportieren Sie nur Kontakte aus dem lokalen Adressbuch, da sonst alle BlueMind-Kontakte dupliziert werden.

:::
Nachdem die Datei erzeugt wurde, senden Sie sie per E-Mail an die Adresse des Benutzers.


    - Wenn Sie keine Anwendung eines Drittanbieters verwenden oder nicht alle Kontakte exportieren möchten, kann jeder Kontakt einzeln exportiert werden.Drücken Sie in der Anwendung „Kontakte“ auf jeden zu exportierenden Kontaktdatensatz auf „Diesen Datensatz senden“ und dann auf „Per E-Mail senden“. Eine .vcf-Datei wird an eine neue Nachricht angehängt, die an die Adresse des Benutzers gesendet werden muss.![](../../../attachments/57771116/57771120.png)
1. Anmeldung über einen Browser bei BlueMind
2. Öffnen Sie die Nachricht(en), welche die zu importierenden Dateien enthalten, und speichern Sie diese Dateien auf dem Computer
3. Gehen Sie zur Anwendung Kontakte und [importieren Sie die Datei](/Guide_de_l_utilisateur/Les_contacts/)
4. Wenn es noch nicht existiert, [erstellen Sie das entsprechende Benutzerkonto](/Guide_de_l_utilisateur/Configuration_des_périphériques_mobiles/Synchronisation_avec_iOS/) auf dem IOS-Gerät
5. Stellen Sie sicher, dass die Synchronisation der Kontakte aktiviert wurde: 
    - Nach der Erstellung bei der Auswahl der zu synchronisierenden Elemente (siehe Link oben zur Erstellung eines Benutzers)
    - Wenn das Konto bereits existiert, gehen Sie zu den Einstellungen und wählen Sie das Konto aus:![](../../../attachments/57771116/57771122.png)
6. Um spätere Duplikate zu vermeiden, wählen Sie das Löschen der Kontakte, wenn das Gerät dies bei aktivierter Synchronisation anbietet:
![](../../../attachments/57771116/57771118.png)


:::tip

In manchen Fällen bietet das Gerät das Löschen lokaler Daten nicht an. Sie müssen dann zur Anwendung „Kontakte“ gehen und die Kontakte manuell löschen.

:::

7. Gehen Sie zur Anwendung Kontakte: Die Kontakte von BlueMind werden angezeigt und enthalten nun die Kontakte, die zuvor nur auf dem Gerät waren.


