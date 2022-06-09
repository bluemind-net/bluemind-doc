---
title: "Automatic Memory Adjustment"
confluence_id: 57771328
position: 58
---
# Automatic Memory Adjustment


## Introduction

Default memory allocation for Java components is readjusted automatically when BlueMind starts-up.


## How memory allocation works

A program "*/usr/share/bm-pimp/bm-pimp"* runs before the "i*nit bluemind"* scripts and reconfigures the components.

On start-up, this program displays the following outputs:


```
root@prec:~/bm-pimp# ./bm-pimp
newrelic support is not enabled
2014-06-12 20:16:42,789 [main] n.b.p.PimpMyRam INFO - 2176MB is allocated for all heaps.
2014-06-12 20:16:42,791 [main] n.b.p.PimpMyRam INFO - 93% of spare memory will be allocated to java components
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - Total from JMX: 8181MB
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - 3063MB will be distributed between JVMs
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO -   \* bm-core gets +459MB for a total of 715MB
2014-06-12 20:16:42,831 [main] n.b.p.PimpMyRam INFO -   \* bm-node gets +0MB for a total of 128MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-eas gets +306MB for a total of 434MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-elasticsearch gets +1225MB for a total of 1353MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-mq gets +153MB for a total of 281MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-tika gets +0MB for a total of 128MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-xmpp gets +0MB for a total of 128MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* ysnp gets +0MB for a total of 128MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-lmtpd gets +153MB for a total of 409MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-milter gets +153MB for a total of 409MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-dav gets +0MB for a total of 128MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-locator gets +0MB for a total of 128MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-hps gets +153MB for a total of 281MB
```


Spare memory is calculated as follows:

> Usable memory is calculated by subtracting 4Gb to total machine memory.
> 
> 60% of the resulting usable memory is then distributed between Java components. This portion is called *spare memory*.
> 
> From BlueMind version 3.0.10, usable memory is calculated by subtracting 5Gb to total machine memory.
> 
> *Spare memory* is then 50% of usable memory.
> 
> In the previous example, (based on version 3.0.9) *spare memory* is then 3063Mb:
> 
> 
> 
> ```
> 2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - 3063MB will be distributed between JVMs
> ```
> 
> 


Redistribution is done in a rules files "*rules.json"*. Default rules contained in the "*rules.json"* file can be overloaded by the administrator.

## Configuration

To customize memory allocation rules on BlueMind start-up, you need to create a file "*/etc/bm/local/rules.json" *in which you specify product-specific rules.

Example of a "*rules.json"* file:*


*


```
[
	{
		"product":"bm-core",
		"defaultHeap":256,
		"defaultDirect":256,
		"sparePercent":15
	},
	{
		"product":"bm-node",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":0
	},
	{
		"product":"bm-eas",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":10
	},
	{
		"product":"bm-mapi",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":8
	},
	{
		"product":"bm-elasticsearch",
		"defaultHeap":128,
		"defaultDirect":128,
		"sparePercent":40
	}
]
```


In this example:

- bm-core gets 256Mb + 15% of *spare memory*, i.e. 459Mb:


```
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO -   \* bm-core gets +459MB for a total of 715MB
```


- bm-node will not be increased and will always get 128Mb, regardless of available memory.

- elasticsearch gets 128 + 40% of *spare memory*.


At the end of execution, bm-pimp writes a file "*/etc/bm/default/&lt;produit>.ini"* with the new value for each product.

This file's content can be overloaded locally via the file "*/etc/bm/local/&lt;produit>.ini".*

## Logs

Logback configuration for each component is automatically extracted and saved in the file "*/etc/bm/default/&lt;composant>.log.xml"* on component start-up.

This configuration can be overloaded (e.g. to be sent to a logstash / graylog2) by modifying a copy of this file in the folder "*/etc/bm/local/&lt;composant>.log.xml".*


