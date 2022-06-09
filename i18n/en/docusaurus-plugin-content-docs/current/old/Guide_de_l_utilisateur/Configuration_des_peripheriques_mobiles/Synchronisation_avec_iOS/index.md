---
title: "Synchronizing with iOS"
confluence_id: 57771069
position: 68
---
# Synchronizing with iOS


## Introduction

### Synchronization

ActiveSync is the preferred synchronization mode as it allows you to synchronize messages as well as contacts and calendars while [IMAP synchronization](/old/Guide_de_l_utilisateur/Configuration_des_peripheriques_mobiles/Synchronisation_avec_iOS/Synchronisation_IMAP_avec_iOS/) is restricted to messages.

To find out more, please go to [Synchronizing with mobile phones and tablets](/old/Guide_de_l_utilisateur/Configuration_des_peripheriques_mobiles/).


:::info

This guide was written using one specific model of iPad. Screenshots are usually identical on all Apple products although they may vary from one version to the next.

:::


### Synchronized Items

#### Contacts

Apple mobile devices synchronized using EAS can now include several address books: personal and shared address books.

All user address books (excluding collected addresses and the directory) can therefore be synchronized.

#### Calendars

iOS permet de synchroniser l'ensemble des calendriers personnels et partagés avec l'utilisateur.

## Setting up an ActiveSync account


:::info

Being able to connect a** **smartphone to the BlueMind server depends on the authorization policy set by administrators. Make sure you check with them whether you are indeed authorized to connect with a smartphone. In particular, some configurations require an administrator's manual authorization.

Please refer to the following page: [Configuring the EAS server](/Guide_de_l_administrateur/BlueMind_et_mobilite/Configuration_du_serveur_EAS/).

:::

Go to Settings > Mail, Contacts, Calendars and tap "Add account":

![](../../../../attachments/57771069/57771097.png) ![](../../../../attachments/57771069/57771095.png)

Choose to add an Exchange account:

![](../../../../attachments/57771069/57771093.png)

Fill in user information and tap "Next" in the top right corner:

![](../../../../attachments/57771069/57771091.png)

Fill in the detailed server information:

![](../../../../attachments/57771069/57771089.png)

- **Email**: your email address
- **Server**: the address (URL)  your phone uses to access the ActiveSync service. It is typically called external URL and is similar to the address you are using to access BlueMind (excluding https://).

- **Domain**: your email domain name, usually the part of your email address to the right of the @.

- **Username and password**: your BlueMind username and password the way they were given to you by your administrator. Usually, your username is your full email address including the domain name.

- **Description**: this is optional. It allows you to recognize the account in your list of accounts.


Tap Next.

Your iOS device will then try to connect to your BlueMind server.

Once the connection is complete, you can choose the items you want to synchronize, and tap "Save":

![](../../../../attachments/57771069/57771087.png)

Your account now is shown in the list of accounts in the device:

![](../../../../attachments/57771069/57771085.png)

Tap the account to access the synchronization settings (items to synchronize, duration):

![](../../../../attachments/57771069/57771083.png)

Congratulations! Your device is now synchronized with BlueMind!

![](../../../../attachments/57771069/57771081.png)

## Forcing the calendar to refresh


:::info

This part of the guide was written using an iPad running iOS 8.4.

:::

From the Calendar application, open the displayed calendars' window:

![](../../../../attachments/57771069/57771074.png)

Tap the window and drag it downwards:

![](../../../../attachments/57771069/57771072.png)

The spinning wheel is displayed, showing that the device is synchronizing the calendars:

![](../../../../attachments/57771069/57771070.png)

When the spinning wheel goes away and the window returns to normal, refreshing is complete.


