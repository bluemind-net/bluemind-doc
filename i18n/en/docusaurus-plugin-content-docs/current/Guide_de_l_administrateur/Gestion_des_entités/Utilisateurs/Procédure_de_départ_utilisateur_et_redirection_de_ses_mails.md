---
title: "User Departure and Email Redirection"
confluence_id: 57771508
position: 60
---
# User Departure and Email Redirection


## Introduction 

When an employee leaves, you need to archive their user and retrieve their data. Your organization might also want to continue receiving their mail.

This article describes how to:

- archive a user
- save and archive data
- transfer incoming mail to another mailbox.


This article uses the following conventions:

- the email address of the user you want to archive is user1@bm.com
- the email address of the recipient of user1's incoming mail is userCS@bm.com


## Archiving users and redirecting mail

In order to retrieve new incoming emails sent to an employee who has left the organization, you have two options:

- forward their mail to another user: this implies adding the email address of the user who has left the organization ([user1@bm.com](mailto:user1@bm.com) in this example) as an alias of the target user
- forward their mail to a shared mailbox: this implies creating a shared mailbox whose address is [user1@bm.com](mailto:user1@bm.com)  or whose alias matches this address.


To archive a user, save their data and redirect their mail, you must:

1. Rename the user as user1.bck
2. Set "user1.bck" as an alias for user1's address2'. OR: Create a shared mailbox "bp.userbck"
3. Redirect (with or without local copy) messages from user1.bck to userCS
4. Wait for the next global backup.
5. To retrieve email messages - 3 ways:
    1. Use a thick email client such as Thunderbird to copy all messages to the shared mailbox "bp.userbck".
    2. Use a thick email client such as Thunderbird to retrieve all messages via POP.
    3. Use the [Restoring user or mailshare mailbox contents](/Base_de_connaissance/Restauration_du_contenu_d_une_boîte_utilisateur_ou_partagée/) procedure
6. To retrieve contacts and the calendar:
    1. In the admin console, go to "DataProtect Navigator"
    2. Click the last backup
    3. Select the user "user1.bck"
    4. Click the links to retrieve VCard files (address books) and the ICS file (calendar data).
7. Delete the user "user1.bck"
8. Create an alias "user1" for the user "userCS"


## Auto-reply option

Sometimes, you might not want to have all of an employee's messages forwarded to another for confidentiality issues and have an auto-reply message sent to senders asking them to contact someone else in the organization.

In that case you have two options:

- Create a new user "user2.out" with the departed user's address "[user1@bm.com](mailto:user1@bm.com)" as an alias and set up a custom out-of-the-office message. The advantage of this approach is that you are able to set up a user-specific message, the downside is that this **user will be removed from the subscription's user count**.
- Create one user "user.deactivated" with the addresses and aliases of all departed employees as aliases and set up a common message for all users. With this method, **one user** allows you to manage all departed users.


## Deletion and AD synchronization

When a user is deleted in the Active Directory, it is automatically archived in BlueMind during synchronization.

Users can therefore be deleted in the Active Directory at any time. This will result in the user being disabled in BlueMind and stop them from logging in but will not delete their data.

This means you can follow the procedure described above and then delete the user from the Active Directory.


