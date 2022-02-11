---
title: "Metrics references"
confluence_id: 79863297
position: 64
---
# Metrics references


# Introduction

BlueMind's Tick package is used to monitor large amounts of data (*metrics*). Some monitored data is raw, but other data is the result of pre-processing to provide more relevance make interpretation and analysis easier.

Every metric has its own tree structure which can contain:

- **datalocation**: server name
- **host**: host name or IP 
- **meterType**: data type
  - *gauge*: instant measurement
  - *counter*: incremental counter
  - *distsum*: counter-amount data pair e.g.:
    - bm-lmtpd.emailSize = (number of emails, total size of emails)
    - bm-lmtpd.emailRecipients = (number of emails, number of recipients)
  - *timer*: same as distsum but with the amount always expressed in nanoseconds
- **status**: depending on the type of data, this status may be ok/failed (e.g. request successful/failed), success/failure (e.g. authentication successful/failed), etc.


# Common data

As a rule, metrics are grouped by component.

#### JVM

There are JVM metrics for every JVM component:

- **bm-&lt;composant>.hprof**: the number of hprof files on the server can be used as an indication of a crash
- **bm-&lt;composant>.jvm.***: all the jvm information for this component (current or maximum memory usage, etc.)


#### Heartbeat

In each component with interactions with the core, you will find the following metrics which are used to make sure that the component is receiving the core's health data:


| Metric Name | Type | Content | Additional Information |
| --- | --- | --- | --- |
| heartbeat.receiver.age | Gauge | age of the last heartbeat received | The time between 2 heartbeats.The core is supposed to send its health information every 4 seconds. Durations exceeding this, or exceeding 8 seconds, may indicate some issue. |
| heartbeat.receiver.failures | Counter | number of failed heartbeats |  |
| heartbeat.receiver.latency | Gauge | heartbeat delivery time | Time between the heartbeat being sent by the core and it being received by the component. |
| heartbeat.receiver.latencyMax | Gauge | maximum heartbeat delivery time |  |
| heartbeat.receiver.received | Counter | number of successful heartbeats |  |


#### Hazelcast

The servers members of the hazelcast cluster comprise the following metric:


| Metric Name | Type | Content | Additional Information |
| --- | --- | --- | --- |
| cluster.members | Gauge |  | The value of this metric must be '3' |


# Metrics


| Metric Name | Type | Content | Additional Information |
| --- | --- | --- | --- |
| agent.metricsGathered | Counter | number of metrics collected by the agent | This metric is mostly useful for checking whether the agent is working properly: no data means that the agent isn't collecting anything and therefore that it is no longer working. |
| agent.vmware* |  | agent host server data | The agent is enabled only if *vmware tools* are detected on the BlueMind host servers. In this case, the "*vSphere Guest SDK*" metrics are extracted and historized.These metrics are used to diagnose issues with BlueMind's virtualization on vmware. |
| bluemind.cluster |  |  |  |
| bluemind.cluster.partitions |  |  |  |
| bm-core | Main BlueMind Engine |
| callsCount | Counter | number of calls received by the core |  |
| dirVersion | Gauge |  |  |
| directory.cluster.events | Counter |  |  |
| handlingDuration | Timer | request handling time |  |
| heartbeat.broadcast | Counter |  |  |
| heartbeat.maxPeriod | Gauge |  |  |
| heartbeat.period | Gauge |  |  |
| bm-eas | Mobile Connection Service |
| executionTime | Timer |  |  |
| responseSize | DistSum |  |  |
| bm-hps | Authentication Service |
| authCount | Counter | number of connections requests to BlueMind | * success: successful connection
* failed: failed connection (wrong username and/or password)
 |
| ftlTemplates.requests | Counter | number of page requests |  |
| requestsCount | Counter | number of hps requests | * kind: maintenance - maintenance page displays
* kind: protected - protected pages displays

Used, among other things, to check the number of times the maintenance page has been displayed. Too many "maintenance" requests may indicate an issue. |
| staticFile.requests | Counter | number of static page requests | e.g.: login page |
| upstreamRequestSize | DistSum |  |  |
| upstreamRequestTime | Timer | request handling duration |  |
| upstreamRequestsCount | Counter | number of requests |  |
| bm-lmtpd | Email Delivery Service |
| activeConnections | Gauge | number of active connections |  |
| connectionCount | Counter |  |  |
| deliveries | Counter |  |  |
| emailRecipients | DistSum | number of recipients per email |  |
| emailSize | DistSum | size of messages |  |
| sessionDuration | Timer |  |  |
| traffic.transportLatency | Timer |  |  |
| bm-locator | Service Localization |
| executionTime | Timer | request execution time |  |
| requestsCount | Counter | number of requests received by the service | * origin: component that makes the request
* statusCode: http return code
 |
| bm-milter | Analysis and Modification of Emails at SMTP Level |
| connectionsCount | Counter |  |  |
| sessionDuration | Timer |  |  |
| traffic.class | Counter |  |  |
| traffic.size | Counter |  |  |
| bm-webserver | Web Application Server |
| appCache.requestTime | Timer |  |  |
| appCache.requests | Counter |  |  |
| ftlTemplates.requests | Counter | number of display requests generated by the webserver |  |
| staticFile.requests | Counter | number of static page display requests |  |
| bm-xmpp | Instant Messaging Service |
| packetsCount | Counter | number of packets sent by the service | used to assess messaging service usage and whether it is working properly or has stopped |
| bm-ysnp | Data Validation Service |
| authCount | Counter | number of requests handled | * ok statuses: confirmed requests (e.g. authentications accepted for a username/password entered by a user)
* failed statuses: rejected validations (e.g. failed authentications due to a wrong password)
 |
| Other |  |
| cpu |  | processor usage data | used to monitor usage and processor distribution |
| disk |  | disk handling space | used to monitor disk usage space used/free/total/etc. by disk, partition, path, etc. |
| diskio |  | number of bites written/read in real time | used to see whether the disk is working properly or excessively |
| elasticsearch* |  | ElasticSearch data | for more information and details about ES metrics, please refer to the dedicated documentation &lt;https://github.com/influxdata/telegraf/tree/master/plugins/inputs/elasticsearch> |
| imapd.process |  |  |  |
| influxdb* |  | metrics storage database data |  |
| kapacitor* |  | tool-specific data |  |
| kernel |  |  |  |
| kernel\_vmstat |  |  |  |
| mem |  |  |  |
| memcached |  |  |  |
| net |  |  |  |
| netstat |  |  |  |
| nginx |  |  |  |
| phpfpm |  |  |  |
| postfix\_queue |  |  |  |
| postgresql |  | BlueMind database information |  |
| processes |  |  |  |
| swap |  |  |  |
| syslog |  |  |  |
| system |  |  |  |


