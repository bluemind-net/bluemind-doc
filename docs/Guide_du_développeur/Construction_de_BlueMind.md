---
title: "Construction de BlueMind"
confluence_id: 57771872
sidebar_position: 40
---
# Construction de BlueMind


## Présentation

Le code source de BlueMind est compilé par un serveur d'intégration continue, et les binaires produits sont téléchargeables sur notre site sous forme d'installeurs qui rendent le processus aussi simple que possible. Il est toutefois envisageable de compiler BlueMind manuellement en suivant les instructions suivantes.

## Prérequis

La compilation doit s'effectuer avec Java 8.


## Récupération et construction du code

Le code de BlueMind est publié dans [https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public). Il s'agit d'une copie de notre base de code interne, organisée de la façon suivante :

- branche master : développement principal
- branches release/X.Y : base pour la future version X.Y.Z (par exemple release/4.1 pour la 4.1.3)
- les dernières releases sont présentes sous forme de tag sur les branches de release


Pour récupérer et construire le code (ici pour la branche release/4.1) :


```
git clone --depth 1 --branch release/4.1 https://forge.bluemind.net/stash/scm/bm/bluemind-public.git
cd bluemind-public
mvn clean install -Dmaven.test.skip=true
```


Tous les artifacts binaires BlueMind sont installés dans votre repository local maven.

## Dépendances

Les paquets BlueMind dépendent de bm-cyrus et bm-nginx.

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


## Environnement

Il ne suffit pas d'installer les paquets sur un serveur répondant aux pré-requis pour disposer d'une installation BlueMind fonctionnelle. Les étapes suivantes sont réalisées automatiquement par le paquet bm-installwizard inclus dans les installeurs.

### Fichier de configuration bm.ini

Le fichier `/etc/bm/bm.ini` doit être créé avec le contenu suivant (à adapter selon votre configuration) :


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


### Base de données postgresql

Les instructions suivantes portent sur postgresql 9.4, à adapter selon votre version du SGBD.

Nous vous proposons une configuration que vous pouvez adapter à vos besoins, à déposer dans `/etc/postgresql/9.4/main/` en remplacement des fichiers existants :

[&lt;!-- TODO incorrect embedded file link -->pg_hba.conf](/confluence/download/attachments/57771872/pg_hba.conf?version=1&modificationDate=1576233027500&api=v2)[&lt;!-- TODO incorrect embedded file link -->postgresql.conf](/confluence/download/attachments/57771872/postgresql.conf?version=1&modificationDate=1576233027079&api=v2)

Le fichier `postgresql.conf` doit être édité afin de positionner la valeur de l'option `max_connections` : la valeur recommandée étant : `<NB CORES> * 10 + 10`

La base de données correspondant à la version compilée peut être récupérée à l'adresse suivante : [http://pkg.blue-mind.net/db/](http://pkg.blue-mind.net/db/)

Les commandes suivantes utilisent l'exemple de la version 3.0.23, et doivent être adaptées selon votre configuration de postgresql :


```
sudo -u postgres psql
create user bj with password 'bj';
create database bj;
grant all privileges on database bj to bj;
\q
sudo -u postgres psql bj < 3.0.23.sql
```


Insérer en base les informations de l'hôte :


```
sudo -u postgres psql
insert into host (host\_domain\_id, host\_timeupdate, host\_timecreate, host\_name, host\_ip) values (1, now(), now(), 'bluemind', '<ip\_hote>');
insert into hosttag (tag\_id, host\_id) values ((SELECT id from systemtag where name='bm/core'), 1);
\q
```


Redémarrer BlueMind :


```
bmctl restart
```


Pour finir, nous vous conseillons de positionner la valeur `kernel.shmmax=300000` dans le fichier `/etc/sysctl.conf`.

### Configuration de nginx

Les fichiers bm-webmail et bm-client-access (dossier `/etc/nginx/sites-available`) doivent être édités pour remplacer "`${externalUrl}`" par l'URL externe du serveur (telle que spécifiée également dans bm.ini), puis copiés ou liés dans `/etc/nginx/sites-enabled`.

Il suffit ensuite de redémarrer votre serveur pour profiter de votre nouvelle installation BlueMind !


