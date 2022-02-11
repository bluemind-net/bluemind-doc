---
title: "Synchronizing with Windows Phone"
confluence_id: 79862603
position: 68
---
# Synchronizing with Windows Phone


# Introduction

ActiveSync synchronization is the preferred synchronization mode as it allows you to synchronize messages as well as contacts and calendars while IMAP is restricted to messages.

To find out more, go to the page [Synchronisation des périphériques externes](/Guide_de_l_utilisateur/Configuration_des_périphériques_mobiles/).

 


:::important

This guide was written using a Nokia Lumia 520 running Lumia Black (Windows Phone 8.0).

For other Windows Phone devices, the process is the same although screenshots may vary.

:::

 

# Setting up an account
:::important

Being able to connect a** **smartphone to the BlueMind server depends on the authorization policy defined by administrators. Make sure you check with them whether you are indeed authorized to connect with a smartphone. In particular, some configurations require an administrator's manual authorization.

Please refer to the following page: [Configuring the EAS server](/Guide_de_l_administrateur/BlueMind_et_mobilité/Configuration_du_serveur_EAS/).

:::

 

## Creating an account

From the home screen or the list of applications, go to settings:

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_01_en.png?version=1&modificationDate=1410527666558&api=v2)

Then select "email+accounts":

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_02_en.png?version=1&modificationDate=1410527677591&api=v2)

Select "add an account":

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_03_en.png?version=1&modificationDate=1410527688902&api=v2)

Select an "Outlook" account:

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_04_en.png?version=1&modificationDate=1410527699977&api=v2)

Enter your email address and password and tap "sign in":

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_05_en.png?version=1&modificationDate=1410527713011&api=v2)

Windows Phone then tests the settings to connect automatically.

If it fails to connect, switch to advanced mode:

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_06_en.png?version=2&modificationDate=1410530071787&api=v2)

Correct the username and the server:

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_07_en.png?version=2&modificationDate=1410530083597&api=v2)

Barring special cases, the settings are as follows:

- The username is your email address.
- The server address (*bluemind.loc *in this example) is the BlueMind url access (excluding https://).E.g. if in your web browser you access BlueMind at [https://bm.bluemind.loc](https://bm.domaine.com) then you need to enter **bm.bluemind.loc.**


Once this has been corrected, a connection with the server should be established; Windows Phone performs an initial synchronization and the account is shown in settings:

![](https://forge.blue-mind.net/confluence/download/attachments/8552776/windowsphone_08-09_en.png?version=2&modificationDate=1410530128470&api=v2)

## Selecting which items to synchronize

Once your account is set up correctly, you can customize its name, select which items to synchronize and how often (as items arrive, every 30 mins, 1 hour, etc. or for an extended period e.g. the last 7 days, the last month, etc.):

![](https://forge.blue-mind.net/confluence/download/attachments/8552776/windowsphone_10_en.png?version=2&modificationDate=1410530138790&api=v2)

Access to BlueMind Mail is shown on the home screen and shows the number of unread messages if any:

![](https://forge.blue-mind.net/confluence/download/thumbnails/8552776/windowsphone_11_en.png?version=1&modificationDate=1410527800892&api=v2)

All account data is synchronized and available: messages, contacts, calendar:

![](../../../attachments/79862603/79862606.png)

# Forcing the calendar to refresh

To force the calendar to synchronize:

- Go to settings > "e-mail+account"·
- Long press the account you want
- Tap "Synchronize" in the menu that appears:


![](../../../attachments/79862603/79862604.png)


 

 

 

 

