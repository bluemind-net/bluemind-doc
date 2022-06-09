---
title: "Verfahren zum Abmelden eines Benutzers und zur Umleitung seiner Mails"
confluence_id: 57771508
position: 60
---
# Verfahren zum Abmelden eines Benutzers und zur Umleitung seiner Mails


## Präsentation

Ein ausscheidender Mitarbeiter muss archiviert und seine Daten müssen abgerufen werden. In manchen Organisationen ist es auch wünschenswert, dass E-Mails an die Organisation weiterhin von der Organisation empfangen werden können.

Dieses Verfahren beschreibt diese Vorgänge, die mehrere Möglichkeiten bieten:

- Archivieren des Benutzers
- Daten sichern und archivieren
- Neu eingegangene Mails an einen anderen Posteingang weiterleiten.


In diesem Beispiel:

- Der zu archivierende Benutzer hat die Adresse [user1@bm.com](mailto:user1@bm.com)
- Der die Mails von user1 empfangende Benutzer ist [userCS@bm.com ](mailto:userCS@bm.com)


## Lösung mit E-Mail-Weiterleitung

Um neue E-Mails für einen Mitarbeiter, der das Unternehmen verlassen hat, abzurufen, gibt es zwei Möglichkeiten:

- Nachrichten an einen anderen Benutzer weiterleiten: Die E-Mail-Adressen des ausgeschiedenen Benutzers ([user1@bm.com](mailto:user1@bm.com) in unserem Beispiel) als Alias des Zielbenutzers hinzufügen
- Nachrichten an einen geteilten Posteingang weiterleiten: Es wird ein geteilter Posteingang mit der Adresse des abwesenden Benutzers (user1@bm.com) oder einem entsprechenden Alias erstellt.


Vorgehensweise:

1. Benennen Sie den Benutzer in user1.bck um
2. Ein Alias auf user1.bck ab der Adresse user1 2‘ setzen. ODER: Einen eventuell geteilten Posteingang erstellen bp.userbck
3. Mails von user1.bck nach userCS umleiten (mit oder ohne lokale Kopie)
4. Den nächsten globalen Backup abwarten.
5. E-Mail-Wiederherstellung - 3 Möglichkeiten:
    1. Verwenden Sie einen Fat Client wie Thunderbird, um alle Nachrichten in den geteilten Posteingang bp.userbck zu kopieren
    2. Verwenden Sie einen Fat Client wie Thunderbird, um alle Nachrichten im POP-Modus abzurufen
    3. Verwenden Sie das Skript von [Wiederherstellen des Inhalts eines Benutzer- oder geteilten Posteingangs](/Base_de_connaissance/Restauration_du_contenu_d_une_boite_utilisateur_ou_partagee/) für den Zielbenutzer oder den geteilten Posteingang
6. Wiederherstellung von Kontakten und Terminplaner
    1. In der Administrationskonsole das Menü "DataProtect-Baumstruktur" aufrufen
    2. Klicken Sie auf das letzte Backup
    3. Wählen Sie den Benutzer user1.bck
    4. Klicken Sie auf die Links, um die VCard-Dateien (Adressbücher) und die ICS-Datei (Terminplanerdaten) abzurufen.
7. Löschen Sie den Benutzer user1.bck
8. Erstellen Sie einen Alias user1 für den Benutzer userCS


## Lösung mit automatischer Antwort

Aus Gründen der Vertraulichkeit ist es in manchen Fällen vorzuziehen, nicht alle neuen Nachrichten eines Mitarbeiters an einen anderen weiterleiten und stattdessen eine Rückmeldung an den Absender zu senden mit der Bitte, einen anderen Mitarbeiter zu kontaktieren.

In diesem Fall sind zwei Lösungen möglich:

- Legen Sie einen neuen Benutzer user2.out an, indem Sie ihm als Alias die E-Mail-Adresse des ausgeschiedenen Benutzers user1@bm.com geben und eine personalisierte Abwesenheitsnachricht einrichten. Der Vorteil dieses Ansatzes ist, dass für jeden Benutzer eine personalisierte Nachricht eingerichtet werden kann, der Nachteil, dass **dieser Benutzer in der Anzahl der Benutzer für das Abonnement gezählt wird**.
- Legen Sie einen einzelnen Benutzer user.deactivated an, indem Sie ihm als Alias die Adressen und Aliasnamen aller nicht mehr anwesenden Mitarbeiter geben und dann eine gemeinsame Abwesenheitsmeldung für alle Benutzer einrichten. So kann **ein einzelner Benutzer** alle nicht mehr vorhandenen Benutzer verwalten.


## Löschen und Synchronisieren von Verzeichnissen

Wenn ein Benutzer in AD/LDAP gelöscht wird, wird er bei der Synchronisation automatisch in BlueMind archiviert.

Das Löschen im Verzeichnis kann daher jederzeit während des Vorgangs erfolgen. Dadurch wird der Benutzer in BlueMind deaktiviert und kann sich nicht mehr anmelden, seine Daten werden jedoch nicht gelöscht.

Sie können also wie oben beschrieben vorgehen und den Benutzer anschließend aus dem Verzeichnis löschen.


