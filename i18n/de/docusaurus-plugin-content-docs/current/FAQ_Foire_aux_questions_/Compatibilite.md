---
title: "Kompatibilität"
confluence_id: 57770212
position: 32
---
# Kompatibilität


Auf dieser Seite finden Sie Informationen über die Kompatibilität von BlueMind mit Browsern, Software von Drittanbietern und mobilen Geräten. Wir identifizieren sowohl getestete und validierte Geräte als auch bekannte Probleme auf bestimmten Geräten oder Betriebssystemen.

Wenn Ihr Gerät nicht auf dieser Seite aufgeführt ist, nehmen Sie bitte [Kontakt mit uns auf](http://www.blue-mind.net/nous-contacter/), um uns dies mitzuteilen.


## Browser


BlueMind unterstützt die folgenden Mindestversionen, aber **zu empfehlen ist immer die Verwendung der neuesten verfügbaren Versionen**:

| Browser | Mindestversion |
| --- | --- |
| Firefox | 52.0 ESR |
| Chrome | Neueste Version |
| Safari | 5 |
| Internet Explorer | 
11
 |
| Microsoft Edge | Neueste Version |

| Bekannte Einschränkungen | Windows XP | Administrationskonsole |
| --- | --- | --- |
| 
Es ist nicht möglich, BlueMind ab XP+IE8 oder XP+Outlook zu verwenden.
Eine Problemumgehung ist für BlueMind-3.0-Versionen ab [3.0.20](https://forge.bluemind.net/confluence/display/BM30/Fin+du+support+de+XP) möglich, wird mit BlueMind 3.5 jedoch nicht unterstützt.
 |
| Die BlueMind-Verwaltungskonsole wird von keiner Version von Internet Explorer unterstützt. |

## Thunderbird

BlueMind unterstützt aktuelle Versionen von Thunderbird, insbesondere ab Version 57.0.

Es ist jedoch ratsam, immer die verfügbaren Aktualisierungen durchzuführen, um von den Patches und Funktionen zu profitieren, die von den Herstellern und Anbietern veröffentlicht werden.

## Outlook


:::info

Dieser Abschnitt betrifft die Verwendung von Outlook mit MAPI, d.h. ohne Connector.

:::

Unabhängig von der Version ist BlueMind nur mit Outlook ****für Windows** kompatibel**; Outlook-Versionen für MacOS werden nicht unterstützt.

| Outlook-Version | 32-Bit-Version | 64bits |
| --- | --- | --- |
| Outlook 2007  | * &lt;sub>(und frühere Versionen)&lt;/sub> * | 
![](../attachments/57770017/66096274.png)
 | 
![](../attachments/57770212/58592395.png)
 |
| Outlook 2010 | 
![](../attachments/57770017/66096250.png) &lt;sup> &lt;em>(1)&lt;/em> &lt;/sup>
 | 
![](../attachments/57770212/58592393.png) &lt;sup> &lt;em>(1)&lt;/em> &lt;/sup>
 |
| 
Outlook 2013* &lt;sup> &lt;sub>(2)&lt;/sub> &lt;/sup> *
 | 
![](../attachments/57770017/66096275.png)
 | 
![](../attachments/57770212/58592394.png)
 |
| Outlook 2016 | 
![](../attachments/57770212/58592394.png)
 | 
![](../attachments/57770212/58592394.png)
 |

&lt;sup> &lt;em>(1) Die Funktionsfähigkeit mit Outlook 2010 kann von der Version von BlueMind und dem Aktualisierungsgrad des Client-Arbeitsplatzes abhängen. Kontaktieren Sie uns für weitere Details und eine individuelle Untersuchung.&lt;br/>&lt;/em> &lt;/sup>

&lt;sup> &lt;em>(2) Home&amp;Business, Standard, Professional, Professional Plus&lt;/em> &lt;/sup>

| Derzeit noch nicht unterstützte Outlook-Funktionen | Hybridmodus zwischengespeichert/online | Abtrennen von Anlagen | Rückruf von Nachrichten | Freigabe von E-Mail-Ordnern | Vorschlag einer neuen Uhrzeit | Papierkorb | Wiederherstellung von aus diesem Ordner gelöschten Elementen | Wiederherstellung von Elementen, die keine E-Mail-Elemente sind | Unterhaltungsmodus |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 
Konto, das für das Herunterladen von Elementen konfiguriert ist, die älter sind als ein definierter Zeitraum (z. B.: 1 Monat).
Aktuelle Daten werden heruntergeladen und lokal abgerufen, während auf ältere Daten direkt online zugegriffen wird.
 | 
**Empfehlung/Problemumgehung:** 
Verwendung des Modus *Offline*
 |
| Anfügen von Dateien an eine E-Mail und Abtrennen der Dateien in einem Dateifreigabebereich. |
| 
Abbruch des Versands einer E-Mail und Löschen dieser E-Mail aus der Sendewarteschlange des Servers oder Löschen der E-Mail oder Ersetzen des Nachrichtentextes durch eine Benachrichtigung, wenn die Zustellung in den Mailboxen der Benutzer bereits erfolgt ist.
 |
| 
Freigabe eines einzelnen E-Mail-Ordners und nicht der gesamten Mailbox.
 | 
**Empfehlung/Problemumgehung:**
Fordern Sie beim Administrator eine gemeinsame Mailbox für die betroffenen Benutzer an.
 |
| 
Gestattet, dem Organisator einer angefragten Besprechung eine neue Uhrzeit vorzuschlagen.
 | 
**Empfehlung/Problemumgehung:**
Antworten Sie negativ auf die Einladung und schlagen Sie eine neue Uhrzeit in der beigefügten Notiz vor.
 |
| 
Aus dem Papierkorb gelöschte Elemente können noch (gemäß einer Aufbewahrungsrichtlinie) vom Server abgerufen werden.
 | 
**Empfehlung/Problemumgehung:**
Kontaktieren Sie die Administratoren für eine eventuelle Wiederherstellung aus einem Backup.
 |
| Wiederherstellung eines in den Papierkorb verschobenen Termins, Kontakts usw. |
| 
Diese Funktion ist in der MAPI-Verwaltung von BlueMind noch nicht implementiert, so dass Outlook die Nachrichten nicht in einer Baumstruktur nach Konversationen darstellt.
 | 
Es kann jedoch vorkommen, dass bestimmte Nachrichten, die von bestimmten Clients von Drittanbietern (z. B. Webmailer oder Thunderbird) stammen, auf diese Weise sortiert werden.
 |

## Android

BlueMind läuft auf allen Android-Versionen ab Version 4.4.2 oder höher und **vorzugsweise auf der letzten aktualisierten Version, die vom Hersteller oder Mobilfunkbetreiber angeboten wird**.

Das verwendete EAS-Protokoll ist ein Standard; es ist jedoch möglich, dass aufgrund von Überlagerungen, die von Herstellern oder Betreibern hinzugefügt werden, einige Telefone nicht richtig funktionieren. Wenn unsere Teams informiert werden und wir in der Lage sind, das Telefon zu testen, auf dem die Probleme auftreten, erstellen wir ein Patch und integrieren dieses Telefon in die Liste der unterstützten Geräte.

Mobiltelefone, die eine *Stock-Android-Version* anbieten, sind zu bevorzugen: Es handelt sich um eine reine Android-Version, ohne Hersteller- oder Betreiber-Überlagerung oder vorinstallierte Zusatzanwendungen.

Hier ist die (nicht vollständige) Liste der mit BlueMind getesteten und funktionierenden Telefone:

- Samsung
    - Galaxy S4 (Android 4.2 bis 5.0.1)
    - Galaxy S7 (Android 6.0.1, 7.0)
- LG
    - Nexus 5 (Android 4.0 bis 4.4)
    - G4


| Bekannte Einschränkungen | Multikalenderanzeige | Keine Synchronisierung des Ordners Entwürfe | Huawei | Aufgaben |
| --- | --- | --- | --- | --- |
| 
Da Android es nicht erlaubt, die verschiedenen Kalender farblich differenziert darzustellen, ist die Anzeige von gemeinsamen Kalendern standardmäßig nicht möglich, nur der Kalender des Benutzers wird angezeigt und funktioniert.
 | 
Die Funktion kann jedoch aktiviert werden, um sie mit einer Drittanwendung zu koppeln: [Multikalender auf Smartphones.](/Base_de_connaissance/Multi_calendrier_sur_les_smartphones/)
 | 
****Achtung****: Dies betrifft nur die Kalender des Benutzers (Standardkalender und sekundäre Kalender), freigegebene Kalender (Domain oder andere Benutzer) werden auch nach der Aktivierung nicht sichtbar sein.
 |
| 
Die Synchronisierung von Entwürfen ist seit Version 16 des ActiveSync-Protokolls möglich. Da BlueMind die Version 14 implementiert, können Entwürfe noch nicht synchronisiert werden.
 |
| Die native Kalenderanwendung von Huawei bereitet Probleme, insbesondere durch unangebrachtes Löschen von Terminen. Bis zur Bereitstellung von Patches von Huawei empfiehlt es sich, statt dieser Kalenderanwendung die Kalenderanwendung von Google zu verwenden, die auf den Geräten vorhanden und funktionsfähig ist. |
| Die Aufgabenverwaltung ist derzeit nur auf Samsung-Geräten über die Anwendung des Herstellers (je nach Gerät und konfigurierter Sprache S Planner, Samsung Calendar oder Kalender) verfügbar. |

## Mac OS X

Die Protokolle CarDav und CalDav sind derzeit nur mit **nativen** Mac OS X-Clients und vorzugsweise mit einem aktuellen Betriebssystem validiert. In Anbetracht der Permissivität des Standards ist es uns nicht möglich, den korrekten Betrieb mit anderen Clients, die dieses Protokoll verwenden, zu zertifizieren.

## iPhone, iPad

IPhone- und iPad-Versionen mit der Mindestversion iOS 9.3.5 wurden getestet und werden ohne Einschränkung unterstützt; zu empfehlen ist jedoch immer die Verwendung der neuesten verfügbaren Version für Ihr Gerät.

| Bekannte Einschränkungen | Zeitliche Begrenzung der Synchronisierung | Keine Synchronisierung des Ordners Entwürfe |
| --- | --- | --- |
| Aus Gründen der Leistung ist die Synchronisierung der Nachrichten auf die letzten 30 Tage beschränkt, auch wenn die Option "Tout synchroniser" (Alles synchronisieren) auf dem Gerät ausgewählt ist. |
| Die Synchronisierung von Entwürfen ist seit Version 16 des ActiveSync-Protokolls möglich. Da BlueMind die Version 14 implementiert, können Entwürfe noch nicht synchronisiert werden. |

## Windows Phone

BlueMind funktioniert auf allen Windows-Phone-Versionen ab Version 7.10 (Mango, September 2011).

Hier ist die Liste der mit BlueMind funktionierenden Telefone:

- Nokia Lumia 520 (Lumia Schwarz - Windows Phone 8.0)


| Bekannte Einschränkungen | Zeitliche Begrenzung der Synchronisierung | Keine Synchronisierung des Ordners Entwürfe |
| --- | --- | --- |
| Aus Gründen der Leistung ist die Synchronisierung der Nachrichten auf die letzten 30 Tage beschränkt, auch wenn die Option "Tout synchroniser" (Alles synchronisieren) auf dem Gerät ausgewählt ist. |
| Die Synchronisierung von Entwürfen ist seit Version 16 des ActiveSync-Protokolls möglich. Da BlueMind die Version 14 implementiert, können Entwürfe noch nicht synchronisiert werden. |

## Blackberry

BlueMind funktioniert auf allen Blackberry-Versionen ab Version 10 (Anfang 2013).

Hier ist die Liste der mit BlueMind funktionierenden Telefone:

- Blackberry Q5
- Blackberry Q10


| Bekannte Einschränkungen | Multikalenderanzeige | Zeitliche Begrenzung der Synchronisierung | Keine Synchronisierung des Ordners Entwürfe |
| --- | --- | --- | --- |
| Da Blackberry allen synchronisierten Kalendern die gleiche E-Mail-Adresse zuweist, ist es derzeit nicht möglich, mehrere Kalender zu verwalten. Freigegebene Kalender werden nicht angezeigt, nur der Kalender des Benutzers wird angezeigt und ist funktionsfähig. |
| Aus Gründen der Leistung ist die Synchronisierung der Nachrichten auf die letzten 30 Tage beschränkt, auch wenn die Option "Tout synchroniser" (Alles synchronisieren) auf dem Gerät ausgewählt ist. |
| Die Synchronisierung von Entwürfen ist seit Version 16 des ActiveSync-Protokolls möglich. Da BlueMind die Version 14 implementiert, können Entwürfe noch nicht synchronisiert werden. |


