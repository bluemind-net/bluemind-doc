---
title: "Restoring messages deleted by a user"
confluence_id: 79863561
position: 74
---
# Restoring messages deleted by a user


# Introduction

From BlueMind 4.4, the trash folder has a "double bottom": there is a delay on the server side during which deleted emails are kept. During that time, users are able to recover messages in Outlook (MAPI-based) or the administrator can recover them in command line.


# Procedure

When a user deletes an email, the Cyrus email server doesn't delete it immediately – the message is marked as deleted and is no longer available but the file is kept.

IMAP clients can run the "expunge" command to delete messages immediately (e.g. through "Empty trash folder"), but Cyrus can also add a delay between the user's expunge request and the actual final deletion of the message on the server.

This means that during that time, the new bm-cli command can be used to retrieve the messages:


```
bm-cli mail unexpunge
```

:::important

Why not use Cyrux's unexpunge command?

The bm-cli command is required because the Cyrus "unexpunge" command that seemingly does the same thing does not return enough information for the replication protocol and breaks the link between Cyrus and BlueMind.

:::

### Restoring a user's messages

The user John Doe (ID: jdoe@bluemind.loc) wants to recover the emails deleted in the past two days. You can use the following command:


```
#> bm-cli mail unexpunge --days 2 jdoe@bluemind.loc
Folder has 1 deleted message(s)
Recovering messages less than 2 day(s)) old
+-----+---------+---------+------------------------------+
| id  | subject | preview | last-modification            |
+-----+---------+---------+------------------------------+
| 406 | Contact |   Boss  | Mon Jan 18 11:36:54 GMT 2021 |
+-----+---------+---------+------------------------------+
Checked 1 deleted item(s), will restore 1 item(s)
```


### Restoring messages from a shared mailbox

To restore messages from a shared mailbox, you must log in as a user with writing privileges on that mailbox. Then add the `authn` parameter to the command.

Example: you want to restore the messages deleted since yesterday in the Contact mailbox (contact@bluemind.loc) which John Doe has management privileges on:


```
#> bm-cli mail unexpunge --days 1 --authn jdoe@bluemind.loc contact@bluemind.loc

Folder has 1 deleted message(s)
Recovering messages less than 1 day(s)) old
+-----+---------+---------+------------------------------+
| id  | subject | preview | last-modification            |
+-----+---------+---------+------------------------------+
| 203 |  Coucou |    XMen | Tue Jan 19 15:22:34 GMT 2021 |
+-----+---------+---------+------------------------------+
Checked 1 deleted item(s), will restore 1 item(s)
```


# More on recovering messages

## Configuration

The maximum delay between an `expunge` command and an `unexpunge` recovery is configured in Cyrus `/etc/cyrus.conf` under the `delprune` command, -X parameter.

The default delay is 7 days.

## Use

You can use several parameters to make a more specific recovery:

- days: the number of days to restore
- dry: tests the command without actually carrying out the recovery
- folder: specifies a folder
- id: the id of a specific message


For more details on available options and how to use them, use the bm-cli command line help:


```
# bm-cli mail help unexpunge
```


