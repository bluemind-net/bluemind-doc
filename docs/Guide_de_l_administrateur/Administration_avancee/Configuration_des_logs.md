---
title: "Configuration des logs"
confluence_id: 57771798
sidebar_position: 66
---
# Configuration des logs


## Présentation

BlueMind conserve des journaux pour chaque type d'application et d'utilisation.


:::info

Il est important de fournir l'espace disque suffisant afin de pouvoir stocker les journaux et leurs archives.

La saturation de cet espace bloque l'enregistrement des nouvelles informations dans les fichiers journaux et peut provoquer un ralentissement, voire un blocage des services.

:::


On distingue 3 types de fichiers journaux :

- les journaux systèmes, gérés par le mécanisme de gestion des journaux systèmes ([rsyslog](http://www.rsyslog.com/) + [logrotate](https://linux.die.net/man/8/logrotate))
- les journaux des services Java de BlueMind, gérés par [LogBack](https://logback.qos.ch/)


:::info

Heures des traces

Les traces générées par Java dans ces fichiers sont à l'heure GMT.

Ainsi, en France, sur le fuseau horaire Europe/Paris, les heures sont décalées d'1h en hiver et 2h en été. Pour rechercher des événements qui se sont produits à 15h il faudra rechercher :

- à 14h de fin Octobre à fin Mars
- à 13h de fin Mars à fin Octobre


:::

- les journaux internes à un service, gérés via la configuration de ce service


La durée de conservation dépend du paramétrage de ces mécanismes de gestion des journaux. Il est possible de modifier leur configuration pour obtenir la durée de rétention souhaitée.

## Configuration LogBack

Les fichiers de configuration par défaut se trouvent dans le répertoire `/usr/share/bm-conf/logs/ :`

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


Pour effectuer des modifications, copier le fichier souhaité dans `/etc/bm/local` et modifier la copie.

Exemple de configuration :


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


L'exemple ci-dessus, concernant le fichier de log principal core.log permet de conserver 20 fichiers de logs de 60Mo maximum chacun.

Pour plus d'information sur la configuration, vous pouvez consulter le site [Log4j](https://logging.apache.org/log4j) ou encore cette documentation : [https://logback.qos.ch/manual/appenders.html#RollingFileAppender](https://logback.qos.ch/manual/appenders.html#RollingFileAppender)


