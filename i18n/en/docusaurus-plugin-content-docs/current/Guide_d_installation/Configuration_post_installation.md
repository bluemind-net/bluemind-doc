---
title: "Post-installation Configuration"
confluence_id: 57771194
position: 44
---
# Post-installation Configuration


## Setting up BlueMind

Once BlueMind is installed on your Linux distribution, use your web browser to visit the set up page. Enter the following address (including http**s**): **  [https://your.mail.server/setup](https://your.mail.server/setup).  **

Then let the wizard guide you through installation:

** ![](../attachments/57771194/72190216.png) 


**

1. ** **Prerequisites check:** **


:::info

A warning may appear when the server has been assigned the minimum memory required. This is merely a non-blocking warning as a result of memory calculation, setup can go on regardless.

If an issue blocking installation is detected, a red error message appears and the "Continue" button is unavailable.

:::

2. ****BlueMind URL:****** **enter your public BlueMind url and click "Test access" to confirm. If all tests are successful, the "Next" button is enabled:![](../attachments/57771194/72190214.png)
3. ** **Domain name**:** check the mail domain name and change it if necessary, then click "Next"If a [data server is used for data distribution](/Guide_d_installation/Installation/Installation_avec_répartition_des_données_sur_plusieurs_serveurs/), check the "Data server" box and enter its IP address.**![](../attachments/57771194/72190212.png)**
4. ****Passwords**: **from version 4.5.3, the system lets you customize installer-defined passwords.In addition, an extra safety step helps you not lose them inadvertently: until the box "I have memorized these passwords" isn't checked, the "Finish the configuration" isn't enabled. ****![](../attachments/57771194/72190211.png)
5. **Installation is complete **and the application's connection details are displayed:![](../attachments/57771194/72190210.png)
6. **Restart** the BlueMind service:


```
bmctl restart
```


:::info

Make sure you secure administrator passwords!

For versions earlier than 4.5.3 for which the installer doesn't let you check and customize passwords, admin passwords ([admin@bluemind.lan](mailto:admin@bluemind.lan) in this instance) and admin0 ([admin0@global.virt](mailto:admin0@global.virt)) MUST be changed on production installs.

Unsecured passwords may be used maliciously to access **your server data** or use your server **to send SPAM** via the SMTP service. 

:::

![](../attachments/57771194/72190209.png)

## Subscription

If you have a [BlueMind subscription](/Guide_de_l_administrateur/La_souscription_BlueMind/), you must now [install](/Guide_d_installation/Mise_en_œuvre_de_la_souscription/) it to enjoy related tools and be able to [work with Outlook](/Guide_de_l_administrateur/La_souscription_BlueMind/Mise_en_œuvre_de_MAPI_pour_Outlook/).

## Additional Components

Some additional components are not included in BlueMind's default install and require you to install extra packages.

### Detaching email attachments

BluMind version 3.5 introduces the possibility to [send email attachments](/Guide_de_l_utilisateur/La_messagerie/Fichiers_volumineux_et_détachement_des_pièces_jointes/) as download links.

To find out more about installing and setting up BlueMind, go to our page about [linked attachments](/Guide_de_l_administrateur/Configuration/Détachement_des_pièces_jointes/).

### LDAP Import

To implement user and group import from an LDAP directory, go to the page [LDAP Synchronization](/Guide_de_l_administrateur/Gestion_des_entités/Synchronisation_LDAP/)

### Subscription-based Components

The BlueMind subscription includes additional tools and features:

- the ActiveDirectory import tool.


To find out more, go to the page [Implementing the subscription](/Guide_d_installation/Mise_en_œuvre_de_la_souscription/)

## Provisioning

After BlueMind is installed, to insure best performance, some settings need to be configured according to your equipment and the number of users, namely:

- number of IMAP processes: In the admin console, go to the [System Configuration](/Guide_de_l_administrateur/Configuration/Configuration_système/) page - chapter 1.2: Cyrus
- nginx workers: In the admin console, go to the  [System Configuration](/Guide_de_l_administrateur/Configuration/Configuration_système/)  page - chapter 2: Reverse proxy


## Data migration

For data migration to be successful, it must be carried out from server to server using data export/import tools.

Any data transfer carried out by users or through thick clients (Outlook, Thunderbird) can be tricky in terms of volume and may lead to user data inconsistencies in the new instance of BlueMind.

For each type of data, we therefore advice you to use the following:

- Contacts: VCard exports and imports
- Events: ICS imports/exports
- Emails: depending on the source server, imapSync, Exchange or Domino migration tool.


Please ask BlueMind or your BlueMind partner for help with data migration.


:::info

PST Import

Reminder: with version 4.0, just like 3.5, DO NOT use PST import in Outlook to migrate data.

:::


