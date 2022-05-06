---
title: "Synchronizing with Android"
confluence_id: 57770962
position: 64
---
# Synchronizing with Android


## Introduction

ActiveSync is the preferred synchronization mode as it allows you to synchronize messages as well as contacts and calendars in a single configuration while [IMAP synchronization](/Guide_de_l_utilisateur/Configuration_des_périphériques_mobiles/Synchronisation_avec_Android/Synchronisation_IMAP_sous_Android/) is restricted to messages.

To find out more, please go to [Synchronizing with external devices](/Guide_de_l_utilisateur/Configuration_des_périphériques_mobiles/).


:::info

This guide was written using a Samsung Galaxy S4 running Android 4.4.2.

For other Android smartphones, operations should be the same although screenshots may differ.

:::

## Setting up an ActiveSync account


:::info

Being able to connect a** **smartphone to the BlueMind server depends on the authorization policy defined by administrators. Make sure you check with them whether you are indeed authorized to connect with a smartphone. In particular, some configurations require an administrator's manual authorization.

Please refer to the following page: [Configuring the EAS server](/Guide_de_l_administrateur/BlueMind_et_mobilité/Configuration_du_serveur_EAS/).

:::

 

### Creating an account

Go to your smartphone's "Settings":

![](../../../attachments/57770962/66093506.png)

In the "Accounts" tab, tap "Add account":

![](../../../attachments/57770962/66093507.png)

Select "Microsoft Exchange ActiveSync":

![](../../../attachments/57770962/66093508.png)

Enter your email address and password and tap "Next":

![](../../../attachments/57770962/66093509.png)

Server settings are filled in automatically based on your email address:

![](../../../attachments/57770962/66093511.png)

Barring special cases, double check and correct the settings as follows:

- Domain\user name can be either the user's full email address or, as shown, the domain name followed by the simple user name. E.g.: `bluemind.loc\jdoe` Some mobile devices do not accept this second option.
- Server address (*bluemind.loc *here) must be the BlueMind url (excluding https://). For example, if you access BlueMind from your web browser with the address https://bm.bluemind.loc, you should type **bm.bluemind.loc.**


Once you've checked the settings, tap "Next".

Confirm access authorization by tapping "OK":

![](../../../attachments/57770962/66093513.png)

### Choosing what items to synchronize


:::info

Android does not support multiple color-coded calendar display. As a result, shared calendars cannot be displayed by default. Only the user calendar is shown and enabled.

You may however enable this functionality in order to couple it with a third-party application: [Multi-calendar feature on smartphones](/Base_de_connaissance/Multi_calendrier_sur_les_smartphones/) *(French only)*

:::

The application next displays synchronizing options. These can be modified later by going to "Account options":

![](../../../attachments/57770962/66093514.png)  


:::info

By default, * [Push Mail](http://fr.wikipedia.org/wiki/Push_mail) * mode is selected, which means that the server will send new emails to the smartphone as soon as they arrive. In other options, your smartphone will contact the server periodically to check for new messages.

:::

Tap "Next".

### Completing your account setup

Your account is set up, you can now choose a name for it:

![](../../../attachments/57770962/66093515.png)

Tap "Done" to complete setup.

You can now see the account in Settings > Account > Microsoft Exchange ActiveSync and quickly access synchronizing options and information:

![](../../../attachments/57770962/66093517.png) ![](../../../attachments/57770962/66093519.png) ![](../../../attachments/57770962/66093521.png)


:::info

Only personal address book "My Contacts" is synchronized with your smartphone's contacts. You can access contacts from other address books (Directory, Collected contacts, etc.) through your smartphone's search function (contacts, emails, etc.).

:::

You can now access your messages from your smartphone's email app and appointments are synchronized in the calendar app.

![](../../../attachments/57770962/66093525.png)

## Forcing the calendar to refresh

To force the calendar to synchronize, open the menu in the top right corner of the application and tap "Refresh":

![](../../../attachments/57770962/66093527.png)


