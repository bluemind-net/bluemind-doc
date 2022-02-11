---
title: "Restoring user or mailshare mailbox contents"
confluence_id: 79863552
position: 70
---
# Restoring user or mailshare mailbox contents


# Introduction

This page describes the procedure to follow in the following cases:

1 The contents of a user's mailbox must be restored and ** [Single-user restoration using DataProtect](https://forge.bluemind.net/confluence/display/BM35/Restauration+unitaire+-+Navigation+DataProtect) has failed**.
1 You want to restore the **contents of a user's mailbox into another user's mailbox**.


BlueMind provides a couple of shell and python scripts to help you with restoring data from a user mailbox backup.


# Prerequisites

To be able to use these scripts, the [Python Client](/Guide_du_développeur/API_BlueMind/Client_Python/) must be installed on the machine.

# Useful files

[&lt;!-- TODO incorrect embedded file link -->restore.sh](/confluence/download/attachments/79863552/restore.sh?version=1&modificationDate=1644233546891&api=v2) 

# Procedure

The script `restore.sh` will restore user data from the backup directory into a user's or another user's mailbox, as required, into a sub-folder named `restored_&lt;timestamp>`.

To start it:


```
./restore.sh USER|MAILSHARE BACKUP\_PATH USER|MAILSHARE EMAIL\_ADDRESS
```


- `USER|MAILSHARE`: to restore a user use the keyword USER, to restore a shared mailbox use the keyword MAILSHARE
- 
`BACKUP_PATH`: path to the data in the BlueMind backup directory (/var/backups). The path looks like:


**
User


**
Mailshare


`/var/backups/bluemind/dp_spool/rsync/&lt;IP>/mail/imap/&lt;backup
 number>/var/spool/cyrus/data/&lt;bluemind 
domain>/domain/&lt;domain initial>/&lt;domaine 
bluemind>/&lt;user initial>/user/&lt;user>/`

E.g. for the user "jdoe" on the domain "bluemind.loc":

`/var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/806/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`


`/var/backups/bluemind/dp_spool/rsync/&lt;IP>/mail/imap/&lt;sauvegarde>/var/spool/cyrus/data/&lt;domaine>/domain/&lt;initiale_domaine>/&lt;domaine>/`

You can see that for a mailbox, the path stops at the domain level. Therefore, the path is always the same for all mailshares of the domain.

E.g. in our sample domain "bluemind.loc", path will be:

`/var/backups/bluemind/dp_spool/rsync/192.168.122.148/mail/imap/806/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/`


- `USER|MAILSHARE`: as for first keyword, indicates the target mailbox type
- `EMAIL_ADDRESS`: email address for the target mailbox you want to restore the data into


Then, you have 4 possibilities:


**
User > User


**
User > Mailshare


**
Mailshare > User


**
Mailshare > Mailshare


```
./restore.sh USER jdoe@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/ USER hannibal@bluemind.loc
```


```
./restore.sh USER jdoe@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/ MAILSHARE contact@bluemind.loc
```


```
./restore.sh MAILSHARE contact@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/ USER jdoe@bluemind.loc
```


```
./restore.sh MAILSHARE contact@bluemind.loc /var/backups/bluemind/dp\_spool/rsync/192.168.122.148/mail/imap/817/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/ MAILSHARE contact@bluemind.loc
```


