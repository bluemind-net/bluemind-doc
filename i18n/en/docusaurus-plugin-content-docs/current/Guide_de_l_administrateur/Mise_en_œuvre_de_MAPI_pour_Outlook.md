---
title: "Implementing MAPI for Outlook"
confluence_id: 57771792
position: 90
---
# Implementing MAPI for Outlook

A [subscription](./La_souscription_BlueMind.md) is required to benefit from this feature.

## Introduction

Syncing Outlook with BlueMind 4.0 no longer requires a connector to be installed on client workstations. However, a few operations must be performed on the server to allow the network's Outlook software to connect to BlueMind.


:::info

The MAPI in 4 functionality is in production with many customers. However, it is still in a reliability phase. It is deactivated by default. We therefore invite you [to get in touch with your usual contact person or to contact us to define in which framework this functionality can be activated for your installation or project](https://content.bluemind.net/decouvrez-bluemind-4-0).

:::


:::info

Security Warning

We recommend that you work on virtual machines and use snapshots so that you can go back in case of an error.

:::

## Compatibility

### Outlook for Mac

As communication protocols vary, BlueMind only supports versions of Outlook **for Windows**.

**BlueMind is unable to guarantee compatibility with Outlook for MacOS versions.**

### Outlook for Windows

Check the support of your versions of Outlook in our page [Compatibility](../FAQ_Foire_aux_questions_/Compatibilité.md)

## Features

### Inbox sub-folders

In versions 4.0.x of BlueMind (4.0.x), folders created under the Inbox by Outlook are not mail folders but virtual folders.

**BlueMind 4.1 provides supports for inbox subfolders**.


:::info

Update from 4.0.x to 4.x

**Warning:** when you update from BlueMind 4.0.x to 4.x, virtual folders are not migrated and will be deleted.

To prevent this, you can move virtual folders outside the inbox **before migrating** in order to save them.

:::

### Attachments to calendar events

In addition to the [BlueMind Calendar](../Guide_de_l_utilisateur/L_agenda/Créer_un_évènement.md/#ajouter-des-pièces-jointes) application, version 4.1 allows you to attach files to diary events from Outlook.

## Prerequisites

1. Having [BlueMind version 4.0](https://download.bluemind.net/bm-download/4.0) installed
2. You must be able to access the following BlueMind addresses via HTTPS from client workstations:
    - *external server url* (e.g. *[https://mail.bluemind.loc](https://mail.bluemind.loc)* )
    - *autodiscover* url - typically replacing the first part of the external url by "`autodiscover`" (e.g. *[https://autodiscover.bluemind.loc](https://autodiscover.bluemind.loc)* ) which must also point to the BlueMind external-url


:::tip

**Outlook in MAPI mode cannot run without a properly configured autodiscover.** At startup, the MAPI service checks that the autodiscover is configured for the domain or at least one of its aliases; **if not, the MAPI service does not start.**

To make sure that the server is configured properly and accessible, you can use Microsoft's online diagnostic tool: [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/)

:::
3. When accessing these addresses from a browser, **no security warnings regarding the ssl certificate should be displayed.**


## Implementation


:::tip

Quick implementation of an evaluation environment

Find out who you can quickly set up an evaluation environment in our blog article: [BM 4.0 beta + Outlook: step by step](https://blog.bluemind.net/en/bm-4-0-beta-outlook-step-by-step/)

:::

Everything must be installed ****before you create the users who will be using Outlook****:

- [Deploy the subscription](/Guide_d_installation/Mise_en_œuvre_de_la_souscription/)
- Install the required packages:

| Debian/Ubuntu | RedHat/CentOS |
| -- | -- |
| $ aptitude install bm-mapi | $ yum install bm-mapi |


*Note: BlueMind doesn't have to be restarted*

- Log into BlueMind's admin console and [create users](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/) **giving them an email address**.


Then, please refer to the following page to configure the workstations for Outlook: [Syncing with Outlook](/Guide_de_l_utilisateur/Configuration_des_clients_lourds/Synchronisation_avec_Outlook/)


