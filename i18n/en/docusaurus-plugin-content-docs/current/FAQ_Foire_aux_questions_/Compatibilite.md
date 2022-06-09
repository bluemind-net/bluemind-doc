---
title: "Compatibility"
confluence_id: 57770212
position: 32
---
# Compatibility


This page provides BlueMind compatibility information with web browsers, third-party software and mobile devices. It includes a review of tested and verified devices as well as known issues with some devices or operating systems.

If your device is not listed here, please [let us know](http://www.blue-mind.net/contact-us/).


Web Browsers
BlueMind supports the following web browsers, using the latest version available is always recommended:

| Browser | Minimum Version |
| --- | --- |
| Firefox | 52.0 ESR |
| Chrome | latest version |
| Safari | 5 |
| Internet Explorer | 11 |
| Microsoft Edge | latest version |

| Known limitations | Windows XP | Administration console |
| --- | --- | --- |
| 
BlueMind cannot be used with XP+IE8 or XP+outlook
There's a configuration workaround for BlueMind 3.0 [from 3.0.20](https://forge.bluemind.net/confluence/display/BM30/Fin+du+support+de+XP) but XP is no longer supported for BlueMind 3.5 and 4.0.
 |
| No version of Internet Explorer supports the BlueMind admin console. |

## Thunderbird

BlueMind supports recent versions of Thunderbird, specifically since version 57.0.

Regardless, we recommend that you install updates as they become available so that you can enjoy its creators' and contributors' upgrades and features.

## Outlook

| Outlook version | 32 bits | 64bits |
| --- | --- | --- |
| Outlook 2007  | * &lt;sub>(and older)&lt;/sub> * | 
![](../attachments/57770017/66096274.png)
 | 
![](../attachments/57770017/66096274.png)
 |
| Outlook 2010 | 
![](../attachments/57770017/66096250.png) &lt;sup> &lt;em>(1)&lt;/em> &lt;/sup>
 | 
![](../attachments/57770017/66096250.png) &lt;sup> &lt;em>(1)&lt;/em> &lt;/sup>
 |
| 
Outlook 2013* &lt;sup> &lt;sub>(2)&lt;/sub> &lt;/sup> *
 | 
![](../attachments/57770017/66096275.png)
 | 
![](../attachments/57770017/66096275.png)
 |
| Outlook 2016 | 
![](../attachments/57770017/66096275.png)
 | 
![](../attachments/57770017/66096275.png)
 |

&lt;sup> &lt;em>(1) How BlueMind works with Outlook 2010 may depend on the BlueMind version and the client workstation update level - please ask us for more details or an ad-hoc assessment&lt;br/>&lt;/em> &lt;/sup>

&lt;sup> &lt;em>(2) Home&amp;Business, Standard, Professionnal, Professionnal Plus&lt;/em> &lt;/sup>

| Outlook features not currently supported | Hybrid mode (cached/online) | Linked attachments | Message recall | Shared email folders |  Propose new time | Trash | Retrieving items deleted from the trash folder | Restoring items other than emails | Conversation mode |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 
Account configuration to download items older than a certain time (e.g.: 1 month).
Recent data is downloaded and kept locally while older data is accessed online.
 | 
**Recommendation/Workaround:** 
Use *Offline* mode
 |
| Adding attachments or adding them as a link to a file storage location. |
| 
Cancels sent emails by deleting them from the server queue or by deleting and replacing them by a message notification if they have already been delivered to users' mailboxes.
 |
| 
Shares a single folder rather than the whole mailbox.
 | 
**Recommendation/Workaround****:**
Ask the administrator to create a shared mailbox between the users concerned. 
 |
| 
**This feature is supported as of BlueMind 4.5**
 | 
Allows users to propose a new time to the organiser when replying to a meeting request.
 | 
**Recommendation/Workaround****:**
Decline the invitation and propose a new time in the attached note.
 |
| 
**This feature is supported as of BlueMind 4.5**
 | 
Items deleted from the trash folder can still be retrieved from the server (as per storage policy).
 | 
**Recommendation/Workaround****:**
Ask the administrator to restore data from a backup 
 |
| Restores events, contacts etc. from the trash folder |
| 
This feature isn't currently included in BlueMind's MAPI. Outlook doesn't group messages by conversation.
 | 
However, some messages may be sorted by conversation depending on the third-party client they come from (e.g. Webmail or Thunderbird).
 |

* 


*

## Android

BlueMind works on all Android versions, from version 4.4.2 or above, preferably using the latest version or update offered by the manufacturer or the mobile phone carrier.

The EAS protocol is standard however, due to manufacturer or carrier overlays, some smartphones may experience malfunctions. As our teams are alerted of such issues and we are able to test the devices concerned, we correct the issue and add the smartphone to the list of supported devices.

You should preferably use devices running Android *stock*: this is a pure Android version, with no manufacturer sublayers or extra pre-installed applications.

Here is the (non exhaustive) list of tested devices that work with BlueMind:

- Samsung
    - Galaxy S4 (Android 4.2 to 5.0.1)
    - Galaxy S7 (Android 6.0.1 and 7.0)
- LG
    - Nexus 5 (Android 4.0 to 4.4)
    - G4


| Known limitations | Multi-calendar display | Draft folder not synchronized | Huawei | Tasks |
| --- | --- | --- | --- | --- |
| 
Android does not support multiple color-coded calendar display. As a result, shared calendars cannot be displayed by default. Only the user's calendar is shown and works.
 | 
You may however enable this functionality to couple it with a third-party application: [Multi-calendrier sur les smartphones.](/Base_de_connaissance/Multi_calendrier_sur_les_smartphones/)
 | 
****Warning****: this only applies to the user's calendars (default calendar and secondary calendar). Shared calendars (user or domain calendars) cannot be viewed on smartphones, even when this feature is enabled.
 |
| Draft synchronization is available via ActiveSync since version 16 of the protocol. As BlueMind implements version 14, drafts cannot currently be synchronized. |
| Huawei's native calendar application is showing some issues, e.g. appointments being deleted unexpectedly. Until Huawei fixes the issue, we recommend that you not use it and use the Google Calendar application which is available on devices and works properly. |
| Tasks management is only available on Samsung devices through the manufacturer application (named SPlanner or Samsung Calendar depending on the device) |

## Mac OS X

The CardDav and CalDav protocols are currently verified with **native** Mac OS X clients only and preferably an up-to-date OS. Given this standard's permissiveness, we are unable to guarantee that it will work properly with other clients using this protocol.

## iPhone, iPad

All iPhones and iPads running on iOS 9.3.5 and above have been tested and are supported, without restriction, but we still recommend that you use the latest version available for your device.

| Known limitations | Synchronization Period Limitation | Draft folder not synchronized |
| --- | --- | --- |
| 
For performance reasons, message synchronization is limited to the last 30 days, even if the "synchronize all" option is selected on the device.
 |
| Draft synchronization is available via ActiveSync since version 16 of the protocol. As BlueMind implements version 14, drafts cannot currently be synchronized. |

## Windows Phone

BlueMind works on all Windows Phone versions from version 7.10 (Mango, September 2011).

Below is the list of BlueMind-compatible devices:

- Nokia Lumia 520 (Lumia Black - Windows Phone 8.0)


| Known limitations | Limited synchronization timeframe | Draft folder not synchronized |
| --- | --- | --- |
| For performance reasons, message synchronization is limited to the last 30 days, even if the "synchronize all" option is selected on the device. |
| Draft synchronization is available via ActiveSync since version 16 of the protocol. As BlueMind implements version 14, drafts cannot currently be synchronized. |

## Blackberry

BlueMind works on all Blackberry versions from version 10 (early 2013).

Below is the list of BlueMind-compatible devices:

- Blackberry Q5
- Blackberry Q10


| Known limitations | Multi-calendar display | Limited synchronization timeframe | Draft folder not synchronized |
| --- | --- | --- | --- |
| Blackberry assigns the same email address to all synchronized calendars, which prevents multiple calendar handling. As a result, shared calendars are not shown, only the user calendar is shown and enabled. |
| For performance reasons, message synchronization is limited to the last 30 days, even if the "synchronize all" option is selected on the device. |
| Draft synchronization is available via ActiveSync since version 16 of the protocol. As BlueMind implements version 14, drafts cannot currently be synchronized. |


