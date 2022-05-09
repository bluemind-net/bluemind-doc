---
title: "Dimensionnement matériel"
confluence_id: 57771183
sidebar_position: 36
---
# Dimensionnement matériel


## Présentation

Les données indiquées ici le sont à titre indicatif. En effet, pour un même nombre d’utilisateurs, l’utilisation peut-être très différente selon les structures et habitudes. Le nombre de mails, leur taille, le nombre de destinataires dans les mails, le nombre de rdv, de planification... tout ceci par jour est très variable.


## Le principe des unités

Dans un système comme BlueMind, il y a différents composants consommateurs de ressources.

Le calcul basique “par utilisateur” n’est plus valide car un utilisateur qui n’utilise que la partie messagerie ne sollicitera pas le système de la même façon qu’un utilisateur utilisant le mail et les outils collaboratifs (agenda,..), notamment avec un smartphone.

Le calcul du dimensionnement s’effectue donc par unité sachant que :

| Profil d’utilisateur | Coût en unité |
| --- | --- |
| 
Messagerie seule
 | 
1
 |
| 
Messagerie + collaboratif intensif
 | 
2
 |
| 
Messagerie + collaboratif + smartphone
 | 
5
 |

De même pour un même nombre d’unité, une utilisation uniquement messagerie n’aura pas la même consommation de ressources qu’une utilisation messagerie + collaboratif (pour la moitié d’utilisateurs). Le mail étant par exemple plus dépendant des IO que du CPU, ce qui est inverse en général des outils collaboratifs.

## CPU

Nous parlons en nombre de cœurs. La référence est un CPU serveur récent, de type Xeon.

BlueMind comprend de nombreux services, nous préconisons donc 2 cœurs minimum.

A noter qu'allouer trop de CPU peut mener à d'autres problèmes sur des environnements virtualisés ([https://techan.fr/problemes-de-performance-sur-vmware-du-a-du-cpu-ready.html](https://techan.fr/problemes-de-performance-sur-vmware-du-a-du-cpu-ready.html))

| Unités | nombre de cœurs |
| --- | --- |
| 1-200 | 2 |
| 200-1000 | 4 |
| 1000-2000 | 6 |
| 2000-3000 | 8 |
| 3000-6000 | 12 |
| 6000+ | 2 cœurs / 1000 unités |

## RAM

| Unités | Ram |
| --- | --- |
| 1-250 | 16 Go |
| 250-1000 | 24 Go |
| 1000-2500 | 32 Go |
| 2500 - 5000 | 48 Go |
| 5000-10000 | 64 Go* |
| 10000+ | 96 Go* |

**avec déport du service Cyrus et bm-elasticsearch sur des serveurs dédiés*

## Stockage / IO


:::info

Disques et performance

Un messagerie sollicite beaucoup les disques, pour la lecture et l'écriture de petits fichiers, mais aussi pour tous les traitements sur les messages (indexation, état de lecture, etc...). La qualité des disques et leur rapidité est une donnée clé d'une messagerie performante.

:::


:::info

IOPS = «In/Out per second», soit «Entrée/Sorties par seconde»

:::

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

### Données sur les IOPS des moyens de stockage (wikipedia)

| Device   | Type   | IOPS   | Interface   | Notes   |
| --- | --- | --- | --- | --- |
| 
7,200 [ rpm ](http://en.wikipedia.org/wiki/Revolutions_per_minute)   [ SATA ](http://en.wikipedia.org/wiki/SATA) drives
 | 
[ HDD   ](http://en.wikipedia.org/wiki/Hard_disk_drive)
 | 
~75-100 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SATA 3 [ Gb/s   ](http://en.wikipedia.org/wiki/Data_rate_units#Gigabit_per_second)
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
~140 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SAS
 | 


 |   |
| 
15,000 rpm [ SAS ](http://en.wikipedia.org/wiki/Serial_Attached_SCSI) drives
 | 
HDD
 | 
~175-210 IOPS [ [2]   ](http://en.wikipedia.org/wiki/IOPS#cite_note-Symantec-1)
 | 
SAS
 | 


 |

### Vérification de la performance de vos disques


:::info

Attention

Effectuez ces tests en respectant bien les consignes. Il est possible de détruire des données ou impacter les performances du serveur si les opérations ne sont pas réalisées avec précaution.

:::

Vous pouvez vérifier la performance de vos disques en utilisant la procédure de test suivante :

[[Système] Commandes](https://forge.bluemind.net/confluence/pages/viewpage.action?pageId=75760483) (à déplacer dans Troubleshooting de la v4 ?)

## Exemples

La répartition des cœurs / ram sur plusieurs serveurs (virtuels ou non) n’est pas décrite ici.

Cependant jusqu’à 16/24 cœurs, nous considérons pertinent d’installer l’ensemble sur une même plateforme.

Au dela de ceci, et pour gérer les populations en dizaine ou plus de milliers d’utilisateurs, l’architecture doit être distribuée.

Ensuite, la partie messagerie doit être séparée, ainsi que la base de données (très sollicitée par le collaboratif / smartphones).

|  Users / unités  | Noeud |  CPU  #cœurs  |  RAMen Go |  IOPS / Disque  |
| --- | --- | --- | --- | --- |
| 
25 utilisateurs / 5 avec smartphones
 | 
45 unités (20 + 25)
 | 


 | 
2
 | 
16
 | 
13,5 / tout disque
 |
| 
150 utilisateurs / 50 collaboratifs dont 25 avec smartphones
 | 
225 unités (100+25*2+25*5)
 | 


 | 
4
 | 
16
 | 
67,5
 | 
SATA 7200 minimum
 |
| 
300 utilisateurs / 100 collaboratifs / 30 smartphones
 | 
490 unités (200 + 70*2 + 30*5)
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
600 utilisateurs / 200 collaboratifs / 50 smartphones
 | 
950 unités (400 + 150*2 * 50*5) → 4 CPU, 24 Go de RAM
 | Core | 
2
 | 
20
 | 
285
 | 
SSD, Baie ou autre système
 |
| Edge | 2 | 4 | 


 |
| 
1000 util. / 250 collaboratifs / 100 smartphones
 | 
1300 unités (750 + 150 * 2 + 100 * 5) → 6 CPU, 32 Go de RAM
 | Core | 
2
 | 
20
 | 
390
 | 
SSD, Baie ou autre système
 |
| BM-ES | 2 | 8 | ES dédié à partir d'1To de mails et archives |
| Edge | 2 | 4 | 


 |
| 
2000 util. / 500 collaboratifs / 200 smartphones
 | 
3100 unités (1500 + 300*2 + 200 * 5) → 12 CPU, 48Go de RAM
 | Core | 
6
 | 
20
 | 
930
 | 
Baie (2000 IOPS)
 |
| BM-ES | 2 | 12 | ES dédié à partir d'1To de mails et archives |
| 
Cyrus
 | 2 | 12 | Cyrus dédié à partir de 2 To de mails et archives |
| Edge | 2 | 4 | 


 |
| 
4000 util. / 1000 collaboratifs / 300 smartphones
 | 
5900 unités (3000 + 700*2 + 300*5) → 12 CPU, 64Go de RAM
 | Core | 
6
 | 
36
 | 
1770
 | 
Baie (2-3000 IOPS)
 |
| BM-ES | 2 | 12 | ES dédié à partir d'1To de mails et archives |
| 
Cyrus
 | 2 | 12 | Cyrus dédié à partir de 2 To de mails et archives |
| Edge | 2 | 4 | 


 |
| 
4000 util. / 1000 collaboratifs / 1000 smartphones
 | 
8000 unités (3000 + 1000*5) → 16 CPU, 64Go de RAM
 | Core | 
6
 | 
36
 | 
2400
 | 
BAIE 3000 IOPS
 | 
SAN / autre techno
 |
| BM-ES | 4 | 12 | ES dédié à partir d'1To de mails et archives |
| 
Cyrus
 | 4 | 12 | Cyrus dédié à partir de 2 To de mails et archives |
| Edge | 2 | 4 | 


 |
| 
4000 util. / 4000 collaboratifs / 1000 smartphones
 | 
11000 unités (3000*2 + 1000*5) → 22 CPU, 96Go de RAM
 | Core | 
10
 | 
44
 | 
3300
 | 
SAN / autre techno
 |
| BM-ES | 4 | 24 | ES dédié à partir d'1To de mails et archives |
| 
Cyrus
 | 6 | 24 | 
Cyrus dédié à partir de 2 To de mails et archives
 | 
2e noeud Cyrus à envisager
 |
| Edge | 2 | 4 | 


 |
| 
5000 utilisateurs et + (10 000, 100 000,..)
 | 
Le système doit être distribué et l’architecture étudiée en fonction du contexte particulier.
 | 


 | 


 | 


 | 


 |

## Bande passante

La bande passante nécessaire n’est pas prévisible car elle dépend en très grande partie du trafic mail.

A titre d’informations ci-dessous les informations sur la consommation bande passante de l’agenda BlueMind et des smartphones, qui montre bien la prédominance du trafic mail.

##### Bande passante Agenda BlueMind

Pour un utilisateur avec l'application d'agenda ouverte dans son navigateur, en http et en octets (mesuré sur le réseau avec wireshark) :

- toutes les 30 sec: un "doSync" 1067 / 293 (envoie des modifs locales et récupération des changements)
- toutes les 5 sec: un "ping": 898 / 233, soit 5388 / 1398 en 30 s(un "keep alive")


Client vers serveur: 215 octets/sec (1067+5388)/30

Server vers client: 56 octets/sec (293+1398)/30

| # utilisateurs actifs | client vers serveur | serveur vers client |
| --- | --- | --- |
| 
1
 | 
215 octets/s
 | 
56 octets/s
 |
| 
100
 | 
21 ko/s
 | 
6 ko/s
 |
| 
1 000
 | 
210 ko/s
 | 
60 ko/s
 |
| 
10 000
 | 
2,1 Mo/s
 | 
600 ko/s
 |

Avec de la marge, pour 1000 agendas ouverts dans les navigateurs :

- Client vers serveur: 500ko/sec.
- Serveur vers client: 150ko/sec.


##### Bande passante de la gestion des contacts

Pour un utilisateur avec l'application de gestion des contacts ouverte dans son navigateur, en http et en octets :

144 octets / seconde

Avec en particulier :

- toutes les 5 secondes un "ping"
- toutes les 30 secondes un "bmc"


En prenant une marge de sécurité en doublant la valeur mesurée, nous obtenons une bande passant de 288 octets par seconde pour un utilisateur ayant lancé l'application de gestion de contacts.

### Bande passante smartphones

Les ratios ActiveSync sont  fournis par microsoft : 1.04kb /sec/user

soit pour 100 smartphones : 104Kb, donc 13Ko/sec

Pour lequel nous prendrons une marge raisonnable de x2, ce qui donne :

100 smartphones == 26 Ko/sec

1 000 smartphones == 260 Ko/sec


