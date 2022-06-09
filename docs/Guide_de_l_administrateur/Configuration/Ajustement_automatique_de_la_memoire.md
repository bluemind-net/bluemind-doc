---
title: "Ajustement automatique de la mémoire"
confluence_id: 57771328
sidebar_position: 58
---
# Ajustement automatique de la mémoire


## Présentation

La mémoire par défaut des composants java est réajustée automatiquement lors du démarrage de BlueMind.


## Fonctionnement

Un programme `/usr/share/bm-pimp/bm-pimp` est lancé avant les scripts d'init bluemind et viens reparamétrer les composants.

Lors de son lancement, il affiche les sorties suivantes :


```
root@prec:~# /etc/init.d/bm-pimp restart
2014-06-12 20:16:42,789 [main] n.b.p.PimpMyRam INFO - 2176MB is allocated for all heaps.
2014-06-12 20:16:42,791 [main] n.b.p.PimpMyRam INFO - 93% of spare memory will be allocated to java components
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - Total from JMX: 8181MB
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - 3063MB will be distributed between JVMs
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO -   \* bm-core gets +459MB for a total of 715MB
2014-06-12 20:16:42,831 [main] n.b.p.PimpMyRam INFO -   \* bm-node gets +0MB for a total of 128MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-eas gets +306MB for a total of 434MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-mapi gets +245MB for a total of 373MB
2014-06-12 20:16:42,832 [main] n.b.p.PimpMyRam INFO -   \* bm-elasticsearch gets +1225MB for a total of 1353MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-mq gets +153MB for a total of 281MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-tika gets +0MB for a total of 128MB
2014-06-12 20:16:42,833 [main] n.b.p.PimpMyRam INFO -   \* bm-xmpp gets +0MB for a total of 128MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-ysnp gets +0MB for a total of 128MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-lmtpd gets +153MB for a total of 409MB
2014-06-12 20:16:42,834 [main] n.b.p.PimpMyRam INFO -   \* bm-milter gets +153MB for a total of 409MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-dav gets +0MB for a total of 128MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-locator gets +0MB for a total of 128MB
2014-06-12 20:16:42,835 [main] n.b.p.PimpMyRam INFO -   \* bm-hps gets +153MB for a total of 281MB
```


Le calcul effectué est le suivant :

> La mémoire utilisable est calculée en retirant 5Go à la mémoire totale de la machine.
> 
> 50% de cette mémoire utilisable est alors distribuée entre les différents composants Java. Cette portion est appelé le *spare*.
> 
> Dans notre exemple précédent le *spare* est donc de 3063Mo :
> 
> 
> 
> ```
> 2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO - 3063MB will be distributed between JVMs
> ```
> 
> 


La redistribution se fait à partir d'un fichier de règles, *rules.json*. Les règles que contient le fichier *rules.json* par défaut peuvent être surchargées par l'administrateur.

## Paramétrage

Afin de personnaliser les règles d'attribution de la mémoire a démarrage de BlueMind, créer un fichier */etc/bm/local/rules.json* afin d'y inscrire les règles à appliquer par produit.

Exemple de fichier rules.json :*


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


Dans cet exemple :

- bm-core va ici obtenir 256Mo + 15% du *spare*, soit 459Mo :


```
2014-06-12 20:16:42,792 [main] n.b.p.PimpMyRam INFO -   \* bm-core gets +459MB for a total of 715MB
```


- bm-node ne sera pas augmenté et aura toujours 128Mo, quelle que soit la mémoire disponible.

- elasticsearch obtiendra 128 + 40% du *spare*.


A la fin de son exécution, bm-pimp écrit pour chaque produit un fichier */etc/bm/default/&lt;produit>.ini* avec la nouvelle valeur.

Le contenu de ce fichier peut être surchargé localement via un */etc/bm/local/&lt;produit>.ini.*

## Logs

La configuration de logback pour chaque composant est extraite et enregistrée automatiquement dans le fichier */usr/share/bm-conf/logs/&lt;composant>.log.xml* au démarrage des composants.

Cette configuration peut être surchargée (pour les envoyer vers un logstash / graylog2 par exemple) en modifiant une copie de ce fichier dans le dossier */etc/bm/local/&lt;composant>.log.xml*


