---
title: "Disaster Recovery"
confluence_id: 79863301
position: 52
---
# Disaster Recovery


# Introduction

This documentation describes the DR used to rebuild a BlueMind architecture from a backup. Server restoration can take a very long time and should only be used as a last resort.


# Prerequisites

1 re-install the BlueMind architecture - **all servers** - exactly as it was:
  - same IP addresses
  - same external URL 
  - same BlueMind version
1 run the BlueMind setup wizard
1 make the BlueMind backup data accessible **for reading and writing** in the file `/var/backups/bluemind` **from all BlueMind nodes.**


# Procedure

**On each BlueMind node**, run the following command:


```
/usr/share/bm-node/bm-pra-restore.py
```


The tool lists out the backups available so that you can pick the ones you want to restore.
:::important

Choose the same backup on all BlueMind nodes.

:::

The PRA is complete when the command has run successfully on all the nodes of the BlueMind architecture.

# Post-operations

1 If you have a subscription, please reinstall it as described in the installation guide: [Setting up subscriptions](https://forge.bluemind.net/confluence/display/BM35/Mise+en+oeuvre+de+la+souscription)
1 Log into the admin console as *[admin0@global.virt](mailto:admin0@global.virt)* then:
  - Go to Security > Manage firewall > click "Save"This force-regenerates BlueMind firewall rules 
  - Go to System Management >Manage Messaging System > click "Execute" This regenerates the postfix mail routing tables 
  - Go to Security > Modify Certificate and reinstall the SSL certificateNote: the certificate, its private key as well as CA certificates are available in the file `/etc/ssl/certs/bm_cert.pem` on the BlueMind server.
1 Reinstall any required plugins (LDAP/AD import...).


