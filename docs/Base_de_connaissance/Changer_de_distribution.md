---
title: "Changer de distribution"
confluence_id: 57771914
position: 44
---
# Changer de distribution


Cette documentation décrit la façon de changer la distribution sur laquelle fonctionne BlueMind. Elle peut-être utilisée pour mettre à jour la distribution (Ubuntu 16.04 vers Ubuntu 18.04 par exemple).

Cette procédure est basée sur l'installation d'un système cible sur lequel les données seront migrées. Ce nouveau système prendra ensuite la place, au niveau réseau, du premier.

# Pré-requis

- installer sur le système cible un BlueMind en version identique au système d'origine et configuré avec la même *external-url*. L'installation wizard (ou le setup wizard) doit avoir été joué sur le serveur cible. Par exemple:
  - si le système d'origine utilise BlueMind 4.0.5, le système cible doit avoir un BlueMind 4.0.5
  - si l'*external-url* d'origine est *bluemind.domain.tld*, le BlueMind du système cible doit être configuré avec l'*external-url* *bluemind.domain.tld*
  - [installer une souscription](/Guide_d_installation/Mise_en_œuvre_de_la_souscription/) valide pour cet OS
- l'utilisateur *root* du serveur cible doit pouvoir s'authentifier en tant que *root* sur le serveur d'origine, idéalement en authentification par clé.
- l'utilitaire *rsync* doit-être installé sur les 2 systèmes.


# Migration

La migration des données se passe en 3 temps afin de minimiser l'indisponibilité du service:

1 synchronisation à chaud des données du serveur source vers le serveur cible - opération longue mais ne provoquant pas de coupure de service
1 synchronisation à froid - opération rapide mais provoquant une coupure de service
1 remplacement des serveurs


## Synchronisation à chaud

Permet de faire la copie initiale des données sans coupure du service:

1 se connecter en tant que *root* sur le serveur cible
1 
stopper les services sur les serveurs cible:


```
# bmctl stop
# service postfix stop
```


1 
synchroniser les données de BlueMind via l'utilitaire rsync:


```
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/cyrus/ /var/spool/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/lib/cyrus/ /var/lib/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-hsm/ /var/spool/bm-hsm/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/sieve/ /var/spool/sieve/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-elasticsearch/ /var/spool/bm-elasticsearch/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-docs/ /var/spool/bm-docs/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-filehosting/ /var/spool/bm-filehosting/
```


Ces opérations peuvent-être interrompues et/ou réalisées plusieurs fois.

****Note:**** Plus le temps entre la synchronisation à chaud et la synchronisation à froid est court, plus la synchronisation à froid sera rapide.

## Synchronisation à froid

1 
stopper les services sur les serveurs (origine et cible):


```
# bmctl stop
# service postfix stop
```


1 
depuis le serveur cible, refaire une synchronisation des données:


```
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/cyrus/ /var/spool/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/lib/cyrus/ /var/lib/cyrus/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-hsm/ /var/spool/bm-hsm/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/sieve/ /var/spool/sieve/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-elasticsearch/ /var/spool/bm-elasticsearch/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-docs/ /var/spool/bm-docs/
# rsync -avH --delete root@origsrv.domain.tld:/var/spool/bm-filehosting/ /var/spool/bm-filehosting/
```


1 
depuis le serveur cible, réaliser un dump de la base de données du serveur d'origine:


```
# ssh root@origsrv.domain.tld "PGPASSWORD=bj pg\_dump -U bj -h localhost bj" > /tmp/db.sql
# ssh root@origsrv.domain.tld "PGPASSWORD=bj pg\_dump -U bj -h localhost bj-data" > /tmp/db-data.sql
```


1 
depuis le serveur cible, copier les fichiers du serveur origine vers le serveur cible:


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
re-monter la base de données sur le serveur cible:


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


## Remplacement des serveurs

1 stopper le serveur d'origine
1 re-configurer le serveur cible pour lui attribuer l'adresse IP du serveur d'origine
1 re-démarrer le serveur cible et le connecter au réseau à la place du serveur d'origine afin qu'il soit joignable à la place du serveur origine


# Post-migration

Se connecter à la console d'administration de BlueMind en tant qu'utilisateur *[admin0@global.virt](mailto:admin0@global.virt)* puis:

1 Se rendre dans la partie Sécurité > **Gestion du pare-feu** et cliquer immédiatement sur le bouton "Enregistrer" pour forcer la re-génération des règles du parefeu BlueMind
1 Se rendre dans la partie Gestion du Système > **Maintenance des mails**, cliquer sur le bouton "Exécuter" pour re-générer les tables de routage de mails postfix
1 Se rendre dans la partie Gestion du Système > **Configuration Système** et remplacer l'ancienne adresse IP du champ "Mes réseaux" par la nouvelle adresse ou plage d'adresse pour laquelle on souhaite être relais ouvert avant de cliquer sur le bouton "Enregistrer"


