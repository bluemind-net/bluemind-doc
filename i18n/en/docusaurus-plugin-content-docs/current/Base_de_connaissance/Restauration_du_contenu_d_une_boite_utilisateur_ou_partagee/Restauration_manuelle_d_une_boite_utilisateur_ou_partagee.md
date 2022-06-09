---
title: "Manual user or mailshare restoration"
confluence_id: 57771953
position: 76
---
# Manual user or mailshare restoration


## Introduction

This page is designed to guide you through the process for restoring a user or shared mailbox based on a backup directory.

We recommend that you use [Restauration unitaire DataProtect](https://forge.bluemind.net/confluence/display/DA/.Restauration+unitaire+-+Navigation+DataProtect+vBM-3.5), or the [scripted restauration](/Base_de_connaissance/Restauration_du_contenu_d_une_boite_utilisateur_ou_partagee/), this guide is only to be used if they have failed.


## Directories

Before you restore the mailbox, you must rebuild the *data* and *metadata* trees located in:

- `/var/spool/cyrus/data/`
- `/var/spool/cyrus/meta/`


For instance, on the domain `bluemind.loc` the path is:

- `/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/`
- `/var/spool/cyrus/**meta**/bluemind_loc/domain/b/bluemind.loc/`


Backup files can be found in `/var/backups` tree view.

As a result, the corresponding backup *spool* is (in this instance, for backup number 1234):

- `/var/backups/bluemind/dp_spool/rsync/192.168.122.56/mail/imap/1234/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/`
- `/var/backups/bluemind/dp_spool/rsync/192.168.122.56/mail/imap/1234/var/spool/cyrus/**meta**/bluemind_loc/domain/b/bluemind.loc/`


## User restoration

### Data

The data (emails) is stored in the server directory `/var/spool/cyrus/**data**/domain_loc/[...]/[n]/user/nom_user/` ([n] being the initial of the login id, i.e. *n*om_user in this example)

The metadata is stored in the server directory `/var/spool/cyrus/**meta**/domain_loc/[...]/[n]/user/nom_user/`. This is email metadata: read status, flags, reply or forward markers, etc.

It is recommended that you backup metadata. Without metadata backups, restoration is still possible, but they will be present in their original state: they will be considered as unread, not replied to and have no particular status. 

### Prerequisites and example data

The server the data is restored into,  if it is not the original server -- must have the same characteristics: same domain name, same IP address, same url, same BlueMind version, etc.

- **the user name must be identical to the original user name**


For the procedure, we will use the following user:

- domain `bluemind.loc`
- user name `jdoe`


The data:** 


**

- the mailbox data (see above) will be placed in the target server in the following directories:
    - data: `/var/backups/jdoe/`
    - metadata: `/var/backups/jdoe-meta/`
- the data will be restored into a subfolder of the user's mailbox named `restore_dir` (this can be any name, you can use the day's date or any other name)


### Procedure


:::info

In the directory paths or some command lines, the full stop '.' in the domain name is replaced with underscore '_'.

Make sure you make this substitution when you adapt the commands to your domain.

:::

#### Restoration into mailbox other than the user's 

To restore a user's messages into a maibox other than its original mailbox, you have two options:

- restore without the metadata (see below)
- restore with the metadata (see below) then:
    - log in with the target user id
    - go to parameters > Mail > tab Sharings > click Save"There is no need to make any changes, simply force-save sharing options.


#### Restoration with metadata

Log in as `root` :

- go into `/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`
- copy the data you want to restore and give the appropriate rights to the directory thereby created:


```
mv /var/backups/jdoe/ restore\_dir
chown -R cyrus:mail restore\_dir
chmod -R u+rwx restore\_dir
```


- go into ``/var/spool/cyrus/**meta**/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`` 
- copy the metadata you want to restore into a new sub-directory with the same name as the directory used for the data:


```
mv /var/backups/jdoe-meta/ restore\_dir
chown -R cyrus:mail restore\_dir
chmod -R u+rwx restore\_dir
```


- run the Cyrus mailbox reconstruct command:


```
/usr/lib/cyrus/bin/reconstruct -r -f user/jdoe@bluemind.loc
```


#### Restoration without metadata


:::info

In the directory paths or some command lines, the full stop '.' in the domain name is replaced with underscore '_'.

Make sure you make this substitution when you adapt the commands to your domain.

:::

Logged into the server as `root`:

- go into `/var/spool/cyrus/**data**/bluemind_loc/domain/b/bluemind.loc/j/user/jdoe/`
- copy the data you want to restore and give the appropriate rights to the directory thereby created:


```
mv /var/backups/jdoe/ restore\_dir
chown -R cyrus:mail restore\_dir
chmod -R u+rwx restore\_dir
```


- reproduce the tree structure for the metadata:


```
find restore\_dir/ -type d -exec mkdir /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/{} \;
```


- go into the user's metadata folder, create the cyrus.header files and set the appropriate rights:


```
cd /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/
find restore\_dir -type d -exec touch {}/cyrus.header \;
chown -R cyrus:mail restore\_dir
```


- run the Cyrus mailbox reconstruction command:


```
/usr/lib/cyrus/bin/reconstruct -p bluemind\_loc -r -f user/jdoe/restore\_dir@bluemind.loc
```


#### Finalizing - in all scenarios

1. run the quota application command:


```
/usr/lib/cyrus/bin/quota -f -d bluemind.loc user.jdoe
```


2. At this point, the messages should be accessible in webmail. If it isn't he case, make sure you refresh the tree structure cache be following these steps:

    - while logged into BlueMind as the user, click the gears button at the bottom left of the folders list > "Manage folders":![](../../attachments/57771953/57771954.png)
    - the `restore_dir` folder and its structure should be visible in the folder structure
    - go back to webmail without performing any additional actions
    - the folder and the restored messages should then be visible
3. To finalize:

    - if a quota is set on the mailbox, make sure it has not been reached; if it has, increase it temporarily.
    - in the admin console, while logged in as admin0:
        - go to the user management page > Maintenance tab
        - check "Repair mailbox indexing"
        - click Save


## Mailshare restoration

### Data

Unlike user folder tree structures, sub-directories for shared mailboxes are not located in the mailbox's main directory but in a sub-directory identified by its initial letter.

E.g. the sub-directory named "restore-20171003" will not be located in:

`/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/c/contact` of the mailbox, but in the directory `/var/spool/cyrus/data/bluemind_loc/domain/b/bluemind.loc/**r**/contact`

Therefore it is important that you bear this in mind when you copy or write the code lines below.

### Procedure

1. Recreate the mailbox via the admin console: Directory Entries > New > Shared Mailbox
2. Create the mailbox's *data* restoration directory:


```
mkdir -p /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003
chown cyrus:mail /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/
chown -R cyrus:mail /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact
```


3. Create the mailbox's *meta* restoration directory:


```
mkdir -p /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003
chown cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/
chown -R cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact
```


4. Create the *header* file in the *meta* restoration directory:


```
touch /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/cyrus.header
chown cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/cyrus.header
```


5. Restore the data (emails) in the *data* directory:


```
cd /var/backups/bluemind/dp\_spool/rsync/192.168.122.56/mail/imap/1/var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc
#copies emails located in the mailbox root folder (inbox)
cp c/contact/\* /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/
#searches and copies sub-folders 
find ./ -maxdepth 3 -type d -wholename "\*/contact/\*" -exec cp -a -r {} /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/ \;
#sets rights on copied files 
chown -R cyrus:mail /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003
```


6. Restore the metadata in the *meta* directory:


```
cd /var/backups/bluemind/dp\_spool/rsync/192.168.122.56/mail/imap/1/var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc
#searches and copies sub-folders
find ./ -maxdepth 3 -type d -wholename "\*/contact/\*" -exec cp -a -r {} /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/ \;
#sets rights on copied files
chown -R cyrus:mail /var/spool/cyrus/meta/bluemind\_loc/domain/b/bluemind.loc/r/contact/restored-20171003/
```

*NB: there are no files to copy from the root folder here. *

7. Rebuild the mailbox index.There are 2 ways of doing this:
    1. Using command line:


```
/usr/lib/cyrus/bin/reconstruct -f -r -p bluemind\_loc "contact/restored-20171003@bluemind.loc"
```


    2. In the admin console, go to the shared mailbox management page, Maintenance tab and start the mailbox index rebuilding.


