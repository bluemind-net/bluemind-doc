---
title: "Hohe Verfügbarkeit der Software und von BlueMind"
confluence_id: 57771769
position: 50
---
# Hohe Verfügbarkeit der Software und von BlueMind


## Präsentation

Es ist möglich, ein High Availability-Softwaresystem einzurichten, das mit BlueMind integriert wird.

Dieses Dokument enthält die Empfehlungen und Informationen über das BlueMind-System, die für die Integration der Messaging-Lösung in eine Hochverfügbarkeitsinfrastruktur erforderlich sind.


**Auf dieser Seite:** 


 

- [Präsentation](#HautedisponibilitelogicielleetBlueMind-Präsentation)
- [Vorbereitung des Systems](#HautedisponibilitelogicielleetBlueMind-VorbereitungdesSystems)

    - [Speicherplatz](#HautedisponibilitelogicielleetBlueMind-Speicherplatz)
    - [Netzwerk](#HautedisponibilitelogicielleetBlueMind-Netzwerk)
    - [Supervisionsskripte](#HautedisponibilitelogicielleetBlueMind-Supervisionsskripte)

- [Konfigurieren der Hochverfügbarkeit](#HautedisponibilitelogicielleetBlueMind-KonfigurierenderHochverfügbarkeit)

    - [Zu verwaltende Daten und Dienste](#HautedisponibilitelogicielleetBlueMind-ZuverwaltendeDatenundDienste)
    - [STONITH](#HautedisponibilitelogicielleetBlueMind-STONITH)


:::info

Die in diesem Dokument erwähnten Softwarelösungen von Drittanbietern werden als Beispiele genannt. Diese Liste erhebt keinen Anspruch auf Vollständigkeit.

:::

## Vorbereitung des Systems

Hinweis: Die beiden betreffenden Server müssen den im folgenden Dokument definierten Hardware-Sizing-Empfehlungen entsprechen: [Materialdimensionierung](https://forge.bluemind.net/confluence/display/LATEST/Dimensionnement+materiel)

### Speicherplatz

Die Inhalte, die zwischen den beiden Servern ausgetauscht werden sollen, können entweder auf einem gemeinsamen Speicherplatz wie einem [SAN](http://fr.wikipedia.org/wiki/R%C3%A9seau_de_stockage_SAN) *(Storage Area Network*) oder über eine Datenreplikation zwischen zwei getrennten Speicherplätzen ausgetauscht werden.


:::tip

Hochverfügbarkeit über einen Replikationsmechanismus kann zu großen Problemen beim Zugriff auf gemeinsam genutzte Festplattenressourcen führen, die im Falle eines Dienstausfalls auftreten können. Der häufigste Fall, in dem Bedenken bezüglich des Ressourcenzugriffs eine potenziell katastrophale Auswirkung haben, ist das* [Split-brain](http://fr.wikipedia.org/wiki/Split-brain)-*Szenario.

:::


:::info
Die Komponente *cyrus-imap* unterstützt keine NFS-Speicherung für die Verwaltung von Metadaten. Unabhängig von der gewählten Art des replizierten Speichers ist eine Speicherung vom Typ *Block-device* erforderlich, die z.B. auf [Fibre Channel-](http://fr.wikipedia.org/wiki/Fibre_Channel) oder [iSCSI](http://fr.wikipedia.org/wiki/ISCSI)-Technologien für das Verzeichnis `/var/spool/cyrus/meta` basiert.Alle anderen Verzeichnisse wie `/var/spool/cyrus/data` und `/var/lib/cyrus` können auf per NFS gemounteten Speicherbereichen gespeichert werden.
:::

#### Daten, die zwischen den beiden Servern zur Verfügung gestellt werden sollen

In den folgenden Verzeichnissen befinden sich die Daten, die für beide Server sichtbar sein müssen und deren Zugriff durch das HA-Management-System verwaltet werden muss:

- /var/spool/bm-docs
- /var/spool/bm-elasticsearch
- /var/spool/bm-hsm
- /var/spool/cyrus
- /var/spool/postfix
- /var/spool/sieve
- /var/spool/bm-hollowed
- /var/spool/bm-mapi


Zu diesen muss die cyrus-Datenbank hinzugefügt werden, die sich im folgenden Verzeichnis befindet:

- `/var/lib/cyrus`
- `/var/lib/postgresql`


:::tip
Diese Daten müssen daher auf einem Speicherplatz liegen, der es dem passiven Server erlaubt, im Falle eines Failovers auf die Daten zuzugreifen, z.B. ein SAN-Speicher, ein GFS-Cluster oder andere...
:::


:::info

ERINNERUNG: `/var/spool/cyrus/meta` darf niemals auf einem NFS-Mount gespeichert werden, aber `/var/spool/cyrus/data` kann auf einem NFS-Mount gespeichert werden

:::

### Netzwerk

Damit BlueMind ordnungsgemäß funktioniert, muss es über eine einzige URL/IP erreichbar sein. Es wird daher empfohlen, ein System zu verwenden, das schwebende (oder virtuelle) IP-Adressen verwalten kann.


:::info
Die Zugriffs-URL auf BlueMind-Frontends muss immer dieselbe sein.
:::

### Supervisionsskripte

Siehe die entsprechende Seite [Überwachung](/Guide_de_l_administrateur/Supervision/)

## Konfigurieren der Hochverfügbarkeit


:::info

Ohne STONITH (siehe unten) darf die automatische Ausfallsicherung nicht aktiviert werden, da sonst die Gefahr von *Split-Brain-Ausfällen* und Datenbeschädigungen besteht (siehe Textbox im entsprechenden Absatz),     die vom BlueMind-Support nicht berücksichtigt werden.

:::

### Zu verwaltende Daten und Dienste

#### Konfiguration der BlueMind-Synchronisierung

Die BlueMind-Konfigurationsdateien, die vom HA-Management-System in Echtzeit synchronisiert werden sollen, befinden sich im Verzeichnis /etc.

Außerdem müssen die folgenden Dateien synchronisiert werden:

- /usr/share/bm-elasticsearch/config/elasticsearch.yml
- /etc/aliases
- /etc/aliases.db
- /etc/sysctl.conf
- /etc/ssl/certs/bm_cert.pem
- /var/lib/bm-ca/ca-cert.pem


:::tip

Um eine Echtzeitsynchronisation der Konfigurationsdateien zu erreichen, können Sie die folgenden Beispiele verwenden:

- incron, basierend auf inotify, ermöglicht es, Aufgaben entsprechend dem Zustand z.B. einer Datei zu starten. Die offizielle Dokumentation ist auf der [Website des Herausgebers](http://inotify.aiken.cz/) verfügbar.
- Dateien können z.B. per *rsync over ssh* kopiert werden, wie auf [dieser Seite ](http://troy.jdmz.net/rsync/index.html)vorgestellt.
- Es gibt andere Tools wie [l](https://github.com/axkibe/lsyncd) [syncd](https://github.com/axkibe/lsyncd) und [csync2](http://oss.linbit.com/csync2/)


:::

#### BlueMind Aktualisierung-Verwaltung

Die wichtigsten Schritte zur Aktualisierung einer BlueMind High Availability-Bereitstellung werden im Folgenden beschrieben:


:::info

- Deaktivieren Sie die Hochverfügbarkeitsverwaltungsdienste, bevor Sie das BlueMind-Update starten.
- Aktualisieren Sie die Pakete auf beiden Servern.
- Führen Sie dann **nur auf dem Hauptserver** mit der öffentlichen IP-Adresse die Nachinstallationskonfiguration durch, wie beschrieben im Abschnitt: [Post-installation Configuration](https://forge.bluemind.net/confluence/display/LATEST/Configuration+post-installation).


:::

### STONITH

STONITH, für *Shoot The Other Node In The Head*, ist eine *Fencing-Technik*, also eine Isolierung, im Cluster-Management. Das Prinzip besteht darin, den fehlerhaften Server eines Clusters aus der Ferne herunterfahren zu können, entweder per Software oder direkt durch Abschalten seiner Stromversorgung.

Diese Funktionsweise findet auf Ebene der physischen Infrastruktur statt.


:::info
Diese Sicherheit verringert das Risiko der Datenbeschädigung im Falle eines komplexen Dienstausfalls erheblich, z.B. im Falle eines *Split-Brain-Ausfalls*, der dazu führt, dass sich die beiden Server als alleiniger Master betrachten und gleichzeitig versuchen, auf die gemeinsame Speicherressource zuzugreifen. Bei Hochverfügbarkeit auf Basis von Datenreplikation sind die Risiken der Datenkorruption erheblich.
:::

Diese Technik kann zum Beispiel mit IPMI-Tools *(Intelligent Platform Management Interface*) realisiert werden. IPMI ist eine Spezifikation von Maschinenverwaltungsschnittstellen, aber es gibt auch Implementierungen, wie [freeIPMI](http://www.gnu.org/software/freeipmi/), [OpenIPMI](http://openipmi.sourceforge.net/), [ipmitool](http://ipmitool.sourceforge.net/), ...

Die Implementierung auf der Hardwareseite kann durch dedizierte Hardware oder einfach durch den Einsatz von z.B. [iDRAC-Karten](http://en.wikipedia.org/wiki/Dell_DRAC) für Hardware des Herstellers DELL erfolgen.


