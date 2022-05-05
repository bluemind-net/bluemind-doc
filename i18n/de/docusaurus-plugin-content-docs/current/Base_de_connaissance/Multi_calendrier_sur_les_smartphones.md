---
title: "Mehrere Kalender auf Smartphones"
confluence_id: 57771926
position: 62
---
# Mehrere Kalender auf Smartphones


## Präsentation

BlueMind ermöglicht über eine experimentelle Funktion die Abfrage mehrerer Terminplaner auf Android-Smartphones.

Diese Funktion sollte mit Vorsicht verwendet werden: Einige bekannte Fehlfunktionen wurden noch nicht behoben. Mehr dazu im folgenden Kapitel.


:::info

In BlueMind 4 betrifft dies nur die eigenen Kalender des Benutzers (Standardkalender und persönliche Unterkalender): die mit ihm geteilten Kalender, Domain-Kalender oder Kalender anderer Benutzer werden auf Smartphones nicht sichtbar sein.

:::

## Server-seitige Implementierung

Konfigurieren Sie diese Funktionalität, indem Sie eine Systemdatei erstellen.


```
# touch /root/eas.multical
```


Den EAS-Dienst neu starten:


```
# service bm-eas restart
```


## Funktionsweise

Damit geteilte Kalender erscheinen, müssen Sie diese zunächst in BlueMind über die Einstellungs-Verwaltung **abonnieren** : Einstellungen > Terminplaner > Abonnements.

## Bekannte Einschränkungen

#### Android: Google Terminplaner

Unter Android **werden alle geteilten Terminplaner in der gleichen Farbe angezeigt**, wodurch es unmöglich ist, Termine visuell nach Terminplaner zu unterscheiden.

**Lösung:** Installieren Sie eine Anwendung eines Drittanbieters, mit der Sie verschiedene Farben pro Terminplaner auswählen können.

Beispiel für eine von BlueMind getestete und validierte Anwendung: https: [//play.google.com/store/apps/details?id=net.slintes.android.ccc.full](https://play.google.com/store/apps/details?id=net.slintes.android.ccc.full)

#### Samsung: SPlanner

In der SPlanner-Anwendung von Samsung werden alle geteilten Terminplaner im Terminplaner des Benutzers zusammengeführt.

**Lösung: **Installieren und verwenden Sie die Android-Standardanwendung [Google Calendar](https://play.google.com/store/apps/details?id=com.google.android.calendar), gekoppelt mit einer Anwendung zur farblichen Unterscheidung (siehe oben).

NB: Bei einigen Geräten/Versionen erscheinen die Termine der Neben-Terminplaner überhaupt nicht in der SPlanner-Anwendung

