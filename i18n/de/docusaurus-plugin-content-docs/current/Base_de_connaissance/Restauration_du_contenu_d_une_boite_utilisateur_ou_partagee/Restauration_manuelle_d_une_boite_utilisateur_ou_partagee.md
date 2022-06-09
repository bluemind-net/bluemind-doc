---
title: "Manuelle Wiederherstellung einer Benutzer- oder freigegebenen Mailbox"
confluence_id: 57771953
position: 76
---
# Manuelle Wiederherstellung einer Benutzer- oder freigegebenen Mailbox


## Präsentation

Diese Seite unterstützt Sie bei der Wiederherstellung des Inhalts eines Postfachs (Benutzer oder freigegeben) aus einem Sicherungsverzeichnis.

Die [einzelne DataProtect-Wiederherstellung ](/Guide_de_l_administrateur/Sauvegarde_et_restauration/Restauration_unitaire_Navigation_DataProtect/) oder [die Wiederherstellung per Skript](/Base_de_connaissance/Restauration_du_contenu_d_une_boite_utilisateur_ou_partagee/) sind zu bevorzugen, und die vorliegende Anleitung ist nur in besonderen Fällen zu verwenden, wenn vorgenannte Wiederherstellungsmethoden fehlschlagen.


## Konzept

Um die gewünschte Mailbox korrekt wiederherzustellen, müssen die *data*- und *metadata*-Bäume neu erstellt werden, die sich jeweils an den folgenden Orten befinden:

- `/var/spool/cyrus/data/`
- `/var/spool/cyrus/meta/`


Auf der Domain `bluemind.loc` haben wir zum Beispiel :

- `/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/`
- `/var/spool/cyrus/**meta**/bluemind_loc/domain/b/bluemind.loc/`


Die Sicherungsdaten befinden sich in entsprechenden Unterverzeichnissen im Verzeichnis `/var/backups/`.

Der *Spool * der entsprechenden Sicherung sieht dann folgendermaßen aus (hier für die 1234. Sicherung):

- `/var/backups/bluemind/dp_spool/rsync/192.168.122.56/mail/imap/1234/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/`
- `/var/backups/bluemind/dp_spool/rsync/192.168.122.56/mail/imap/1234/var/spool/cyrus/**meta**/bluemind_loc/domain/b/bluemind.loc/`


## Wiederherstellen eines Benutzers

### Benutzerdaten

Die Daten (Mails) eines Benutzers werden auf dem Server im Verzeichnis `/var/spool/cyrus/**data**/domain_loc/[...]/[n]/user/nom_user/` gesepeichert, (wobei [n] der erste Buchstabe des Login ist, hier *n*om_user)

Die Metadaten werden auf dem Server im Verzeichnis `/var/spool/cyrus/**meta**/domain_loc/[...]/[n]/user/nom_user/` gespeichert. Es handelt sich um Mail-bezogene Daten: Lesestatus, Flaggen, Antwort- oder Weiterleitungsindikatoren usw.

Wann immer möglich, ist eine Sicherung der Metadaten vorzuziehen. Auch bei Fehlen einer solchen Sicherung ist die Wiederherstellung der Nachrichten möglich, sie liegen dann in ihrem ursprünglichen Zustand vor: Sie werden als ungelesen, unbeantwortet und ohne besonderen Status betrachtet.

### Voraussetzungen und Beispieldaten

- Der Server, auf dem die Daten wiederhergestellt werden, muss – wenn es nicht der ursprüngliche Server ist – die gleichen Eigenschaften wie der ursprüngliche Server aufweisen: gleicher Domain name, gleiche IP-Adresse, gleiche Url, gleiche Version von BlueMind, etc.
- **Der Benutzername muss mit dem ursprünglichen Benutzernamen identisch sein**


Für das Verfahren verwenden wir den folgenden Benutzer:

- Domain `bluemind.loc`
- Benutzername `jdoe`


Die Daten:** 


**

- Die Mailboxdaten (siehe oben) werden auf dem Zielserver in den folgenden Verzeichnissen abgelegt:
    - Daten: `/var/backups/jdoe/`
    - Metadaten: `/var/backups/jdoe-meta/`
- die Wiederherstellung dieser Daten erfolgt in dem `restore_dir` genannten Unterordner der Mailbox (dieser Name ist frei wählbar, man kann z. B. das aktuelle Datum oder eine andere Konvention verwenden)


### Verfahren


:::info

In den Verzeichnispfaden oder bestimmten Befehlszeilen wird der Punkt '.' im Domainnamen durch einen Underscore '_' ersetzt.

Bei Anpassung der Befehle an Ihre Domain muss dieses Element zwingend ersetzt werden.

:::

#### Fall der Wiederherstellung in einer anderen Mailbox als der des Anwenders

Um die Nachrichten eines Benutzers in einer anderen als der ursprünglichen Mailbox wiederherzustellen, gehen Sie wahlweise wie folgt vor:

- Eine Wiederherstellung ohne die Metadaten durchführen (siehe unten)
- Eine Wiederherstellung mit den Metadaten durchführen (siehe unten), dann:
    - Mit dem Login des Zielbenutzers anmelden
    - Gehen Sie zu Verwaltung der Einstellungen > Mail > Registerkarte Freigabeverwaltung > klicken Sie auf "Speichern"Hier sind keine Änderungen nötig, Sie müssen lediglich die erneute Speicherung der Freigaben erzwingen.


#### Wiederherstellung mit Metadaten

Verbunden mit dem Server als `root` :

- Gehen Sie zu `/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`
- kopieren Sie die wiederherzustellenden Daten und erteilen Sie dem so erstellten Verzeichnis die entsprechenden Rechte:


```
mv /var/backups/jdoe/ restore\_dir
chown -R cyrus:mail restore\_dir
chmod -R u+rwx restore\_dir
```


- Gehen Sie zu ``/var/spool/cyrus/**meta**/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`` 
- kopieren Sie die wiederherzustellenden Metadaten in ein Unterverzeichnis mit demselben Namen wie das für die Daten verwendete:


```
mv /var/backups/jdoe-meta/ restore\_dir
chown -R cyrus:mail restore\_dir
chmod -R u+rwx restore\_dir
```


- führen Sie den Befehl cyrus aus, um die Mailbox neu zu erstellen:


```
/usr/lib/cyrus/bin/reconstruct -r -f user/jdoe@bluemind.loc
```


#### Wiederherstellung bei Fehlen von Metadaten


:::info

In den Verzeichnispfaden oder bestimmten Befehlszeilen wird der Punkt '.' im Domainnamen durch einen Underscore '_' ersetzt.

Bei Anpassung der Befehle an Ihre Domain muss dieses Element zwingend ersetzt werden.

:::

Verbunden mit dem Server als `root` :

- Gehen Sie zu `/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`
- kopieren Sie die wiederherzustellenden Daten und erteilen Sie dem so erstellten Verzeichnis die entsprechenden Rechte:


```
mv /var/backups/jdoe/ restore\_dir
chown -R cyrus:mail restore\_dir
chmod -R u+rwx restore\_dir
```


- Metadaten-Baumstruktur nachbilden:


```
find restore\_dir/ -type d -exec mkdir /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/{} \;
```


- wechseln Sie in den Metadaten-Ordner des Benutzers, erstellen Sie die Dateien cyrus.header und erteilen Sie die entsprechenden Rechte:


```
cd /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/
find restore\_dir -type d -exec touch {}/cyrus.header \;
chown -R cyrus:mail restore\_dir
```


- führen Sie den Befehl cyrus aus, um die Mailbox neu zu erstellen:


```
/usr/lib/cyrus/bin/reconstruct -p bluemind\_loc -r -f user/jdoe/restore\_dir@bluemind.loc
```


#### Finalisierung - in allen Fällen

1. Den Quoten-Anwendungsbefehl ausführen:


```
/usr/lib/cyrus/bin/quota -f -d bluemind.loc user.jdoe
```


2. Nun müssen die E-Mails vom Webmailer aus sichtbar sein. Wenn nicht, stellen Sie sicher, dass Sie den Baum-Cache wie folgt aktualisieren:

    - Melden Sie sich als Benutzer in BlueMind an, klicken Sie auf die Zahnräder unten links in der Ordnerliste > "Ordner organisieren":![](../../attachments/57771953/57771956.png)
    - Der Ordner `restore_dir` und seine Baumstruktur müssen in der Baumstruktur sichtbar sein
    - Zu Webmailer zurückkehren, ohne eine bestimmte Aktion durchzuführen
    - Der wiederhergestellte Ordner und die E-Mails müssen nun sichtbar sein
3. Zum Abschluss: 

    - wenn eine Quote für die Mailbox vorhanden ist, stellen Sie sicher, dass sie nicht erreicht ist; falls nötig, erhöhen Sie sie vorübergehend.
    - Als admin0 in der Verwaltungskonsole angemeldet:
        - gehen Sie zu Benutzerverwaltung > Registerkarte Wartung
        - aktivieren Sie "Mailbox-Indizierung reparieren"
        - klicken Sie auf Speichern


## Wiederherstellen einer freigegebenen Mailbox

### Mailbox-Daten

Im Gegensatz zu den Baumstrukturen der Benutzerordner befinden sich die Unterverzeichnisse von freigegebenen Mailboxen nicht im Hauptverzeichnis der Mailbox, sondern in einem Unterverzeichnis, das ihrem Anfangsbuchstaben entspricht.

Das Unterverzeichnis mit dem Namen "restore-20171003" der freigegebenen Mailbox  *Kontakt* befindet sich also nicht im Verzeichnis `/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/c/contact` der Mailbox, sondern im Verzeichnis `/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/**r**/contact`

Sorgen Sie für den korrekten Aufbau der Baumstruktur, indem Sie die unten angegebenen Codezeilen kopieren oder eingeben.

### Verfahren

1. Die Mailbox über die Administrationskonsole neu erstellen: Verzeichniseinträge > Neu > Freigegebene Mailbox
2. Das *Data*-Wiederherstellungsverzeichnis der Mailbox erstellen:


```
mkdir -p /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003
chown cyrus:mail /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/
chown -R cyrus:mail /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact
```


3. Das *Meta*-Wiederherstellungsverzeichnis der Mailbox erstellen:


```
mkdir -p /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003
chown cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/
chown -R cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact
```


4. Die *Header*-Datei im *Meta*- Wiederherstellungsverzeichnis erstellen:


```
touch /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/cyrus.header
chown cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/cyrus.header
```


5. Die Daten (E-Mails) im *Data*-Verzeichnis wiederherstellen:


```
cd /var/backups/bluemind/dp\_spool/rsync/192.168.122.56/mail/imap/1/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc
#copie des emails situés à la racine de la boîte (boîte de réception)
cp c/contact/\* /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/
#recherche et copie des sous-dossiers
find ./ -maxdepth 3 -type d -wholename "\*/contact/\*" -exec cp -a -r {} /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/ \;
#positionnement des droits sur les fichiers ainsi copiés
chown -R cyrus:mail /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003
```


6. Die Metadaten im *Meta*-Verzeichnis wiederherstellen:


```
cd /var/backups/bluemind/dp\_spool/rsync/192.168.122.56/mail/imap/1/var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc
#recherche et copie des sous-dossiers
find ./ -maxdepth 3 -type d -wholename "\*/contact/\*" -exec cp -a -r {} /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/ \;
#positionnement des droits sur les fichiers ainsi copiés
chown -R cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/
```

*NB: hier gibt es keine Dateien, die aus dem Root zu kopieren sind*

7. Den Index der Mailbox neu aufbauen. Hierzu gibt es 2 Möglichkeiten:
    1. Per Kommandozeile:


```
/usr/lib/cyrus/bin/reconstruct -f -r -p bluemind\_loc "contact/restored-20171003@bluemind.loc"
```


    2. Gehen Sie in der Administrationskonsole auf die Verwaltung der gemeinsam genutzten Mailboxen, Registerkarte Wartung, und starten Sie eine Rekonstruktion des Mailboxindizes:![](../../attachments/57771953/57771955.png)


