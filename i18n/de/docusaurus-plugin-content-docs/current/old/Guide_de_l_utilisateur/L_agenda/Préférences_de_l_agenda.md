---
title: "Kalender-Einstellungen"
confluence_id: 57770563
position: 52
---
# Kalender-Einstellungen


## Präsentation

Um auf die Kalendereinstellungen zuzugreifen, gehen Sie zu „Mein Konto“, indem Sie auf den Benutzernamen rechts in der Navigationsleiste klicken:

![](../../attachments/57770060/57770071.png)


## Allgemeine Einstellungen

Auf der ersten Registerkarte der Kalendereinstellungen kann der Benutzer seine Anzeige- und Zeitverwaltungseinstellungen festlegen:

![](../../attachments/57770563/62558501.png)

Mit den Angaben zu Tagesbeginn und -ende sowie den Arbeitstagen lassen sich die Zeitfenster definieren, die von BlueMind als gearbeitet betrachtet werden. So wird z. B. bei der Suche nach Verfügbarkeiten oder beim Verschicken einer Einladung dem Veranstalter mitgeteilt, dass der Termin außerhalb der Arbeitszeiten des Benutzers liegt.

Der Benutzer hat hier die Möglichkeit, Standard-Erinnerungen für Termine zu definieren oder sie im Gegenteil zu deaktivieren.
**Diese Einstellung betrifft neue Termine, sie ist nicht rückwirkend auf bereits im Kalender vorhandene Termine**.

Sie können separat definieren:

- eine Erinnerung für klassische Termine (begrenzte Uhrzeiten)
- eine Erinnerung für Termine, die über einen ganzen Tag definiert sind: Die Einstellung definiert die Zeit „vor Mitternacht“.Die Standardeinstellung ist z. B. auf 7 gesetzt, so dass die Erinnerung um 24-7=17h gesendet wird


:::tip

Ist eine Erinnerung deaktiviert, ist das Feld leer und die entsprechende Dropdown-Liste steht auf „Sekunden“.

:::

## Meine Kalender

Die Registerkarte „Meine Kalender“ ermöglicht den Zugriff auf die Kalenderverwaltung des Benutzers:

- persönliche Kalender: siehe Seite [Kalender](/Guide_de_l_utilisateur/L_agenda/) - §3 Multi-Kalender
- externe Kalender: siehe die entsprechende Seite [Externe Kalender](/Guide_de_l_utilisateur/L_agenda/Les_calendriers_externes/)


![](../../attachments/57770563/62558504.png)

## Abonnements

Auf dieser Registerkarte kann der Benutzer persönliche, freigegebene oder Domänenkalender abonnieren und ihre Synchronisierung für die Verwendung offline oder auf Client Tiers (Fat-Client-Software oder Mobilgerät) aktivieren.

![](../../attachments/57770563/62558512.png)

Wenn die Synchronisierung für einen Kalender aktiviert ist, werden die Daten in die Client-Software hochgeladen. Daher:

|  | Synchronisierung aktiviert | Synchronisierung deaktiviert | Webanwendung und Thunderbird | EAS iOS | EAS (andere) | DAV | Outlook (Connector) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| der Kalender ist offline anzeigbar und verfügbar | der Kalender ist im verbundenen Modus einsehbar, aber offline nicht verfügbar |
| 
der Kalender wird angezeigt und ist offline verfügbar


:::info

Gemeinsame Kalender

In der BlueMind Version 4 betrifft dies nur die Kalender des Benutzers (Standard- und Nebenkalender), freigegebene Kalender werden nicht angezeigt, egal ob Domäne oder andere Benutzer.

:::
 | der Kalender wird nicht angezeigt |
| 
**wenn diese Funktion vom Administrator aktiviert wurde** (weitere Details finden Sie auf der Seite [Kompatibilität](/FAQ_Foire_aux_questions_/Compatibilité/)):
- der Kalender wird angezeigt
- der Kalender ist offline verfügbar


:::info

Gemeinsame Kalender

In der BlueMind Version 4 betrifft dies nur die Kalender des Benutzers (Standard- und Nebenkalender), freigegebene Kalender werden nicht angezeigt, egal ob Domäne oder andere Benutzer.

:::
 | 
der Kalender wird nicht angezeigt
 |
| der Kalender wird angezeigt und ist offline verfügbar |
| - der Kalender wird angezeigt und ist offline verfügbar | 


 | - Wenn ein Kalenderabonnement in Outlook hinzugefügt wird, wird es bei aktivierter Synchronisation automatisch in BlueMind hinzugefügt | der Kalender wird nicht angezeigt |


:::info

Wenn die in einem Kalender enthaltene Datenmenge groß ist (mehr als 9000 Einträge), warnt eine Meldung vor möglichen Synchronisationsproblemen.

:::

So fügen Sie einen Kalender hinzu:

- Geben Sie den Namen des gesuchten Kalenders ein (Benutzer, Ressource usw.)
- Mit der Eingabetaste bestätigen oder in der von der Autovervollständigung vorgeschlagenen Liste wählen
- Falls gewünscht können Sie die Synchronisation deaktivieren
- **Klicken Sie auf die Schaltfläche „Speichern“, um die Änderungen zu speichern.**


So löschen Sie einen Kalender:

- Klicken Sie auf das Papierkorbsymbol am Ende der Zeile ![](../../attachments/57770563/62558516.png)
- **Klicken Sie auf die Schaltfläche „Speichern“, um die Änderungen zu speichern.**


:::info

Auf „Speichern“ klicken, um eine Änderung des Synchronisationsstatus zu berücksichtigen und dann **die Synchronisation neu starten (oder auf die automatische Synchronisation  warten) auf der Client-Software**, damit die Änderungen berücksichtigt werden (Herunterladen und Anzeigen von Daten bei Aktivierung, Löschen von Daten bei Deaktivierung).

:::

## Verwaltung der Freigaben

Auf dieser Registerkarte kann der Benutzer die Freigabe von ihm geführter Kalender verwalten: seine Kalender, aber auch die der Ressourcen oder Benutzer, die ihm die Änderungs- und Verwaltungsrechte erteilt haben.

Die Freigabeverwaltung ermöglicht zudem, [einen Kalender für Benutzer außerhalb der](/Guide_de_l_utilisateur/L_agenda/Le_partage_d_agenda/#Lepartaged'agenda-partage-exterieur) BlueMind-Domäne freizugeben

![](../../attachments/57770563/62558510.png)


:::info

Standardmäßig wird die eigene Freigabe des Benutzers angezeigt, der über die Änderungs- und Verwaltungsrechte verfügt: diese Freigabe kann weder gelöscht noch reduziert werden.

:::

So verwalten Sie die Freigaben

- Wählen Sie in der ersten Dropdown-Liste die zu verwaltende Entität (den Benutzer oder eine seiner Delegationen):![](../../attachments/57770563/62558508.png)
- Geben Sie im zugehörigen Eingabefeld den Namen der Person oder Gruppe ein, für die Sie den Kalender freigeben möchten
- Mit der Eingabetaste bestätigen oder in der von der Autovervollständigung vorgeschlagenen Liste wählen
- Der Benutzer wird zur Liste hinzugefügt, wählen Sie in der Dropdown-Liste seiner Zeile das Recht, das ihm zugeordnet werden soll:![](../../attachments/57770563/62558506.png) 
    1. **Kann mich zu einer Sitzung einladen**: Der Benutzer kann mich einladen, indem er mich zur Teilnehmerliste eines Termins hinzufügt
    2. **Kann mich einladen und meine Termine sehen**: zusätzlich zum obigen Recht kann der Benutzer meinen Kalender einsehen
    3. **Kann meine Termine ändern**: zusätzlich zu den obigen Rechten kann der Benutzer einen Termin zu meinem Kalender hinzufügen, ihn ändern, löschen oder meine Teilnahme an einem Termin bestätigen oder ablehnen
    4. **Kann meine Termine ändern und meine Freigaben verwalten**: Zusätzlich zu den obigen Rechten kann der Benutzer die Freigaberechte meines Kalenders verwalten
- Wenn alle Freigaben wie gewünscht definiert sind, **klicken Sie auf die Schaltfläche „Speichern“, um die Änderungen zu berücksichtigen.**


:::info

Im Bereich „Öffentliche Freigabe“ können Sie die Freigabe für **alle Benutzer der Domäne**aktivieren und einstellen, wenn Sie sich sicher sind, was Sie tun

:::

Für weitere Informationen siehe [Verwaltung der Freigaben](/Guide_de_l_utilisateur/Gestion_des_partages/)


