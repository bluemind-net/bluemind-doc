---
title: "Installationsvoraussetzungen"
confluence_id: 57771186
position: 40
---
# Installationsvoraussetzungen


## System

**RAM-Speicher


**

**12 GB** mindestens mit Standardkonfiguration

**CPU**

**2 vCPU** mindestens

**Lokal**

Das Gebietsschema en_US.UTF-8 muss installiert und generiert werden (auch wenn das System auf Französisch ist).

Um die korrekte Installation zu überprüfen, verwenden Sie den folgenden Befehl:


```
$ locale -a|grep en\_US
en\_US.utf8
```


:::tip

Tipp

Wenn das Gebietsschema nicht vorhanden ist, können Sie es unter Ubuntu mit dem folgenden Befehl hinzufügen:


```
# locale-gen en\_US.utf8
```


:::


**Linux-Distribution**


:::info

**Die Installation von BlueMind erfordert einen dedizierten, leeren Server oder eine virtuelle Maschine.**

:::


:::info

Virtualisierung

BlueMind unterstützt die LXC-Virtualisierungstechnologie nicht, daher ist KVM vorzuziehen.

:::

BlueMind erfordert eine **64-Bit-Version ** der unterstützten Verteilungen (für Ubuntu stellen Sie sicher, dass Sie die Server-Version haben):

- Ubuntu 16.04 LTS Server (Xenial Xerus)
- Ubuntu 18.04 LTS Server (Bionic Beaver)
- Ubuntu 20.04 LTS Server (Focal Fossa)
- RedHat Enterprise Linux / CentOS 7
- RedHat Entreprise Linux / CentOS 8*
- Debian 8 Jessie
- Debian 9 Stretch
- Debian 10 Buster


** unterstützt ab BlueMind 4.3.0*


:::info

Debian/Ubuntu: Unterschrift der Depots

Die Depots sind für alle unterstützten Ubuntu/Debian-Verteilungen signiert, wobei dies für Ubuntu 18.04 und Debian 9 obligatorisch ist.

Falls notwendig oder erwünscht, kann der Schlüssel auf allen von uns unterstützten Verteilungen manuell über den folgenden Befehl importiert werden:


```
curl https://pkg.bluemind.net/bluemind-deb.asc | apt-key add -
```


Andernfalls kann bei der Aktualisierung bestimmter Vorgängerversionen eine Warnung auftreten, **ohne dass die Aktualisierung behindert wird**.

:::


:::info

Ubuntu: Universe-Repositories

Für Ubuntu-Distributionen werden für die Installation von Bluemind die **Universe-Repositories** benötigt. Sie können mit den folgenden Befehlen einfach hinzugefügt werden:


```
add-apt-repository universe
apt update
```


:::


**Systemkonfiguration**

Um sicherzustellen, dass das Installationsskript Befehle mit erhöhten Rechten*(sudo*) ausführen kann, darf die Richtlinie `requiretty` in der Konfigurationsdatei `/etc/sudoers`nicht aktiviert werden. Ist sie vorhanden ist, sollte sie gelöscht oder kommentiert werden.

## Netzwerk & DNS

### IP-Adresse

Der Server muss eine feste IP-Adresse haben, die statisch auf Systemebene definiert oder von einem DHCP-Server bereitgestellt wird.

### Hostname

Der Hostname des BlueMind-Servers muss korrekt konfiguriert sein, und der Server muss unter diesem Namen von einem anderen Rechner aus erreichbar sein.

Insbesondere erwartet BlueMind die folgenden Ergebnisse von dem Befehl hostname:


```
$ hostname -s
mail
```


  ![](../attachments/57769989/69896490.png) muss den Kurznamen des Systems anzeigen, zum Beispiel hier: mail


:::info

Bei Versionen **vor 4.0.5** muss der Kurzname durch den Befehl `hostname` ohne die Option zurückgeschickt werden:


```
$ hostname
mail
```


Ab BlueMind 4.0.5 ist die Rücksendung dieses Befehls ohne Optionen irrelevant.

:::

 


```
$ hostname -f
mail.bluemind.net
```


![](../attachments/57769989/69896490.png) muss den vollständigen Namen des Systems anzeigen, zum Beispiel hier: mail.bluemind.net

Der Hostname muss auch auf der IP-Adresse in der Datei `/etc/hosts` des Servers angezeigt werden:


```
IP\_SERVER mail.bluemind.net mail
```


### Netzwerkkarten

Wenn Ihr Server mehrere Netzwerkkarten hat, muss die erste Karte (eth0) diejenige mit der externen IP-Adresse des BlueMind-Servers sein.

## Partitionierung

Die folgenden Empfehlungen sind nicht verbindlich, aber sie sollten befolgt werden, um die Wartung Ihres Servers zu vereinfachen.

| Montagepunkt | Beschreibung | Typ |
| --- | --- | --- |
| NFS | Block Device |
| / | Wurzel |  |  |
| /var/spool/cyrus | E-Mails |  |  |
| /var/spool/bm-hsm | archivierte E-Mails |  |  |
| /var/spool/bm-elasticsearch | Suchindex |  |  |
| /var/spool/bm-mail | senden von E-Mails über EAS/mapi | 


 | ~2GB |  |  |
| /var/log | Protokolle (Log-Dateien) |  |  |
| /var/backups/bluemind | Backups |  |  |


