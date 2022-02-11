---
title: "Restauration d'une sauvegarde depuis un emplacement externe"
confluence_id: 57771751
position: 60
---
# Restauration d'une sauvegarde depuis un emplacement externe


# Introduction

Lorsque les sauvegardes BlueMind sont externalisées et que l'on souhaite restaurer des données, il faut au préalable rapatrier les données sur le serveur BlueMind pour qu'il en ait connaissance.


# Méthode
:::important

L'adresse IP ne doit pas avoir changé entre la sauvegarde externe et le serveur sur lequel restaurer BlueMind.

Dans le cas contraire il faudra modifier le chemin de la sauvegarde externe pour y faire apparaître la nouvelle IP et réaliser un changement d'adresse IP d'un serveur BlueMind après restauration (procédure sur demande auprès du support BlueMind).

:::

Le principe de cette opération est de monter temporairement le volume de stockage sur lequel repose la sauvegarde externalisée, puis de porter à la connaissance de DataProtect l'existence de ces données sur le serveur.

1 
Monter le répertoire externe en tant que *--bind* dans le répertoire de sauvegarde BlueMind :


```
mount --bind <sauvegarde\_externe> /var/backups/bluemind/
```


1 
Re-synchroniser le navigateur DataProtect avec le script suivant :


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


1 Restaurer en utilisant [le navigateur DataProtect](/Guide_de_l_administrateur/Sauvegarde_et_restauration/Restauration_unitaire_Navigation_DataProtect/)


# Notes

Le montage *bind* peut également se faire pour remplacer temporairement le contenu de la dernière sauvegarde existante par le contenu de la sauvegarde externe, le temps de la restauration via le navigateur DataProtect.

Dans ce cas-là, il n'est pas nécessaire de re-synchroniser le navigateur car l'on utilise la dernière sauvegarde connue et déjà référencée.

- 
Pour restaurer les mails d'un utilisateur, il est possible d'utiliser le montage suivant (par exemple pour l'utilisateur "admin") :


```
mount --bind <sauvegarde\_externe\_BAL> /var/backups/bluemind/dp\_spool/rsync/172.16.45.161/mail/imap/XXXX/var/spool/cyrus/domain\_tld/domain/d/domain.tld/a/user/admin/
```


Où XXXX est le numéro de la dernière sauvegarde sur le système de fichier.

- 
Pour restaurer les agenda ou contacts, utiliser le même procédé pour restaurer le dump de la base de données PostgreSQL dans le répertoire :


```
/var/backups/bluemind/dp\_spool/rsync/172.16.45.161/bm/pgsql/XXXX/var/backups/bluemind/work/bm\_pgsql/
```


