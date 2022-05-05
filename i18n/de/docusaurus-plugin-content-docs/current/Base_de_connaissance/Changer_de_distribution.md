---
title: "Distribution ändern"
confluence_id: 57771914
position: 44
---
# Distribution ändern


In dieser Dokumentation wird erläutert, wie Sie die Distribution, auf der BlueMind läuft, ändern können. Sie kann zum Aktualisieren der Distribution verwendet werden (z. B. von Ubuntu 16.04 auf Ubuntu 18.04).

Dieses Verfahren basiert auf der Installation eines Zielsystems, auf das die Daten migriert werden sollen. Dieses neue System nimmt dadurch auf der Netzwerkebene den Platz des ersten Systems ein.

## Voraussetzungen

- Installieren Sie auf dem Zielsystem ein BlueMind in der gleichen Version wie auf dem ursprüngliche System, konfiguriert mit der gleichen *external-url*. Der Setup-Assistent (bzw. Setup Wizard muss auf den Zielserver aufgespielt worden sein. Beispiel:
    - Wenn das ursprüngliche System BlueMind 4.0.5 verwendet, muss das Zielsystem ein BlueMind 4.0.5 haben
    - Wenn die ursprüngliche *external-url* *bluemind.domain.tld* ist, muss das BlueMind des Zielsystems mit der *external-url* *bluemind.domain.tld*konfiguriert werden
    - ein [gültiges Abonnement](/Guide_d_installation/Mise_en_œuvre_de_la_souscription/) für dieses OS installieren
- der *Root*-Benutzer des Zielservers muss sich als *Root* auf dem Ursprungsserver authentifizieren können, idealerweise mit Schlüsselauthentifizierung.
- das Dienstprogramm *rsync* muss auf beiden Systemen installiert sein.


## Migration

Die Datenmigration wird in 3 Schritten durchgeführt, um die Ausfallzeiten des Dienstes zu minimieren:

1. Hot-Synchronisation der Daten vom Quellserver auf den Zielserver – langwieriger Vorgang, der aber keine Ausfallzeit verursacht
2. Cold-Synchronisation – schneller Vorgang, aber mit Ausfallzeit
3. Serveraustausch


### Hot-Synchronisation

Ermöglicht die Erstkopie von Daten, ohne den Betrieb zu unterbrechen:

1. Melden Sie sich als *root* auf dem Zielserver an
2. Dienste auf den Zielservern stoppen:


```
# bmctl stop
# service postfix stop
```


3. BlueMind-Daten über das Dienstprogramm rsync synchronisieren:


```
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/cyrus/ /var/spool/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/lib/cyrus/ /var/lib/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-hsm/ /var/spool/bm-hsm/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/sieve/ /var/spool/sieve/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-elasticsearch/ /var/spool/bm-elasticsearch/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-docs/ /var/spool/bm-docs/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-filehosting/ /var/spool/bm-filehosting/
```


Diese Vorgänge können unterbrochen und/oder mehrmals ausgeführt werden.

****Hinweis:**** Je kürzer die Zeit zwischen Hot- und Cold-Synchronisation, desto schneller wird die Cold-Synchronisation verlaufen.

### Cold-Synchronisation

1. Dienste auf den Servern (Ursprung und Ziel) stoppen:


```
# bmctl stop
# service postfix stop
```


2. Vom Zielserver aus die Daten erneut synchronisieren:


```
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/cyrus/ /var/spool/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/lib/cyrus/ /var/lib/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-hsm/ /var/spool/bm-hsm/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/sieve/ /var/spool/sieve/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-elasticsearch/ /var/spool/bm-elasticsearch/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-docs/ /var/spool/bm-docs/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-filehosting/ /var/spool/bm-filehosting/
```


3. Vom Zielserver aus einen Dump der Datenbank des Ursprungs-Servers durchführen:


```
# ssh root@origsrv.domain.tld "PGPASSWORD=bj pg\_dump -U bj -h localhost bj" > /tmp/db.sql
# ssh root@origsrv.domain.tld "PGPASSWORD=bj pg\_dump -U bj -h localhost bj-data" > /tmp/db-data.sql
```


4. Vom Zielserver aus die Dateien vom Ursprungsserver auf den Zielserver kopieren:


```
# scp -r root@origsrv.domain.tld:/etc/bm/\* /etc/bm
# scp root@origsrv.domain.tld:/etc/bm/bm.ini /etc/bm/bm.ini
# scp -r root@origsrv.domain.tld:/etc/bm-hps/\* /etc/bm-hps

# scp root@origsrv.domain.tld:/etc/ssl/certs/bm\_cert.pem /etc/ssl/certs/bm\_cert.pem

# scp -r root@origsrv.domain.tld:/var/lib/bm-ca/\* /var/lib/bm-ca

# scp root@origsrv.domain.tld:/usr/share/bm-elasticsearch/config/elasticsearch.yml /usr/share/bm-elasticsearch/config/elasticsearch.yml

# scp root@origsrv.domain.tld:/etc/imapd\* /etc/
# scp root@origsrv.domain.tld:/etc/cyrus\* /etc/

# scp root@origsrv.domain.tld:/etc/postfix/main.cf /etc/postfix/main.cf
# scp root@origsrv.domain.tld:/etc/postfix/master.cf /etc/postfix/master.cf
# scp root@origsrv.domain.tld:/etc/postfix/master\_relay\_transport-flat /etc/postfix/master\_relay\_transport-flat
# scp root@origsrv.domain.tld:/etc/postfix/master\_relay\_transport.db /etc/postfix/master\_relay\_transport.db
# scp root@origsrv.domain.tld:/etc/postfix/transport-flat /etc/postfix/transport-flat
# scp root@origsrv.domain.tld:/etc/postfix/transport.db /etc/postfix/transport.db
# scp root@origsrv.domain.tld:/etc/postfix/virtual\_alias-flat /etc/postfix/virtual\_alias-flat
# scp root@origsrv.domain.tld:/etc/postfix/virtual\_alias.db /etc/postfix/virtual\_alias.db
# scp root@origsrv.domain.tld:/etc/postfix/virtual\_domains-flat /etc/postfix/virtual\_domains-flat
# scp root@origsrv.domain.tld:/etc/postfix/virtual\_domains.db /etc/postfix/virtual\_domains.db
# scp root@origsrv.domain.tld:/etc/postfix/virtual\_mailbox-flat /etc/postfix/virtual\_mailbox-flat
# scp root@origsrv.domain.tld:/etc/postfix/virtual\_mailbox.db /etc/postfix/virtual\_mailbox.db
# scp root@origsrv.domain.tld:/etc/bm-webmail/\* /etc/bm-webmail/
```


5. Die Datenbank auf dem Zielserver wieder aufbauen:


```
# su - postgres
$ dropdb bj
$ dropdb bj-data
$ createdb bj
$ createdb bj-data
$ exit
# export PGPASSWORD=bj
# cat /tmp/db.sql | psql -U bj -h localhost bj
# cat /tmp/db-data.sql | psql -U bj -h localhost bj-data
```


### Server-Austausch

1. Den Ursprungsserver anhalten
2. Den Zielserver neu konfigurieren, um ihm die IP-Adresse des Ursprungsservers zu geben
3. Den Zielserver neu starten und ihn anstelle des Ursprungsservers mit dem Netzwerk verbinden, damit er anstelle des Ursprungsservers erreicht werden kann


## Nach der Migration

Melden Sie sich als Benutzer an der BlueMind-Administrationskonsole als Benutzer *[admin0@global.virt](mailto:admin0@global.virt)* an und:

1. Gehen Sie in den Bereich Sicherheit > **Firewall-Verwaltung** und klicken Sie sofort auf die Schaltfläche "Speichern", um die Neugenerierung der BlueMind-Firewall-Regeln zu erzwingen
2. Gehen Sie zu Systemadministration  > **Mail-Wartung** und klicken Sie auf die Schaltfläche "Ausführen", um die Postfix-Mail-Routing-Tabellen neu zu generieren
3. Gehen Sie in den Bereich Systemadministration > **Systemkonfiguration** und ersetzen Sie die alte IP-Adresse im Feld "Meine Netzwerke" durch die neue Adresse oder den Adressbereich, für den Sie ein Open-Relay haben möchten, bevor Sie auf die Schaltfläche "Speichern" klicken


