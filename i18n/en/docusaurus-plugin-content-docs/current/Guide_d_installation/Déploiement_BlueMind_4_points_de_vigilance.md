---
title: "Rolling out BlueMind 4.0: What to Watch Out For"
confluence_id: 79862651
position: 38
---
# Rolling out BlueMind 4.0: What to Watch Out For


# Introduction

BlueMind's version 4.0 incorporates major upgrades in terms of architecture including on the one hand, native Outlook support and on the other hand data replication to prepare the mail system's data for Outlook and other uses (new webmail, mobiles devices in particular).

# Replication

Replication -- one active one for each [mail shard](/Guide_d_installation/Installation/Installation_avec_répartition_des_données_sur_plusieurs_serveurs/) (and therefore one for each [mailbox-role](/Guide_de_l_administrateur/Configuration/Gestion_des_serveurs/)) – is what allows Cyrus to send a copy of messages to the bm-core service. The bm-core service uses replication to retrieve the necessary message metadata for bm-eas, bm-mapi and ElasticSearch. This metadata is stored as a database (like Exchange does) and in ElasticSearch.

As a result, you may have migrated an entire mail spool (on the Cyrus side), as messages are visible in webmail and Thunderbird, while replication fails. Under those circumstances, some – or all – messages are not available:

- in Outlook
- via EAS (smartphones)
- in the search engine (webmail, smartphones)
- to create filters in user settings or the admin console (the folders are not shown)


## Data migration and replication

Given current BlueMind-Outlook stability with the MAPI protocol, migrating data through a PST upload in Outlook is not an option. As a whole, server-side data migration is safer and the result will be more consistent.
Recommended data migration solutions include:
- 
Exchange migration tool

- 
server-side PST migration

- 
IMAP synchronization tools with imapsync (see recommendations below)

- 
Domino migration tool


Replication extracts and stores mail spool information into BlueMind objects that must exist beforehand. For replication to work properly, only data known by BlueMind must be fed into Cyrus: domains and mailboxes must therefore be created in the admin console (or via API), ** **before** **the mailboxes are filled with data. 

Currently, as admin0 (BlueMind super-administrator), you can migrate BlueMind data without worrying about BlueMind objects and mail storage rules. With admin0 privileges, mail data can be stored on the Cyrus server without undergoing any rights or consistency checks. This is why BlueMind may see the data as inconsistent and may cause the replication to fail. **We therefore advise you against importing data through imapsync as the admin0 user**.

To avoid this, if you are planning an imapsync transfer of BlueMind data, **it is important that you carry out the imapsync while logged in as the user**. By performing operations as the user themselves, you can be assured that an account exists, with the correct partition, etc.

To generate an API token for a specific user:

[https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples/generateUserToken.py](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples/generateUserToken.py)

This link shows an example of data migration which you can adapt depending on the source server and the accounts/data you want to transfer:

[https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/migration/4.0/kerio](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/migration/4.0/kerio)

As a whole, and in particular for version 4.0, we strongly recommend that you test data migration on a test server, which will be re-installed or destroyed later. The migration process, once verified, can be done on a blank server (or domain), with no trace of the operations carried out during testing. The LDAP/AD connection, imapsync or Exchange data migration, once prototyped successfully, can be replayed on the production server.

# BlueMind archiving system redesign

From version 4, message archiving (HSM) is handled natively by Cyrus (see [Archivage](https://forge.bluemind.net/confluence/display/DA/.Archivage+vBM-4.0) for more details).

If you installation already used archiving in version 3.5, you must retrieve the 3.5 archives to re-introduce them into Cyrus (which will then manage it autonomously and transparently according to the policy).

This has significant impact on mail storage spaces and typically entails lengthy migration operations, to be organized according to version 4 upgrade operations.

The detailed upgrade to version 4 procedure describes the operations required for archive migration. It is available in our Partner Space:  [Procédure de mise à jour depuis BlueMind 3.5 vers BlueMind 4](https://forge.bluemind.net/confluence/pages/viewpage.action?pageId=58598516). Please make sure that you read it carefully. 

# Storage space sizing

Several architecture reorganization and changes to how BlueMind works affects BlueMind server storage space sizing. You must be extremely careful to avoid "full disks" which can interfere, block or cause the upgrade to fail. These are the storage changes that can impact your BlueMind install:

- 
*/var/spool/bm-replication*: anticipate a significant increase in used space. Your space available must be equal to 25% of */var/spool/cyrus/data*

- 
*/var/spool/bm-elasticsearch*: 20 to 25% of the mail volume in two folders */var/spool/cyrus/data*  and  */var/spool/bm-hsm*

- 
*/var/lib/postgresql*: the database must be able to grow by 10% of mail volume (*/var/spool/cyrus/data*  et  */var/spool/bm-hsm*)

- 
*/var/log/bm/replication.log  *can also grow significantly. The corresponding partition must have at least 1Gb of available space.


In terms of memory resources, to allow the ElasticSearch service to work during the upgrade, it must be allocated an additional 1.5Go.

These extra storage space needs are laid out in:  [Procédure de mise à jour depuis BlueMind 3.5 vers BlueMind 4](https://forge.bluemind.net/confluence/pages/viewpage.action?pageId=58598516).

# BlueMind without MAPI

This option has limitations BlueMind isn't able to override. This is why BlueMind has developed a native connection with Outlook, which provides a better implementation of Outlook features.

If your users are used to the Outlook connector and happy with it, it can be left as is. Otherwise, we recommend that you progressively move to Outlook via MAPI.

#### Outlook

Without the MAPI service, Outlook continues to work with the connector [like in version 3.5](https://forge.bluemind.net/confluence/display/BM35/Synchronisation+avec+Outlook). Administrators must carry out the same [provisioning procedure for the Outlook connector](https://forge.bluemind.net/confluence/display/BM35/Mise+a+disposition+du+connecteur+Outlook) so that users can download and install it on their machines.

Outlook doesn't understand or translate  **folder mapping** . Default folders such as Inbox, Sent, etc. are shown in English because they are picked up via the IMAP protocol without being translated. This doesn't interfere with syncing from a technical point of view but may be disturbing for some users. You should note that MAPI handles mapping correctly.

#### Cyrus

From version 4.1, the Cyrus folder structure is checked on BlueMind startup and an alert – a warning in logs – is sent if an inconsistency is found.

# BlueMind with MAPI

#### Autodiscover

From version 4.1, an autodiscover check is carried out on all installation domains and aliases. If no autodiscover works, then MAPI service will not start. If at least one autodiscover works, then the service starts in order to serve accessible domains.

As a result, for each domain and alias, the MAPI server attempts a query to `domain.loc/autodiscover` and `autodiscover.domain.loc/autodiscover` and checks that itself receives the query. 

A test is also carried out on the DNS server to check the recording service `_autodiscover.\_tcp.domain.loc` and `_autodiscover.&lt;all aliases>`.
:::important

To make sure that the server is configured properly and can be reached at these urls, you can use Microsoft's online troubleshooting tool: [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/)

:::

#### Cyrus

From version 4.1, the Cyrus folder structure is checked on BlueMind startup and an alert – a warning in logs – is sent if an inconsistency is found.

## Outlook

### Recommendations and best practice

To work in its current version, Outlook must not be polluted by "objects" that do not come from BlueMind. This is why a blank Outlook profile must be created and no other Exchange/Office365 should be configured on the same profile.

In addition, registry keys must be applied, among other things to avoid network configuration conflicts (DNS, ActiveDirectory). Registry keys can be found here: XXXXXXXXX

### Creating a blank Outlook profile

To enable connector-free Outlook, first make sure you follow the server-side implementation steps described in our documentation:

##### [Implementing MAPI for Outlook](/Guide_de_l_administrateur/La_souscription_BlueMind/Mise_en_œuvre_de_MAPI_pour_Outlook/)

**In particular, make sure you read the section about server communications prerequisites: autodiscover must work properly for Outlook to be able to communicate with BlueMind.**

Then, for each workstation, follow our instructions on creating an Outlook profile:

##### [Synchronization with Outlook](/Guide_de_l_utilisateur/Configuration_des_clients_lourds/Synchronisation_avec_Outlook/)

In this case, make sure you first confirm url **accessibilit****y from the workstation**.

### Limitations of Outlook with BlueMind

Known limitations with Outlook are listed in our page on BlueMind's **  [compatibility with client software and devices](/FAQ_Foire_aux_questions_/Compatibilité/#Compatibility-compat-outlook). **

# If you encounter issues

## Versions 4.0, 4.1, 4.2, 4.3 and 4.4

Many improvements have been made to BlueMind since version 4.0. All BlueMind versions earlier than 4.5 must be updated quickly to benefit from all the latest updates.

## Checking that replication works properly
:::important

Note

Replication is now largely stabilized. Replication problems are rare. These verification instructions are therefore no longer necessary as a general rule.

:::

In the [bm-tick](/Guide_de_l_administrateur/Supervision/Monitoring_Bm_Tick/) monitoring console, you can watch the "Mailspool & Replication" dashboard. Two graphs are particularly relevant:

** **Number of messages replicated per hour****:  

 ![](https://forge.bluemind.net/jira/secure/attachment/27530/27530_image-2019-07-09-18-26-52-783.png) 

 **Number of active replications**:

 ![](https://forge.bluemind.net/jira/secure/attachment/27531/27531_image-2019-07-09-18-27-16-720.png) 

This number must be 1 per server with the mailbox role and therefore with the bm-cyrus-imapd service. If this number drops, this means that replication is no longer working.

On the contrary, if this number is higher than the number of IMAP backends, it usually means that the role has been given one – or several – [separate storage server(s)](/Guide_d_installation/Installation/Installation_avec_répartition_des_données_sur_plusieurs_serveurs/) but the service is still running on the main server. In that case you need to force-disable them by creating the following files on the bm-core and then stop the services:


To check if replication is working, you can perform an operation on an email (e.g. change it to unread) and using a `tail` command, check whether, at the same time, a line looking like the one below is added to the `/var/log/bm/replication.log` log file:


## Replication progress

We are planning tick improvements in future versions which will allow you to check the replication process's progress.

In the meantime, you can compare the number of messages in the mail spool and archives with the number of entries in the message storage table. They won't match exactly, but it gives a pretty good idea of progress. 

To find out the number of emails to be synchronized:


The sum of the two should be close to the result from the query on the bj-data database:


Note that the standard replication flow only watches "live" mailboxes. This means that if the replication delta is significant, then the replication has almost stopped, all active users have been properly replicated and have access to related features (webmail search, EAS, etc.). Also note that the count is approximate: if an email is sent to N users, it will be counted once in t_message_body but it will be present N times in the spool.   

To start the replication on idle (unused) mailboxes, you must place them in the replication queue using the following command – after having cleaned some Cyrus logs:


`$DOMAIN_UID$` being the domain name, e.g.: [bluemind.net](http://bluemind.net)

# Known limitations

You can find a list of known limitations in our page on [BlueMind compatibility](/FAQ_Foire_aux_questions_/Compatibilité/).

## Updating from BlueMind 4.0 to 4.x

### Inbox subfolders

In BlueMind versions 4.0.x, folders created in the inbox by Outlook are not mailbox folders but virtual folders.

**BlueMind 4.1 brings inbox subfolder support**.
:::important

Updating from 4.0.x to 4.x

** **Warning:** ** when you update from BlueMind 4.0.x to 4.1 or later,  **virtual folders are not migrated and will be deleted.** 

To prevent this, you can move these virtual folders outside the inbox **before you perform the update** to keep them. You can then put them back into the inbox where they will be created as mail folders.

:::


