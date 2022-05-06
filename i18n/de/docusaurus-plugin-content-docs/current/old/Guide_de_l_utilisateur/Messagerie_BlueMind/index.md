---
title: "BlueMind-Mail"
confluence_id: 66096291
position: 34
---
# BlueMind-Mail


## Präsentation

BlueMind hat einen brandneuen Webmailer entwickelt, der auf den von aktuellen Browsern angebotenen Webtechnologien basiert: Mit Web App Javascript bietet er eine neu gestaltete und intuitive Benutzeroberfläche, wobei die 3 Spalten an breite Bildschirme angepasst sind. Er ermöglicht vor allem eine schnellere und flüssigere Bedienung durch die Nutzung des lokalen Browserspeichers.

Diese Anwendung, die noch als Beta-Version vorliegt, umfasst noch nicht alle Funktionen des alten Webmailer. Aber er funktioniert. Und natürlich können Sie von der neuen Web-App zum alten Webmailer wechseln und alle Ihre Daten behalten. Die Funktionalitäten dieser Webanwendung werden schrittweise erweitert, um die gleichen Funktionen wie der alte Webmailer zu bieten.

Sie können sie ab sofort ausprobieren und testen! Aber seien Sie wachsam: in dieser Beta-Version können noch Fehlfunktionen auftreten.

Wir freuen uns schon auf Ihr Feedback!

![](../../attachments/66096291/66099873.png)


![](../../attachments/66096291/66099892.png)

## Den neuen E-Mail-Client testen

Die Administratoren müssen [den neuen Webmailer installieren und den Benutzern zur Verfügung stellen](/Guide_d_installation/Installation_du_nouveau_client_de_messagerie/).

Danach kann über einen Schalter oben rechts im Postfach zwischen dem klassischen Postfach und dem neuen BlueMind-Webmailer gewechselt werden:

![](../../attachments/66096291/66099889.png)

Der Benutzer kann den Wechsel auch über die Verwaltung seiner Parameter, Rubrik Messaging, vornehmen:

![](../../attachments/66096291/66099841.png)

## Anzeige

### Die Navigationsleiste

Die obere Leiste des Fensters wurde modernisiert und mit der neuen Benutzeroberfläche in Einklang gebracht. Sie ermöglicht:

- Im linken Teil den Wechsel zwischen Anwendungen:![](../../attachments/66096291/66099895.png)
- Im rechten Teil den Zugang zu den Einstellungen und die Abmeldung:![](../../attachments/66096291/66099894.png)
- ![](../../attachments/57770017/66096241.png) Im rechten Teil (über das Fragezeichen-Symbol) den direkten Zugriff auf die BlueMind-Online-Dokumentation:![](../../attachments/66096291/66099893.png)


### Der E-Mail-Client (Webmailer)

Die Hauptansicht des Postfachs besteht aus 3 Spalten:

![](../../attachments/66096291/66099896.png)

1.  **Linke Spalte:**  OrdnerbaumEr zeigt die Ordner in separaten einklappbaren Baumstrukturen an, um zum einen die Ordner des Benutzers und zum anderen die Ordner der freigegebenen Postfächer gruppieren zu können.
2.  **Mittlere Spalte:**  Die Liste der Nachrichten, die in dem in Spalte A ausgewählten Ordner enthalten sindMit den Filtern am oberen Rand der Liste kann ausgewählt werden, welche Nachrichten angezeigt werden sollen; wenn die Maus über eine Nachricht bewegt wird, werden Informationen und die möglichen Aktionen angezeigt.
3.  **Rechte Spalte:**  Hauptanzeigebereich Anstelle einer Begrüßung erscheinen hier die möglichen Aktionen oder ggf. die ausgewählte Meldung.
4.  **Aktionsleiste:** Sie enthält die Schaltfläche zum Erstellen einer neuen Nachricht, die Suchmaschine und die anzeigeabhängigen Schaltflächen der möglichen Aktionen (Aktionen für eine Nachricht, wenn sie angezeigt wird oder mögliche gruppierte Aktionen, wenn mehrere Nachrichten ausgewählt sind)


## Die Ordnerliste

### Präsentation

Die linke Spalte zeigt die hierarchische Liste der Ordner an, für die der Benutzer eine Lese- oder Lese- und Schreibberechtigung hat; diese sind in 2 einklappbare Baustrukturen gegliedert:

1. **Das Benutzerkonto** enthält die eigenen Ordner: Standardordner (Posteingang, gesendete Nachrichten, Papierkorb usw.), gefolgt von den vom Benutzer erstellten Ordnern, die alphabetisch sortiert sind.
2. **Freigegebene Ordner**: Gruppiert die gemeinsamen Postfächer, für die der Benutzer Lese- oder Schreibrechte hat.


:::info

Benutzer-Postfächer

In der Webmailer-Testversion erscheinen die Benutzer-Postfächer derzeit noch nicht. Sie werden in der definitiven Version verfügbar sein.

:::

Bei Auswahl eines Ordners:

- erscheinen die darin enthaltenen Nachrichten in der mittleren Spalte
- ist der Name des Ordners blau hinterlegt
- erscheint der Aufzählungspunkt, der die Anzahl der ungelesenen Nachrichten im Ordner anzeigt, leuchtend blau:


![](../../attachments/66096291/66099891.png) *Hier ist der Ordner "restored-2021-01-14" ausgewählt*

Bei Bewegung des Mauszeigers über einen Ordner erscheint ein Menü, das die möglichen Aktionen für diesen Ordner und die darin enthaltenen Nachrichten vorschlägt:

![](../../attachments/66096291/66099843.png)

Die verfügbaren Aktionen sind:

- **Unterordner erstellen** (siehe Details unten)
- **Ordner umbenennen** (siehe Details unten)
- **Löschen**


:::info
Das Löschen eines Ordners und seines Inhalts ist eine endgültige Löschung: Die im Ordner enthaltenen Nachrichten werden nicht in den Papierkorb verschoben.
:::

- **Alle als gelesen markieren**: alle Nachrichten im Ordner werden als gelesen markiert


:::tip

Die Aktion „Ordner leeren“ wird ab BlueMind Version 4.5 verfügbar sein. Sie wird auf alle Ordner anwendbar sein, nicht nur auf den Papierkorb.

:::

### Verwalten der Ordner

Die Verwaltung der Ordner erfolgt direkt aus der Ordnerliste.

#### Einen Ordner erstellen

- Unten in der Baumstruktur des Benutzers befindet sich der Eintrag "Neuer Ordner":![](../../attachments/66096291/66099887.png)
- Klicken Sie darauf, um das Eingabefeld anzuzeigen:![](../../attachments/66096291/66099886.png) 
    - Erstellung bestätigen: &lt;Eingabe> drücken.
    - Erstellung abbrechen: Drücken Sie &lt;Escape> oder klicken Sie auf das Kreuz am Ende der Zeile


#### Einen Unterordner erstellen

- Wechseln Sie in den übergeordneten Ordner des Ordners, den Sie erstellen möchten
- Klappen Sie das Menü auf (siehe oben)
- Klicken Sie auf „Unterordner erstellen“: es erscheint ein neuer Ordner unter dem gewählten Ordner mit einem Feld zur Eingabe des Namens:![](../../attachments/66096291/66099890.png)
    - Erstellung bestätigen: &lt;Eingabe> drücken.
    - Erstellung abbrechen: Drücken Sie &lt;Escape> oder klicken Sie auf das Kreuz am Ende der Zeile


#### Umbenennen eines Ordners

- Wechseln Sie zu dem Ordner, den Sie umbenennen möchten
- Klappen Sie das Menü auf (siehe oben)
- Klicken Sie auf „Ordner umbenennen“, der Name des Ordners kann nun bearbeitet werden:![](../../attachments/66096291/66099888.png) 
    - Erstellung bestätigen: &lt;Eingabe> drücken.
    - Erstellung abbrechen: Drücken Sie &lt;Escape> oder klicken Sie auf das Kreuz am Ende der Zeile


#### Löschen eines Ordners

- Wechseln Sie zu dem Ordner, den Sie löschen möchten
- Klappen Sie das Menü auf (siehe oben)
- Klicken Sie auf "Löschen"
- Auf der Benutzeroberfläche erscheint eine Bestätigungsaufforderung
- Bei Validierung durch den Benutzer werden der Ordner und die darin enthaltenen Nachrichten gelöscht.


:::info
Das Löschen eines Ordners und seines Inhalts ist eine endgültige Löschung: Die im Ordner enthaltenen Nachrichten werden nicht in den Papierkorb verschoben.
:::

#### Verschieben eines Ordners

Diese Funktion ist in der Webmailer-Testversion noch nicht verfügbar.

Um dies zu umgehen, müssen die darin enthaltenen Nachrichten verschoben werden:

- Erstellen des Zielordners am gewünschten Ort
- Gehen Sie zum Ursprungsordner
- Markieren Sie alle Nachrichten (Schaltfläche "Alle" oben in der Liste)
- Verschieben Sie die Nachrichten, indem Sie sie in den neuen Ordner ziehen (siehe unten)


## Nachrichtenliste

### Präsentation

![](../../attachments/66096291/66099844.png)


:::tip

Die Liste der Nachrichten ist derzeit nur nach Datum sortiert, dies wird sich in Zukunft ändern.

:::

Ungelesene Nachrichten sind durch ein blaues Banner am Anfang der Zeile gekennzeichnet und ihr Text ist fett gedruckt:

![](../../attachments/66096291/66099861.png)

3 Felder oben in der Liste ermöglichen ein Filtern der Anzeige:

![](../../attachments/66096291/66099883.png)

- **Alle**
- **Ungelesen**
- **Markiert**: zeigt nur als „wichtig“ markierte Nachrichten an


Mit dem Optionsfeld vor den Filtern können alle aktuell angezeigten Meldungen ausgewählt werden.

Einzelheiten zur individuellen Einstellung der Nachrichtenliste enthält Seite [Webmailer-Einstellungen](/Guide_de_l_utilisateur/Messagerie_BlueMind/Préférences_du_webmail/)

### Aktionen für Nachrichten

#### Direkte Aktionen

Die wichtigsten Aktionen sind zugänglich, wenn mit dem Mauszeiger über eine Nachricht in der Liste gefahren wird:

![](../../attachments/66096291/66099882.png)

Hier kann eine Nachricht:

- ausgewählt werden
- gelöscht werden
- als gelesen/nicht gelesen gekennzeichnet werden
- als verfolgt/nicht verfolgt gekennzeichnet werden


#### Nachrichten auswählen

##### Eine oder mehrere Nachricht(en) auswählen

Wenn der Mauszeiger über eine Nachricht bewegt wird, erscheint ein Optionsfeld, mit dem die Nachricht ausgewählt werden kann. Auf die Schaltflächen der gewünschten Nachricht(en) klicken um sie auszuwählen:

![](../../attachments/66096291/66099881.png)

##### Alle Nachrichten auswählen

Mit dem Optionsfeld am oberen Rand der Liste können Sie je nach aktiviertem Filter alle Nachrichten im Ordner auswählen bzw. abwählen:

![](../../attachments/66096291/66099855.png)

#### Gruppierte Aktionen für Nachrichten

Wenn eine oder mehrere Nachrichten ausgewählt sind, erscheinen die möglichen Aktionen in der Aktionsleiste und im Hauptanzeigebereich:

![](../../attachments/66096291/66099853.png)Die verfügbaren gruppierten Aktionen sind:

- **Als gelesen kennzeichnen**
- **Verschieben**: Öffnet ein Menü für die Suche nach dem gewünschten Zielordner:![](../../attachments/66096291/66099854.png)
- **Löschen**
- **Verfolgen**: markiert Nachrichten mit einem „Wichtig“-Flag (wird nur angezeigt, wenn nicht markierte Nachrichten ausgewählt sind)
- **Nicht mehr verfolgen**: entfernt das Flag von Nachrichten (wird nur angezeigt, wenn markierte Nachrichten ausgewählt sind)
- **Sonstige**: dieses Menü bietet die Aktion „Endgültig löschen“ an; nach Bestätigung werden die Nachrichten gelöscht, ohne in den Papierkorb verschoben zu werden


#### Verschieben von Nachrichten

Nachrichten können durch Ziehen und Ablegen verschoben werden, indem eine einzelne Nachricht direkt gezogen oder mehrere Nachrichten markiert werden (siehe oben):

![](../../attachments/66096291/66099885.png)

Eine Bestätigungsmeldung zeigt an, dass der Vorgang abgeschlossen ist. Auf den Ordnernamen in der Nachricht klicken, um automatisch zum Zielordner umgeleitet zu werden:
![](../../attachments/66096291/66099884.png)

## Anzeige einer Nachricht

Im Hauptanzeigebereich wird die ausgewählte Nachricht angezeigt:

![](../../attachments/66096291/66099880.png)Die Aktionsleiste oberhalb der Nachricht schlägt die für diese Nachricht verfügbaren Aktionen vor:

![](../../attachments/66096291/66099877.png)

Die Aktionen „Antworten“ und „Weiterleiten“ sind oben rechts in der Nachricht zugänglich:

![](../../attachments/66096291/66099879.png)

### Anhänge

Ein ausklappbares Feld unterhalb der Kopfzeile zeigt die in der Nachricht eingebetteten Anhänge an, wenn möglich mit einer Vorschau. Jede Datei kann über das Symbol heruntergeladen werden ![](../../attachments/66096291/66099878.png)

Je nach Art der Anlage wird durch Anklicken das Vorschaufenster geöffnet oder das Herunterladen oder Öffnen der Datei angeboten.


:::tip

Das Herunterladen aller Dateien mit einem Klick wird in einer zukünftigen Version verfügbar sein, ebenso wie die Verwaltung von [abgetrennten Anhängen](https://forge.bluemind.net/confluence/display/BM4/Fichiers+volumineux+et+detachement+des+pieces+jointes).

:::


