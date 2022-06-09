---
title: "Aufbau von BlueMind"
confluence_id: 57771872
position: 40
---
# Aufbau von BlueMind


## Präsentation

Der BlueMind-Quellcode wird von einem kontinuierlichen Integrationsserver kompiliert, und die erzeugten Binärdateien können von unserer Website in Form von Installationsprogrammen heruntergeladen werden, die den Prozess so einfach wie möglich gestalten. Es ist aber auch möglich, BlueMind manuell zu kompilieren, indem Sie die folgenden Anweisungen befolgen.

## Voraussetzung

Die Kompilierung muss mit Java 8 durchgeführt werden.


## Code-Abruf und -Konstruktion

Der BlueMind-Code ist unter [https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public) veröffentlicht. Dies ist eine Kopie unserer internen Codebasis, die wie folgt organisiert ist:

- master-Zweig: Hauptentwicklung
- Zweige release/X.Y: Basis für die zukünftige X.Y.Z-Version (z. B. release/4.1 für 4.1.3)
- Die neuesten Releases sind als Tags auf den Versionszweigen vorhanden


Den Code abrufen und aufbauen (hier für den Zweig Release/4.1):


```
git clone --depth 1 --branch release/4.1 https://forge.bluemind.net/stash/scm/bm/bluemind-public.git
cd bluemind-public
mvn clean install -Dmaven.test.skip=true
```


Alle binären Artefakte von BlueMind werden in Ihrem lokalen Maven-Repository installiert.

## Abhängigkeiten

BlueMind-Pakete hängen von bm-cyrus und bm-nginx ab.

### bm-cyrus


```
git clone https://forge.blue-mind.net/stash/scm/bm/bm-cyrus-imapd.git
cd bm-cyrus-imapd
./ci/build\_cyrus.sh
```


### bm-nginx


```
git clone https://forge.blue-mind.net/stash/scm/bm/bm-nginx.git
cd bm-nginx
./ci/build\_nginx.sh
```


## Umgebung

Es reicht nicht aus, die Pakete auf einem Server zu installieren, der die Anforderungen erfüllt, um eine funktionierende BlueMind-Installation zu haben. Die folgenden Schritte werden automatisch von dem in den Installationsprogrammen enthaltenen Paket bm-installwizard durchgeführt.

### Konfigurationsdatei bm.ini

Die Datei `/etc/bm/bm.ini` muss mit folgendem Inhalt angelegt werden (entsprechend Ihrer Konfiguration anzupassen):


```
[global]
external-url = your-domain.com
external-protocol = https
host = <YOUR SERVER IP>
dbtype = PGSQL
db = bj
user = bj
password = "bj"
```


### Postgresql-Datenbank

Die folgenden Anweisungen beziehen sich auf postgresql 9.4 und müssen an Ihre Version des DBMS angepasst werden.

Wir schlagen Ihnen eine Konfiguration vor, die Sie an Ihre Bedürfnisse anpassen können und die in `/etc/postgresql/9.4/main/` zu hinterlegen ist, um die bestehenden Dateien zu ersetzen:

[&lt;!-- TODO incorrect embedded file link -->pg_hba.conf](/confluence/download/attachments/57771872/pg_hba.conf?version=1&modificationDate=1576233027500&api=v2)[&lt;!-- TODO incorrect embedded file link -->postgresql.conf](/confluence/download/attachments/57771872/postgresql.conf?version=1&modificationDate=1576233027079&api=v2)

Die Datei `postgresql.conf` muss bearbeitet werden, um den Wert der Option `max_connections` festzulegen: der empfohlene Wert ist: `<ANZ. CORES> * 10 + 10`

Die der kompilierten Version entsprechende Datenbank kann unter der folgenden Adresse abgerufen werden: [http://pkg.blue-mind.net/db/](http://pkg.blue-mind.net/db/)

Die folgenden Befehle verwenden das Beispiel der Version 3.0.23, und müssen entsprechend Ihrer postgresql-Konfiguration angepasst werden:


```
sudo -u postgres psql
create user bj with password 'bj';
create database bj;
grant all privileges on database bj to bj;
\q
sudo -u postgres psql bj < 3.0.23.sql
```


Fügen Sie Host-Informationen in die Datenbank ein:


```
sudo -u postgres psql
insert into host (host\_domain\_id, host\_timeupdate, host\_timecreate, host\_name, host\_ip) values (1, now(), now(), 'bluemind', '<ip\_hote>');
insert into hosttag (tag\_id, host\_id) values ((SELECT id from systemtag where name='bm/core'), 1);
\q
```


BlueMind neu starten:


```
bmctl restart
```


Schließlich empfehlen wir Ihnen, in der Datei `/etc/sysctl.conf` den Wert `kernel.shmmax=300000` zu setzen.

### Nginx konfigurieren

Die Dateien bm-webmail und bm-client-access (Ordner `/etc/nginx/sites-available`) müssen bearbeitet werden, um "`${externalUrl}`" durch die externe Server-URL zu ersetzen (wie auch in bm.ini angegeben), und dann nach `/etc/nginx/sites-enabled` kopiert oder verknüpft werden.

Starten Sie dann einfach Ihren Server neu und nutzen Sie Ihre neue BlueMind-Installation!


