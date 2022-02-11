---
title: "Restoring a backup from an external source"
confluence_id: 79863321
position: 60
---
# Restoring a backup from an external source


# Introduction

When BlueMind backups are stored externally and you want to restore data, you must first move the data to the BlueMind server so that it recognizes it.


# Method
:::important

The IP address must not have changed between the external server and the server you want to restore BlueMind on.

Failing that, you will have to edit the external backup path to show the new IP and change the BlueMind server's IP address after the restoration process (via BlueMind support request).

:::

The purpose of this operation is to temporarily mount the storage volume the external backup relies on, then get DataProtect to acknowledge the presence of this data on the server.

1 
Mount the external directory as *--bind* in the BlueMind backup directory:


```
mount --bind <external\_backup> /var/backups/bluemind/
```


1 
Synchronize the DataProtect navigator again using the following script:


```
#!/bin/bash

core="http://localhost:8085/services"
latd="admin0@global.virt"
pass=`cat /etc/bm/bm-core.tok`

wget -q -O- \
"${core}/login/doLogin?login=${latd}&password=${pass}&origin=sh" | \
xmllint --format - | \
grep sid| \
sed  's#  <sid>\([^<]*\)</sid>$#\1#' | tee session.tok

session=`cat session.tok`

wget -q -O- "${core}/dataprotect/syncWithFS?sid=${session}"|xmllint --format -
```


1 Restore using the[DataProtect navigator](/Guide_de_l_administrateur/Sauvegarde_et_restauration/Restauration_unitaire_Navigation_DataProtect/).


# Notes

You can also do a *bind* mount to temporarily replace the content of the latest existing backup by the contents of the external backup while you carry out the restoration through the DataProtect navigator.   

In that case, you don't have to synchronize the navigator again as you are using the last known backup which is already referenced.

- 
To restore a user's emails, you can use the following mount (e.g. for the user "admin"):


```
mount --bind <external\_backup\_BAL> /var/backups/bluemind/dp\_spool/rsync/172.16.45.161/mail/imap/XXXX/var/spool/cyrus/domain\_tld/domain/d/domain.tld/a/user/admin/
```


XXXX is the number for the latest backup in the file system.

- 
To restore calendars or contacts, you can use the same process as for the PostgreSQL database dump in the directory:


```
/var/backups/bluemind/dp\_spool/rsync/172.16.45.161/bm/pgsql/XXXX/var/backups/bluemind/work/bm\_pgsql/
```


