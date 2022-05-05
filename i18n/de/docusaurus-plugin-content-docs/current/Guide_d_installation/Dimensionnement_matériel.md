---
title: "Materialdimensionierung"
confluence_id: 57771183
position: 36
---
# Materialdimensionierung


## Präsentation

Die hier angegebenen Daten sind unverbindlich. In der Tat kann die Nutzung bei gleicher Anzahl von Benutzern je nach Struktur und Gewohnheiten sehr unterschiedlich sein. Die Anzahl der E-Mails, ihre Größe, die Anzahl der Empfänger in den E-Mails, die Anzahl der Termine, die Planung usw. fallen täglich sehr unterschiedlich aus.


## Das Prinzip der Einheiten

In einem System wie BlueMind gibt es verschiedene ressourcenverbrauchende Komponenten.

Die „pro Benutzer“-Basisberechnung ist nicht gültig, da ein Benutzer, der nur die Mailbox verwendet, das System nicht in der gleichen Weise beansprucht wie einer, der E-Mail und kollaborative Tools (Kalender usw.) nutzt, insbesondere mit einem Smartphone.

Die Berechnung der Dimensionierung erfolgt daher pro Rechner, wobei:

| Benutzerprofil | Preis pro Einheit |
| --- | --- |
| 
Nur Mailbox
 | 
1
 |
| 
Mailbox + intensiv kollaborativ
 | 
2
 |
| 
Mailbox + kollaborativ + Smartphone
 | 
5
 |

Ebenso wird bei gleicher Anzahl von Einheiten eine reine Mailbox-Nutzung nicht den gleichen Ressourcenverbrauch aufweisen wie eine Mailbox + Kollaborationsnutzung (für die Hälfte der Benutzer). Zum Beispiel ist die E-Mail mehr von IO als von CPU abhängig, was im Allgemeinen das Gegenteil von kollaborativen Tools ist.

## CPU

Anzahl der Kerne (Cores). Die Referenz ist eine aktuelle Server-CPU, Typ Xeon.

BlueMind enthält viele Dienste, daher empfehlen wir mindestens 2 Kerne.

Beachten Sie, dass die Zuweisung von zu vielen CPUs zu anderen Problemen in virtualisierten Umgebungen führen kann [(https://techan.fr/problemes-de-performance-sur-vmware-du-a-du-cpu-ready.html](https://techan.fr/problemes-de-performance-sur-vmware-du-a-du-cpu-ready.html))

| Einheiten | Anzahl der Kerne |
| --- | --- |
| 1-200 | 2 |
| 200-1000 | 4 |
| 1000-2000 | 6 |
| 2000-3000 | 8 |
| 3000-6000 | 12 |
| 6000+ | 2 Kerne / 1000 Einheiten |

## RAM

| Einheiten | Ram |
| --- | --- |
| 1-250 | 16 GB |
| 250-1000 | 24 GB |
| 1000-2500 | 32 GB |
| 2500 - 5000 | 48 GB |
| 5000-10000 | 64 GB* |
| 10000+ | 96 GB* |

**mit Verschiebung des Dienstes Cyrus und bm-elasticsearch auf dedizierte Server*

## Speicherung / IO


:::info

IOPS = „In/Out per second“, d.h. „Ein-/Ausgabe pro Sekunde“

:::

Der Speicher wird in IOPS bemessen, da ein Mailbox-Dienst viele IOs verbraucht. Der Speicherplatz ist direkt abhängig vom Bedarf des Kunden (Kontingente usw.)

| Einheiten | IOPS pro Einheit |
| --- | --- |
| 
1
 | 
.3
 |

### IOPS-Daten der Speichermedien (Wikipedia)

| Gerät   | Typ   | IOPS   | Schnittstelle   | Hinweise   |
| --- | --- | --- | --- | --- |
| 
7.200 [ U/min. ](http://en.wikipedia.org/wiki/Revolutions_per_minute)   [ SATA ](http://en.wikipedia.org/wiki/SATA) Laufwerke
 | 
[ HDD   ](http://en.wikipedia.org/wiki/Hard_disk_drive)
 | 
~75-100 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SATA 3 [ Gbit/s   ](http://en.wikipedia.org/wiki/Data_rate_units#Gigabit_per_second)
 | 


 | [   ](http://en.wikipedia.org/wiki/Data_rate_units#Gigabit_per_second) |
| 
10.000 U/min SATA-Laufwerke
 | 
HDD
 | 
~125-150 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SATA 3 Gbit/s
 | 


 |   |
| 
10.000 U/min [ SAS ](http://en.wikipedia.org/wiki/Serial_Attached_SCSI) Laufwerke
 | 
HDD
 | 
~140 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SAS
 | 


 |   |
| 
15.000 U/min [ SAS ](http://en.wikipedia.org/wiki/Serial_Attached_SCSI) Laufwerke
 | 
HDD
 | 
~175-210 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SAS
 | 


 |

## Beispiele

Die Verteilung von Kernen / Ram auf mehrere Server (virtuell oder nicht) wird hier nicht beschrieben.

Bis zu 16/24 Kernen halten wir es jedoch für sinnvoll, das Ganze auf der gleichen Plattform zu installieren.

Darüber hinaus und zur Verwaltung von zehn oder tausenden von Benutzern muss die Architektur verteilt sein.

Dann muss der Mailbox-Teil getrennt werden, ebenso wie die Datenbank (sehr beansprucht bei den kollaborativen Teilen / Smartphones).

|  Benutzer / Einheiten  | Knoten |  CPU  #Kerne  |  RAMin GB |  IOPS / Festplatte  |
| --- | --- | --- | --- | --- |
| 
25 Benutzer / 5 mit Smartphones
 | 
45 Einheiten (20 + 25)
 | 


 | 
2
 | 
16
 | 
13,5 / beliebige Festplatte
 |
| 
150 Benutzer / 50 Mitarbeiter, davon 25 mit Smartphones
 | 
225 Einheiten (100+25*2+25*5)
 | 


 | 
4
 | 
16
 | 
67,5
 | 
SATA 7200 mindestens
 |
| 
300 Benutzer / 100 Mitarbeiter / 30 Smartphones
 | 
490 Einheiten (200 + 70*2 + 30*5)
 | 


 | 
4
 | 
24
 | 
147
 | 
2 * 10K U/min SAS
 | 
1 * 15K U/min SAS
 |
| 
600 Benutzer / 200 Mitarbeiter / 50 Smartphones
 | 
950 Einheiten (400 + 150*2 * 50*5) → 4 CPU, 24 GB RAM
 | Kern | 
2
 | 
20
 | 
285
 | 
SSD, Rack oder anderes System
 |
| Edge | 2 | 4 | 


 |
| 
1000 Ben. / 250 Mitarbeiter / 100 Smartphones
 | 
1300 Einheiten (750 + 150 * 2 + 100 * 5) → 6 CPU, 32 GB RAM
 | Kern | 
2
 | 
20
 | 
390
 | 
SSD, Rack oder anderes System
 |
| BM-Speicherplatz | 2 | 8 | Dedizierter Speicherplatz ab 1TB E-Mails und Archive |
| Edge | 2 | 4 | 


 |
| 
2000 Ben. / 500 Mitarbeiter / 200 Smartphones
 | 
3100 Einheiten (1500 + 300*2 + 200 * 5) → 12 CPU, 48 GB RAM
 | Kern | 
6
 | 
20
 | 
930
 | 
Rack (2000 IOPS)
 |
| BM-Speicherplatz | 2 | 12 | Dedizierter Speicherplatz ab 1TB E-Mails und Archive |
| 
Cyrus
 | 2 | 12 | Dedizierter Cyrus ab 2 TB E-Mails und Archive |
| Edge | 2 | 4 | 


 |
| 
4000 Ben. / 1000 Mitarbeiter / 300 Smartphones
 | 
5900 Einheiten (3000 + 700*2 + 300*5) → 12 CPU, 64 GB RAM
 | Kern | 
6
 | 
36
 | 
1770
 | 
Rack (2-3000 IOPS)
 |
| BM-Speicherplatz | 2 | 12 | Dedizierter Speicherplatz ab 1TB E-Mails und Archive |
| 
Cyrus
 | 2 | 12 | Dedizierter Cyrus ab 2 TB E-Mails und Archive |
| Edge | 2 | 4 | 


 |
| 
4000 Ben. / 1000 Mitarbeiter / 1000 Smartphones
 | 
8000 Einheiten (3000 + 1000*5) → 16 CPU, 64 GB RAM
 | Kern | 
6
 | 
36
 | 
2400
 | 
RACK 3000 IOPS
 | 
SAN / andere Techno
 |
| BM-Speicherplatz | 4 | 12 | Dedizierter Speicherplatz ab 1TB E-Mails und Archive |
| 
Cyrus
 | 4 | 12 | Dedizierter Cyrus ab 2 TB E-Mails und Archive |
| Edge | 2 | 4 | 


 |
| 
4000 Ben. / 4000 Mitarbeiter / 1000 Smartphones
 | 
11000 Einheiten (3000*2 + 1000*5) → 22 CPU, 96 GB RAM
 | Kern | 
10
 | 
44
 | 
3300
 | 
SAN / andere Techno
 |
| BM-Speicherplatz | 4 | 24 | Dedizierter Speicherplatz ab 1TB E-Mails und Archive |
| 
Cyrus
 | 6 | 24 | 
Dedizierter Cyrus ab 2 TB E-Mails und Archive
 | 
2. Cyrus-Knoten zu berücksichtigen
 |
| Edge | 2 | 4 | 


 |
| 
mehr als 5000 Benutzer (10.000, 100.000 usw.)
 | 
Das System muss verteilt sein und die Architektur entsprechend dem jeweiligen Kontext untersucht werden.
 | 


 | 


 | 


 | 


 |

## Bandbreite

Die benötigte Bandbreite ist nicht vorhersehbar, da sie sehr stark vom E-Mail-Verkehr abhängt.

Als Information nachstehend der Bandbreitenverbrauch des BlueMind-Kalenders und der Smartphones, der die Dominanz des E-Mail-Verkehrs aufzeigt.

##### Bandbreite BlueMind Kalender

Für einen Benutzer, der die Kalenderanwendung in seinem Browser geöffnet hat, in http und Bytes (gemessen über das Netzwerk mit Wireshark:

- alle 30 Sekunden: ein „doSync“ 1067 / 293 (sendet lokale Änderungen und ruft Änderungen ab)
- alle 5 Sekunden: ein „Ping“: 898 / 233, d.h. 5388 / 1398 in 30 s (ein „keep alive“)


Client an Server: 215 Bytes/Sek. (1067+5388)/30

Server an Client: 56 Bytes/Sek. (293+1398)/30

| # aktive Benutzer | Client an Server | Server an Client |
| --- | --- | --- |
| 
1
 | 
215 Bytes/Sek.
 | 
56 Bytes/Sek.
 |
| 
100
 | 
21 KB/Sek.
 | 
6 KB/Sek.
 |
| 
1000
 | 
210 KB/Sek.
 | 
60 KB/Sek.
 |
| 
10000
 | 
2,1 MB/Sek.
 | 
600 KB/Sek.
 |

Mit Marge, für 1000 geöffnete Kalender in den Browsern:

- Client an Server: 500 KB/Sek.
- Server an Client: 150 KB/Sek.


##### Bandbreite der Kontaktverwaltung

Für einen Benutzer, der die Kontaktverwaltungsanwendung in seinem Browser geöffnet hat, in http und Bytes:

144 Bytes / Sekunde

Und mit:

- alle 5 Sekunden ein „Ping“
- alle 30 Sekunden ein „bmc“


Unter Berücksichtigung einer Sicherheitsmarge durch Verdoppelung des gemessenen Wertes erhalten wir eine Bandbreite von 288 Byte pro Sekunde für einen Benutzer, der die Kontaktverwaltungsanwendung gestartet hat.

### Smartphone-Bandbreite

Die ActiveSync-Kennzahlen werden von Microsoft bereitgestellt: 1.04KB /Sek./Benutzer

oder für 100 Smartphones: 104KB, also 13KB/Sek

Dafür nehmen wir einen angemessenen Spielraum von x2 an, dies ergibt:

100 Smartphones == 26 KB/Sek.

1.000 Smartphones == 260 KB/Sek.


