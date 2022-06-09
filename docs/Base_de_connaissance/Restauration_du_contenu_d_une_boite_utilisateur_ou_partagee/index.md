---
title: "Restauration du contenu d'une boîte utilisateur ou partagée"
confluence_id: 57771950
sidebar_position: 70
---
# Restauration du contenu d'une boîte utilisateur ou partagée

## Présentation

Cette page vous donne les procédures à suivre dans les cas suivants :

1. Le contenu de la messagerie d'un utilisateur ou d'une boîte partagée doit être restauré et **la [Restauration unitaire via DataProtect](https://forge.bluemind.net/confluence/display/BM35/Restauration+unitaire+-+Navigation+DataProtect) n'a pas fonctionné**.
2. On souhaite restaurer le contenu de la boîte de messagerie **dans un dossier de la boîte de messagerie d'un autre utilisateur ou d'une boîte partagée**

BlueMind met à votre disposition un couple de scripts shell et python permettant de vous assister dans la restauration des **données précédemment sauvegardées** de la boîte de messagerie concerné.

## Pré-requis

Pour pouvoir utiliser ces scripts, le [Client Python](/Guide_du_developpeur/API_BlueMind/Client_Python/) doit être installé sur la machine.

## Fichiers utiles

Télécharger le script `restore.sh` et le déposer sur le serveur :

[&lt;!-- TODO incorrect embedded file link -->restore.sh](/confluence/download/attachments/57771950/restore.sh?version=1&modificationDate=1639652921392&api=v2) 


:::tip

Le fichier `updateMboxAcls.py` présent auparavant n'est plus nécessaire, son contenu a été intégré au script principal.

:::

## Procédure

Le script `restore.sh` restaurera les données de la boîte de messagerie à partir du répertoire de sauvegarde dans la boîte de messagerie elle-même ou dans une autre boîte, dans un sous-dossier nommé `restored_<timestamp>`.

Il se lance ainsi :

```
./restore.sh USER|MAILSHARE BACKUP\_PATH USER|MAILSHARE EMAIL\_ADDRESS
```

- `USER|MAILSHARE` : pour restaurer un utilisateur indiquer le mot clé USER, pour restaurer une boîte partagée indiquer MAILSHARE
- `BACKUP_PATH` : chemin où se trouvent les données dans le répertoire de sauvegarde de BlueMind (/var/backups). Le chemin est de la forme :

| Boîte | Chemin |
|-----------------------|------- |
| **Boîte utilisateur** | `/var/backups/bluemind/dp_spool/rsync/<IP>/mail/imap/<sauvegarde>/var/spool/cyrus/data/<domaine>/domain/<initiale_domaine>/<domaine>/<initiale_utilisateur>/user/<utilisateur>/` Par exemple pour l'utilisateur jdoe sur le domaine bluemind.loc : `/var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/806/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/` **La spécification du dossier de l'utilisateur permet de ne restaurer qu'un sous-dossier en particulier.**| 
| **Boîte partagée** | `/var/backups/bluemind/dp_spool/rsync/<IP>/mail/imap/<sauvegarde>/var/spool/cyrus/data/<domaine>/domain/<initiale_domaine>/<domaine>/` On remarque ici que pour une boîte partagée, **le chemin à indiquer s'arrête au domaine concerné**. Ainsi, le chemin est toujours le même pour toutes les boîtes du domaine. Par exemple dans notre domaine bluemind.loc : `/var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/806/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/` |

- `USER|MAILSHARE` : de même que pour le premier mot clef, celui-ci indique le type de boîte cible dans laquelle la restauration sera effectuée, USER pour une boîte utilisateur, MAILSHARE pour une boîte partagée
- `EMAIL_ADDRESS` : adresse de messagerie de l'utilisateur ou de la boîte partagée cible

On a donc 4 cas d'utilisation possibles :

| Cas d'utilisation |  |
|-------------------------------| - |
| **Utilisateur > Utilisateur** | ./restore.sh USER jdoe@bluemind.loc /var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/ USER hannibal@bluemind.loc |
| **Utilisateur > Boîte partagée** | ./restore.sh USER jdoe@bluemind.loc /var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/ MAILSHARE contact@bluemind.loc |
| **Boîte partagée > Utilisateur** | ./restore.sh MAILSHARE contact@bluemind.loc /var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/ USER jdoe@bluemind.loc |
| **Boîte partagée > Boîte partagée** | ./restore.sh MAILSHARE contact@bluemind.loc /var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/ MAILSHARE contact@bluemind.loc |


