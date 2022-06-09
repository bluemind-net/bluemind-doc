---
title: "Building BlueMind"
confluence_id: 57771872
position: 40
---
# Building BlueMind


## Introduction

BlueMind source code is compiled by a continuous integration server, and binary installers are downloadable from our site to make the process as simple as possible. However, it is possible to compile BlueMind manually by following the instructions below.

## Prerequisites

BlueMind must be build with Java 8


## Fetching and building code

BlueMind code is published here: [https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public). It is a public copy of our internal repository which follows the following guidelines:

- master branch: main development
- dev/X branches: base branches for future X.Y.Z release (for instance dev/4 for BlueMind 4.1.3)
- release/X branches: code for BlueMind released versions. The tip of those branches is static: they are effectively used as tags.


To fetch and build the code:


```
git clone --depth 1 --branch dev/4 https://forge.bluemind.net/stash/scm/bm/bluemind-public.git
cd bluemind-public
mvn clean install -Dmaven.test.skip=true
```


All BlueMind binary artifacts will be installed in your local maven repository.

## Dependancies

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


## Environment

Installing packages on a server that meets the prerequisites is not enough to to have a working BlueMind installation. The following steps must additionally be performed (convenience bm-installwizard package included in the installers does just this).

### bm.ini configuration file

The file /etc/bm/bm.ini must be created with the following content (to be tuned to your configuration):


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


### Postgresql database

The following instructions are related to postgresql 9.5, to be tuned to your DBMS version.

We propose a configuration that you can adapt to your needs. Replace the following files in /etc/postgresql/9.5/main/:

[&lt;!-- TODO incorrect embedded file link -->pg_hba.conf](/confluence/download/attachments/57771872/pg_hba.conf?version=1&modificationDate=1576233027500&api=v2) [&lt;!-- TODO incorrect embedded file link -->postgresql.conf](/confluence/download/attachments/57771872/postgresql.conf?version=1&modificationDate=1576233027079&api=v2)

The postgresql.conf file must be edited to set the value of max_connections option. The recommended value being: &lt;NB CORES> * 10 + 10

The database corresponding to the builder version may be downloaded at the following address: [http://pkg.blue-mind.net/db/](http://pkg.blue-mind.net/db/)

The following commands use the example of the 3.0.29 release, and should be adjusted depending on your postgresql configuration:


```
sudo -u postgres psql
create user bj with password 'bj';
create database bj;
grant all privileges on database bj to bj;
\q
sudo -u postgres psql bj < 3.0.23.sql
```


Insert host information in database :


```
sudo -u postgres psql
insert into host (host\_domain\_id, host\_timeupdate, host\_timecreate, host\_name, host\_ip) values (1, now(), now(), 'bluemind', '<ip\_hote>');
insert into hosttag (tag\_id, host\_id) values ((SELECT id from systemtag where name='bm/core'), 1);
\q
```


Restart BlueMind :


```
bmctl restart
```


Finally, we recommend that you set the value kernel.shmmax=300000 in /etc/sysctl.conf.

## nginx configuration

The bm-webmail and bm-client-access files (in /etc/nginx/sites-available folder) must be edited to replace all  "`${externalUrl}`" occurences with the server external URL (as specified in bm.ini), then symlinked to `/etc/nginx/sites-enabled`.

Then just restart your nginx server to enjoy your new BlueMind system!


