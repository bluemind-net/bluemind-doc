---
title: "The Server is Being Used to Send SPAM"
confluence_id: 57771848
position: 72
---
# The Server is Being Used to Send SPAM


## Make sure that the BM server isn't an open relay

By default, Postfix is configured as an open mail server relay, which allows BlueMind services (webmail, EAS) to send emails. Through the admin console, you can add new trusted IPs which will be allowed to send emails through the BlueMind server, typically the internal IT server (holiday management software, monitoring, etc).

If one of these servers has become compromised, spammers may use the BM server to send spam.

If you have this issue, you'll find a large number of command lines such as:


```
Jun 21 08:34:30 centos7 postfix/smtpd[16863]: connect from gateway[192.168.122.111]
Jun 21 08:34:48 centos7 postfix/smtpd[16863]: 1C205316C411: client=gateway[192.168.122.111]
Jun 21 08:34:58 centos7 postfix/cleanup[16869]: 1C205316C411: message-id=<>
Jun 21 08:34:58 centos7 postfix/qmgr[16801]: 1C205316C411: from=<user1@domain.com>, size=233, nrcpt=1 (queue active)
Jun 21 08:34:59 centos7 postfix/smtp[16821]: 1C205316C411: to=<user2@anotherdomain.net>, relay=smtp.anotherdomain.net[XX.XX.XX.XX]:25, delay=20, delays=20/0/0.35/0.09, dsn=2.0.0, status=sent (250 2.0.0 Ok: queued as 2F10238)
Jun 21 08:34:59 centos7 postfix/qmgr[16801]: 1C205316C411: removed
Jun 21 08:35:04 centos7 postfix/smtpd[16863]: disconnect from gateway[192.168.122.111]


```


In this instance, the client command line shows the IP of the server the email comes from, i.e. 192.168.122.111. If this IP isn't legitimate, the server is compromised and is being used to send spam.

Take the following action:

- delete the IP for the server involved in the BM admin console and save the configuration.


## Identifying the user used to send SPAM

Most of the time, the issue is that a spammer has found – often using brute-force – a user's password and uses their account to send SPAM.

You will spot smtp connections with many command lines such as:


```
May  5 00:08:55 hermes postfix/smtpd[27666]: 7E079B666CC: client=unknown[46.48.93.60], sasl\_method=LOGIN, sasl\_username=admin
```


Take the following actions:

- change the user's password: either in BM, or in the directory.
- close all sessions for this user using the command:


```
bm-cli user logout login@domain.com
```


- clean the Postfix queue to delete emails pending to be sent for the user "[login@domain.net".](mailto:login@domain.net)


```
postqueue -p | tail -n +2 | awk 'BEGIN { RS = "" } /login@domain\.net/ { print $1 }' | tr -d '\*!' | postsuper -d -
```


:::info

This command deletes all emails in the user's queue, whether they are SPAM or legitimate. This may take while.

:::


## Preventing spam attacks

### Limiting brute-force attacks

To try and avoid brute-force attacks, you can use the plugin [password-bruteforce which blocks connection attempts for 20 minutes after 3 failed authentications](https://marketplace.bluemind.net/addons/72/).

### Set up a password policy

If you're not using a directory to manage users, you can use the [`password-sizestrength`](https://forge.bluemind.net/confluence/display/BM40/Administration+des+utilisateurs#Administrationdesutilisateurs-S%C3%A9curit%C3%A9dumotdepasse) plugin which is used to set up a password policy with forced password rules.

## How to spot this early?

A monitoring solution can help detect the issue quickly and react before your server becomes blacklisted by anti-spam services.

[Bm-tick](#) can be used to set up alerts when a strong increase in the number of emails is detected in the Postfix queue. You can configure this using the alert builder or the following script:
[&lt;!-- TODO incorrect embedded file link -->postfix_queue.tick](/confluence/download/attachments/57771848/postfix_queue.tick?version=1&modificationDate=1561119236334&api=v2)

This script sends an alert email to [admin@domain.net](mailto:admin@domain.net) as soon as the Postfix queue reaches 200 messages. These values can be configured to match your installation.

