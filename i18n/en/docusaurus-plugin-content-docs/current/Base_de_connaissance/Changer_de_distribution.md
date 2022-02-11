---
title: "Changing distributions"
confluence_id: 79863494
position: 44
---
# Changing distributions


This article describes how to change the distribution BlueMind works on. It can be used to update the distribution (Ubuntu 16.04 to Ubuntu 18.04 for instance).

This procedure is based on installing a target system to which the data is migrated. This new system will then replace the original one at the network level.

# Prerequisites

- install BlueMind on the target system in an identical version to the original system and configured with the same *external-url*. The Setup Wizard must have been run on the target server. E.g.:
  - if the original system uses BlueMind 4.0.5, the target system must have BlueMind 4.0.5 installed
  - if the original *external-url *is *bluemind.domain.tld*, the target system's BlueMind must be configured with the *external-url* *bluemind.domain.tld*
  - [install a valid subscription](/Guide_d_installation/Mise_en_œuvre_de_la_souscription/) for this OS
- the target system's *root* user must be able to authenticate as *root* on the original server, ideally using key authentication.
- the *rsync* utility must be installed on both systems.


# Migration

Data migration is done in three steps to minimize service downtime:

- hot synchronization of server data to the target server - this is a time-consuming operation but does not cause service interruption
- cold synchronization - quick operation but causes service interruption
- switching servers


## Hot synchronization

Allows you to make an initial copy of data without interrupting the service:

1 connect to the target server as *root*
1 
stop services on the target servers:


```
# bmctl stop
# service postfix stop
```


1 
synchronize BlueMind data using the rsync utility:


```
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/cyrus/ /var/spool/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/lib/cyrus/ /var/lib/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-hsm/ /var/spool/bm-hsm/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/sieve/ /var/spool/sieve/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-elasticsearch/ /var/spool/bm-elasticsearch/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-docs/ /var/spool/bm-docs/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-filehosting/ /var/spool/bm-filehosting
```


These operations can be interrupted and/or performed several times.

****Note:**** The shorter the time between hot synchronization and cold synchronization, the faster cold synchronization will be.

## Cold synchronization

1 
Stop services on the servers (original and target):


```
# bmctl stop
# service postfix stop
```


1 
In the target server, synchronize the data again:


```
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/cyrus/ /var/spool/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/lib/cyrus/ /var/lib/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-hsm/ /var/spool/bm-hsm/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/sieve/ /var/spool/sieve/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-elasticsearch/ /var/spool/bm-elasticsearch/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-docs/ /var/spool/bm-docs/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-filehosting/ /var/spool/bm-filehosting
```


1 
In the target server, do a database dump for the original server data:


```
# ssh root@origsrv.domain.tld "PGPASSWORD=bj pg\_dump -U bj -h localhost bj" > /tmp/db.sql
# ssh root@origsrv.domain.tld "PGPASSWORD=bj pg\_dump -U bj -h localhost bj-data" > /tmp/db-data.sql
```


1 
In the target server, copy the original server's files to the target server:


```
# scp -r root@origsrv.domain.tld:/etc/bm/* /etc/bm
# scp root@origsrv.domain.tld:/etc/bm/bm.ini /etc/bm/bm.ini
# scp -r root@origsrv.domain.tld:/etc/bm-hps/* /etc/bm-hps

# scp root@origsrv.domain.tld:/etc/ssl/certs/bm\_cert.pem /etc/ssl/certs/bm\_cert.pem

# scp -r root@origsrv.domain.tld:/var/lib/bm-ca/* /var/lib/bm-ca

# scp root@origsrv.domain.tld:/usr/share/bm-elasticsearch/config/elasticsearch.yml /usr/share/bm-elasticsearch/config/elasticsearch.yml

# scp root@origsrv.domain.tld:/etc/imapd* /etc/
# scp root@origsrv.domain.tld:/etc/cyrus* /etc/

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
# scp root@origsrv.domain.tld:/etc/bm-webmail/* /etc/bm-webmail/
```


1 
Import the database into the target server:


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


## Switching servers

1 Stop the original server
1 Reconfigure the target server with the original server's IP address
1 Restart the target server and connect to the network instead of the original server so that it can be reached instead of the original server


# Post-migration

Connect to the BlueMind Administration console as *[**admin0@global.virt**](mailto:admin0@global.virt)* and:

- Go to the section Security > **Firewall** and immediately click "Save" to force the BlueMind firewall's rules regeneration
- Go to System Management > **Mail Maintenance**, click "Run" to regenerate the mail postfix routing tables
- Go to System Management > **System Configuration** and replace the old IP address in the "My Networks" field by the new address or the address range for which you want the relay open and click "Save"


