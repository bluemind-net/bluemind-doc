---
title: "Log Configuration"
confluence_id: 57771798
position: 66
---
# Log Configuration


## Introduction

BlueMind keeps logs for each type of application and usage.


:::info

It is important to have enough diskspace for logs and their archives.

If the diskspace gets too full, new information will no longer be saved which may cause the server to slow down, and possibly services to stop.

:::


There are 3 types of log files:

- system logs, which are managed by system log management mechanisms ([rsyslog](http://www.rsyslog.com/) + [logrotate](https://linux.die.net/man/8/logrotate))
- logs for BlueMind's Java services, managed by [LogBack](https://logback.qos.ch/)


:::info

Trace times

The traces generated by Java in these files are on GMT.

I.e. in France, in the Europe/Paris time zone, the time is GMT +1 in the winter and GMT +2 in the summer. To find events that took place at 3pm, you will need to search:

- at 14.00 from late October to late March
- at 13.00 from late March to late October


:::

- internal service logs, managed via the service's configuration


The duration for which the logs are kept depends on the logs management mechanisms. Their configuration can be modified to the desired duration.

## LogBack configuration

Default configuration files are located in the directory `/usr/share/bm-conf/logs/:`

- bm-core-audit.log.xml
- bm-core.log.xml
- bm-eas.log.xml
- bm-hps.log.xml
- bm-ips.log.xml
- bm-lmtpd.log.xml
- bm-locator.log.xml
- bm-milter.log.xml
- bm-node.log.xml
- bm-pimp.log.xml
- bm-tika.log.xml
- bm-webserver.log.xml
- bm-xmpp.log.xml
- bm-ysnp.log.xml


To edit them, copy the file to `/etc/bm/local` and edit the copy.

Example of configuration:


```
<appender name="R" class="ch.qos.logback.core.rolling.RollingFileAppender">
  <!--See also http://logback.qos.ch/manual/appenders.html#RollingFileAppender -->
  <File>/var/log/bm/core.log</File>
  <encoder>
    <pattern>%d [%thread] %c{1} %p - %m\n</pattern>
  </encoder>
  <rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
    <maxIndex>20</maxIndex>
    <FileNamePattern>/var/log/bm/core.log.%i.gz</FileNamePattern>
  </rollingPolicy>
  <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
    <MaxFileSize>60000KB</MaxFileSize>
  </triggeringPolicy>
</appender
```


The example above, about the mail log file core.log, is used to keep 20 log files of 60MB each maximum.

For more information about configuration, please visit the [Log4j](https://logging.apache.org/log4j) website or this documentation: [https://logback.qos.ch/manual/appenders.html#RollingFileAppender](https://logback.qos.ch/manual/appenders.html#RollingFileAppender)


