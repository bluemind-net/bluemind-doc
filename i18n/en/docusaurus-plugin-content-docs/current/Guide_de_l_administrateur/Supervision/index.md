---
title: "Monitoring"
confluence_id: 57771639
position: 44
---
# Monitoring


## Server monitoring

We recommend that you monitor the following aspects of the server:

- **disk space** usage
- **RAM **usage
- **CPU **usage


:::info

Important
In the event of a major BlueMind component failure, a file "*.hprof"* is generated in the directory "`/var/log"`.
:::

Monitoring file activity for such files appearing is therefore crucial.

By default, the BlueMind system detects such files when they are generated and records this as an error in the file "`/var/log/bm-node/node.log"` .


You can perform this operation manually using a command such as:


```
ls /var/log/\*.hprof
```


Such a file is named according to this convention:

```
java\_pid1664.hprof
```

 In this example, "`1664"` is the ID of the process with the failure. This ID enables you to retrieve the component that causes the failure by using the command "`ps"` or "`jps"` **before** restarting BlueMind services. 

## Service monitoring

BlueMind uses standard messaging components (Cyrus Imap, Postfix, nginx, tomcat...) that can be monitored by standard tools.

In addition, APIs allow you to query the server the same way as interfaces and make sure that the BM-Core component runs properly.

The list of BlueMind processes running on the server can be accessed using the command:


```
/usr/lib/jvm/bm-jdk/bin/jps -ml
```


Typically, BlueMind-specific processes you can expect to see and are able to monitor are:

- `net.bluemind.eas.push`

- `org.elasticsearch.bootstrap.Elasticsearch start -p /var/run/bm-elasticsearch.pid`

- `net.bluemind.xmpp.server.launcher.tigase`

- `net.bluemind.lmtp.id1`

- `net.bluemind.ysnp.ysnp`

- `net.bluemind.application.launcher.coreLauncher`

- `net.bluemind.hornetq.mqsrv`

- `net.bluemind.webmodules.launcher.webLauncher`

- `net.bluemind.locator.app`

- `net.bluemind.node.server.nodelauncher`

- `net.bluemind.tika.server.tika`

- `net.bluemind.proxy.http.launcher.hpslauncher`


The standard processes BlueMind uses include:

- postgresql
- postfix
- nginx
- bm-php-fpm
- cyrus (imapd et pop3d)


### Using SNMP

BlueMind does not provide SNMP probes. In order to monitor a BlueMind server with SNMP, you must therefore set up monitoring for each service mentioned above manually.

### BlueMind's monitoring scripts

To be able to monitor BlueMind services, the package *bm-checks* must be installed.

Once the package is installed, monitoring scripts become available in the directory */usr/share/bm-checks/*.

To use them, run the script bash as you would normally, using cron for instance.

Each script returns a code depending on the status of the BlueMind service:

- 0 (zero) if the service is running properly
- 1 (one) if an error has been detected


If an error is detected, a message is returned on the standard output.

## Log monitoring

The BlueMind components log files can be retrieved in the directory "`/var/log"`:

- `/var/log/bm/`
- `/var/log/bm-eas/`
- `/var/log/bm-elasticsearch/`
- `/var/log/bm-hps/`
- `/var/log/bm-mapi/`
- `/var/log/bm-lmtpd/`
- `/var/log/bm-locator/`
- `/var/log/bm-mq/`
- `/var/log/bm-node/`
- `/var/log/bm-tika/`
- `/var/log/bm-webserver/`
- `/var/log/bm-webmail/`
- `/var/log/bm-xmpp/`
- `/var/log/bm-ysnp/`


To monitor other components the following locations can be used:

- `/var/log/mail.err`
- `/var/log/mail.info`
- `/var/log/mail.log`
- `/var/log/mail.warn`
- `/var/log/nginx/`
- `/var/log/bm-php5-fpm.log`
- `/var/log/postgresql/`


## Script-based control

BlueMind uses standard system scripts to start and stop services.

The command "`bmctl restart"` restarts all BlueMind services.

## Script-based operations

As mentioned in the sections on integrating BlueMind with third-party applications, BlueMind can be fully script-controlled.

From client APIs (in PHP and Java), you can perform any operation on BlueMind, such as create or modify users, access calendars, add events, etc. 


