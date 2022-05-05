---
title: "Hardware Sizing"
confluence_id: 57771183
position: 36
---
# Hardware Sizing


## Introduction

The data in this page is provided for information purposes only. Usage may vary for a same number of users, depending on hardware structure and use habits. Many factors can affect usage: email volume, email size, number of recipients, number of events, event scheduling, etc.


## About units

Several BlueMind components use up resources. A typical "per user" calculation cannot be applied because a user who only uses messaging will not generate the same load for the system as a user using messaging and collaborative services (Calendar, etc.) and a smartphone.

As a result, sizing is calculated "per unit", on the following basis:

| User profile | Units |
| --- | --- |
| 
Messaging only
 | 
1
 |
| 
Messaging + intense collaborative use
 | 
2
 |
| 
Messaging + collaborative services + smartphone
 | 
5
 |

Also, for a same amount of units, a use of messaging only won't consume the same amount of resources as a messaging+collaborative use: unlike collaborative tools, messaging, for example, is more heavily dependent on IO than on CPU.

## CPU

CPU is stated in number of cores. Reference values are based on recent Xeon-type CPU.

BlueMind has several services, as a result we recommend a minimum of 2 cores.

Please note that too much CPU can lead to other issues on virtualized environments ([https://techan.fr/problemes-de-performance-sur-vmware-du-a-du-cpu-ready.html](https://techan.fr/problemes-de-performance-sur-vmware-du-a-du-cpu-ready.html))

| Units | Number of core(s) |
| --- | --- |
| 
1-200
 | 
2
 |
| 
200-1000
 | 
4
 |
| 1000-2000 | 6 |
| 2000-3000 | 8 |
| 3000-6000 | 12 |
| 
6000+
 | 
2 / 1000 units
 |

## RAM

| Units | RAM |
| --- | --- |
| 1-250 | 16 GB |
| 250-1000 | 24 GB |
| 1000-2500 | 32GB |
| 2500-5000 | 48GB |
| 5000-10,000 | 64GB* |
| 10,000+ | 96GB* |

**With the Cyrus service and bm-elasticsearch on dedicated servers *

## Storage / IO Performance


:::info

Disques et performance

Un messagerie sollicite beaucoup les disques, pour la lecture et l'écriture de petits fichiers, mais aussi pour tous les traitements sur les messages (indexation, état de lecture, etc...). La qualité des disques et leur rapidité est une donnée clé d'une messagerie performante.

:::


:::info

IOPS = "Input/Output Operations Per Second"

:::

The messaging service is a heavy user of IO, as a result storage is sized in IOPS . As for storage space, it depends on client requirements (quotas, etc.)

### Performances minimales des disques

Le stockage est dimensionné en IOPS, un service de messagerie étant un gros consommateur d’IO. L’espace de stockage est lui directement dépendant de la demande du client (quotas,..)

Selon l'usage final, tous les disques n'ont pas nécessairement besoin d'avoir le même niveau de performance. Voici les IOPS minimum pour toute installation :

| point de montage | description | type | IOPSminimum |
| --- | --- | --- | --- |
| NFS | block device |
| /var/lib/postgresql | Base de données PostgreSQL |  |  | 10 000 iops |
| /var/spool/cyrus/meta | meta données des e-mail |  |  | 10 000 iops |
| /var/spool/cyrus/data | emails |  |  | 6 000 iops |
| /var/spool/bm-hsm | emails archivés |  |  | 6 000 iops |
| /var/spool/bm-elasticsearch | index de recherche |  |  | 10 000 iops |
| /var/spool/bm-mail | envoi des emails via EAS/mapi | 


 | ~2Go |  |  | 6 000 iops |
| /var/log | logs (fichiers journaux) |  |  | 6 000 iops |
| /var/backups/bluemind | sauvegardes |  |  | 6 000 iops |

Pour les installations supérieures à 2000 utilisateurs, les iops attendus peuvent être calculés selon le nombre d'utilisateurs et l'usage :


| Unités | IOPS par unité |
| --- | --- |
| 
1
 | 
1
 |


### IOPS data for storage devices (wikipedia)


| Device   | Type   | IOPS   | Interface   | Notes   |
| --- | --- | --- | --- | --- |
| 
7,200 [ rpm ](http://en.wikipedia.org/wiki/Revolutions_per_minute)   [ SATA ](http://en.wikipedia.org/wiki/SATA) drives
 | 
[ HDD ](http://en.wikipedia.org/wiki/Hard_disk_drive)
 | 
~75-100 IOPS [ [2] ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SATA 3 [ Gb/s ](http://en.wikipedia.org/wiki/Data_rate_units#Gigabit_per_second)
 | 


 | [   ](http://en.wikipedia.org/wiki/Data_rate_units#Gigabit_per_second) |
| 
10,000 rpm SATA drives
 | 
HDD
 | 
~125-150 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SATA 3 Gbit/s
 | 


 |   |
| 
10,000 rpm [ SAS ](http://en.wikipedia.org/wiki/Serial_Attached_SCSI) drives
 | 
HDD
 | 
~140 IOPS [ [2] ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SAS
 | 


 |   |
| 
15,000 rpm [ SAS ](http://en.wikipedia.org/wiki/Serial_Attached_SCSI) drives
 | 
HDD
 | 
~175-210 IOPS [ [2] ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SAS
 | 


 |


*Source: [http://en.wikipedia.org/wiki/IOPS](http://en.wikipedia.org/wiki/IOPS) *

## Examples

Core/RAM distribution over several servers (virtual or otherwise) is not described here.

However, for up to 16/24 cores, we believe that a single-platform installation makes sense.

Above this threshold, and to manage populations of tens of thousands of users or more, the architecture must be distributed.

Also, the messaging part as well as the database (which collaborative use/smartphone places heavy demands on) must be kept separate from the rest.

|  Users / Units  | Node |  CPU  #cores  |  RAM  |  IOPS / Disk  |
| --- | --- | --- | --- | --- |
| 
25 users / 5 with smartphones
 | 
45 units (20 + 25)
 | 


 | 
2
 | 
16
 | 
13.5 / all disks
 |
| 
150 users / 50 collaborative users of which 25 with smartphones
 | 
225 units (100+25*2+25*5)
 | 


 | 
4
 | 
16
 | 
67.5
 | 
SATA 7,200 minimum
 |
| 
300 users / 100 collaborative users / 30 smartphones
 | 
490 units (200 + 70*2 + 30*5)
 | 


 | 
4
 | 
24
 | 
147
 | 
2 * 10K rpm SAS
 | 
1 * 15K rpm SAS
 |
| 
600 users / 200 collaborative users / 50 smartphones
 | 
950 units (400 + 150*2 * 50*5) → 4 CPU, 24 GB of RAM
 | Core | 
2
 | 
20
 | 
285
 | 
SSD, Bay or other system
 |
| Edge | 2 | 4 | 


 |
| 
1,000 users / 250 collaborative users / 100 Psmartphones
 | 
1,300 units (750 + 150 * 2 + 100 * 5) → 6 CPU, 32 GB of RAM
 | Core | 
2
 | 
20
 | 
390
 | 
SSD, Bay or other system
 |
| BM-ES | 2 | 8 | dedicated ES for more than 1TB of emails and archives |
| Edge | 2 | 4 | 


 |
| 
2,000 users / 500 collaborative users / 200 smartphones
 | 
3,100 units (1500 + 300*2 + 200 * 5) → 12 CPU, 48GB of RAM
 | Core | 
6
 | 
20
 | 
930
 | 
Bay (2,000 IOPS)
 |
| BM-ES | 2 | 12 | dedicated ES from 1TB of emails and archives |
| Cyrus | 2 | 12 | dedicated Cyrus from 2TB of emails and archives |
| Edge | 2 | 4 | 


 |
| 
4,000 users / 1000 collaborative users / 300 smartphones
 | 
5,900 units (3000 + 700*2 + 300*5) → 12 CPU, 64GB of RAM
 | Core | 
6
 | 
36
 | 
1,770
 | 
Bay (2-3,000 IOPS)
 |
| BM-ES | 2 | 12 | dedicated ES from 1TB of emails and archives |
| Cyrus | 2 | 12 | dedicated Cyrus from 2TB of emails and archives |
| Edge | 2 | 4 | 


 |
| 
4,000 users / 1000 collaborative users / 1000 smartphones
 | 
8,000 units (3000 + 1000*5) → 16 CPU, 64GB of RAM
 | Core | 
6
 | 
36
 | 
2,400
 | 
Bay 3,000 IOPS
 | 
SAN / other technology
 |
| BM-ES | 4 | 12 | dedicated ES from 1TB of emails and archives |
| Cyrus | 4 | 12 | dedicated Cyrus from 2TB of emails and archives |
| Edge | 2 | 4 | 


 |
| 
4,000 users / 4,000 collaborative users / 1000 smartphones
 | 
1,1000 units (3,000*2 + 1,000*5) → 22 CPU, 96GB of RAM
 | Core | 
10
 | 
44
 | 
3,300
 | 
SAN / other technology
 |
| BM-ES | 4 | 24 | dedicated ES from 1TB of emails and archives |
| Cyrus | 4 | 24 | 
dedicated Cyrus from 2TB of emails and archives
 | 
consider 2 cyrus nodes
 |
| Edge | 2 | 4 | 


 |
| 
5,000+ users (10,000; 100,000; etc.)
 | 
The system must be distributed and the architecture designed on an ad-hoc basis.
 | 


 | 


 | 


 | 


 |

## Bandwidth

Bandwidth requirements cannot be predicted as they largely depend on mail traffic.Please note that the data on bandwidth usage of the BlueMind calendar and smartphones below clearly shows the preponderance of mail traffic.

### BlueMind Calendar bandwidth

For a user with the Calendar application open in their web browser, in http and in bytes (measured on the network with Wireshark):

- every 30 seconds: one doSync 1067 / 293 (sends local modifications and retrieves changes)
- every 5 seconds: one ping: 898 / 233, i.e. 5388 / 1398 in 30s (one keepalive)


Client to server: 215 bytes/sec (1,067+5,388)/30

Server to client: 56 bytes/sec (293+1,398)/30

| Number of active users | Client to Server | Server to Client |
| --- | --- | --- |
| 
1
 | 
215 B/s
 | 
56 B/s
 |
| 
100
 | 
21 KB/s
 | 
6 KB/s
 |
| 
1,000
 | 
210 KB/s
 | 
60 KB/s
 |
| 
10,000
 | 
2.1 MB/s
 | 
600 KB/s
 |

With room for maneuver, for 1,000 Calendars running in web browsers:

- Client to server: 500KB/s
- Server to client: 150KB/s


### Contacts bandwidth

For a user with the Contacts application running in their browser, in http and in bytes:

144 bytes/second

Specifically:

- a ping every 5 seconds
- a "bmc" every 30 seconds


By doubling the value measured to ensure a comfortable safety margin, we calculate a bandwidth of 288 bytes per second for a user who has launched the Contacts application.

### Smartphone bandwidth

Microsoft provides the following ActiveSync ratios: 1.04KB/s/user

i.e. for 100 smartphones: 104Kbit, or 13KB/s

By taking a sensible safety margin of x2, we calculate:

- 100 smartphones == 26KB/s
- 1,000 smartphones == 260KB/s


