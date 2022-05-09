---
title: "Référence des métriques"
confluence_id: 57771727
sidebar_position: 64
---
# Référence des métriques


## Présentation

Le packaging Tick par BlueMind apporte la surveillance d'un grand nombre de données (appelées *métriques*). Certaines données surveillées sont brutes mais d'autres sont issues de pré-traitements afin d'offrir une plus grande pertinence et de faciliter leur interprétation et analyse.

Chaque métrique comporte une arborescence pouvant contenir :

- **datalocation** : nom du serveur
- **host** : nom ou IP de l'hôte
- **meterType** : le type de donnée
    - *gauge* : mesure instantanée
    - *counter* : compteur à incrémentation
    - *distsum* : couple de données comportant un compteur et une quantitépar exemple :
        - bm-lmtpd.emailSize = (nombre d'emails , taille totale des emails)
        - bm-lmtpd.emailRecipients = (nombre d'emails , nombre de destinataires)
    - *timer* : identique au distsum mais la quantité est ici toujours exprimée en nanosecondes
- **status** : selon le type de données il peut s'agir d'un statut ok/failed (requête aboutie/échouée par exemple), success/failure (authentification réussie/échouée par exemple), etc.


## Données communes

De façon générale, les métriques sont regroupées par composant.

##### JVM

Pour chaque composant, vous pourrez trouver les métriques concernant la JVM :

- **bm-&lt;composant>.hprof** : le nombre de fichier hprof existant sur la machine, permet de constater s'il y a eu un plantage
- **bm-&lt;composant>.jvm.*** : toutes les informations concernant la jvm pour ce composant (consommation mémoire courante, maximum, etc.)


##### Heartbeat

Dans chaque composant ayant des interactions avec le core, on retrouvera les métriques suivantes qui servent à surveiller que les données de l'état de santé (*heartbeat* - littéralement « battement de cœur ») du core sont bien reçues par le composant :

| Nom de la métrique | type | contenu | Informations complémentaires |
| --- | --- | --- | --- |
| heartbeat.receiver.age | Gauge | âge de la réception du dernier  | *heartbeat* | 
Correspond à la durée entre 2 *heartbeat*.
 | 
Le core est censé envoyer son état de santé toutes les 4 secondes, des durées supérieures, voire dépassant les 8 secondes, doivent donc alerter sur le bon état de fonctionnement de celui-ci
 |
| heartbeat.receiver.failures | Counter | nombre d'échecs de réception | 


 |
| heartbeat.receiver.latency | Gauge | durée de réception du  | *heartbeat* | durée entre l'émission du  | *heartbeat* |  par le core et la réception par le composant |
| heartbeat.receiver.latencyMax | Gauge | durée de réception maximum | 


 |
| heartbeat.receiver.received | Counter | nombre de réceptions OK | 


 |

##### Hazelcast

Les serveurs membres du cluster hazelcast comportent la métrique suivante :

| Nom de la métrique | type | contenu | Informations complémentaires |
| --- | --- | --- | --- |
| cluster.members | Gauge | 


 | la valeur de cette métrique doit être '3' |

## Les métriques

| Nom de la métrique | type | contenu | Informations complémentaires | bm-core | moteur principal de BlueMind | bm-eas | service de connexion mobile | bm-hps | service d'authentification | bm-lmtpd | service de remise des emails | bm-locator | localisation des services | bm-milter | Analyse et modification des emails au niveau SMTP | bm-webserver | serveur d'application web | bm-xmpp | service de messagerie instantanée | bm-ysnp | service de validation des données | Autres |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| agent.metricsGathered | Counter | nombre de métriques collectées par l'agent | cette métriques sert principalement à vérifier que l'agent est toujours en fonctionnement : l'absence de données indique que l'agent ne collecte plus rien, donc qu'il ne fonctionne plus |
| agent.vmware* | 


 | données concernant la machine hébergeant l'agent | 
L'agent est actif uniquement si les *vmware tools* sont détectés sur les machines hébergeant BlueMind. Dans cas les métriques du "*vSphere Guest SDK*" sont extraites et historisées.
 | 
Ces métriques permet de diagnostiquer des problèmes liés à la façon dont serait virtualisé BlueMind sur vmware.
 |
| bluemind.cluster | 


 | 


 | 


 |
| bluemind.cluster.partitions | 


 | 


 | 


 |
| callsCount | Counter | nombre d'appels reçus par le core | 


 |
| dirVersion | Gauge | 


 | 


 |
| directory.cluster.events | Counter | 


 | 


 |
| handlingDuration | Timer | durée de traitement des requêtes | 


 |
| heartbeat.broadcast | Counter | 


 | 


 |
| heartbeat.maxPeriod | Gauge | 


 | 


 |
| heartbeat.period | Gauge | 


 | 


 |
| executionTime | Timer | 


 | 


 |
| responseSize | DistSum | 


 | 


 |
| authCount | Counter | nombre de demandes de connexions à BlueMind | 
- status success : connexion réussie
- status failed : connexion échouée (mauvais identifiant et/ou mot de passe

 |
| ftlTemplates.requests | Counter | nombre de pages générées demandées | 


 |
| requestsCount | Counter | nombre de requêtes servies par hps | 
- kind : maintenance - affichage de la page de maintenance
- kind : protected - affichage d'une page protégée

 | 
Permet notamment de vérifier le nombre d'affichage effectifs de la page de maintenance. Trop de requêtes de type "maintenance" peut être le signe d'un problème.
 |
| staticFile.requests | Counter | nombre de pages statiques demandées | exemple : page de login |
| upstreamRequestSize | DistSum | taille des requêtes | 


 |
| upstreamRequestTime | Timer | durée de traitement des requêtes | 


 |
| upstreamRequestsCount | Counter | nombre de requêtes | 


 |
| activeConnections | Gauge | nombre de connexions actives | 


 |
| connectionCount | Counter | 


 | 


 |
| deliveries | Counter | 


 | 


 |
| emailRecipients | DistSum | nombre de destinataires par email | 


 |
| emailSize | DistSum | taille des emails | 


 |
| sessionDuration | Timer | durée de session | 


 |
| traffic.transportLatency | Timer | 


 | 


 |
| executionTime | Timer | temps d'exécution des requêtes | 


 |
| requestsCount | Counter | nombre de requêtes reçues par le service | 
- origin : composant ayant émis la requête
- statusCode : code retour http

 |
| connectionsCount | Counter | 


 | 


 |
| sessionDuration | Timer | 


 | 


 |
| traffic.class | Counter | 


 | 


 |
| traffic.size | Counter | 


 | 


 |
| appCache.requestTime | Timer | 


 | 


 |
| appCache.requests | Counter | 


 | 


 |
| ftlTemplates.requests | Counter | nombre de requêtes d'affichage de pages générées par le webserver | 


 |
| staticFile.requests | Counter | nombre de requêtes d'affichage de pages statiques | 


 |
| packetsCount | Counter | nombre de paquets transmis par le service | sert à voir à quel point le service de messagerie est utilisé ainsi que s'il fonctionne correctement ou a cessé de fonctionné |
| authCount | Counter | nombre de demandes traitées | 
- status ok : demandes validées (par exemple authentification acceptée pour le login/pass entré par une personne)
- statuts failed : validation rejetée (par exemple authentification échouée car mot de passe incorrect)

 |
| cpu | 


 | données d'utilisation des processeurs | permet de contrôler l'utilisation et la répartition des processeurs |
| disk | 


 | données de gestion de l'espace disque | permet de contrôler l'espace disque utilisé/libre/total/etc. par disque, partition, chemin, etc. |
| diskio | 


 | nombre d'octets écrits/lus en temps réel | permet de voir si le disque travaille correctement ou trop |
| elasticsearch* | 


 | données concernant ElasticSearch | pour plus d'informations et de détails sur les métriques ES, voir la documentation dédiée  | [https://github.com/influxdata/telegraf/tree/master/plugins/inputs/elasticsearch](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/elasticsearch) |
| imapd.process | 


 | 


 | 


 |
| influxdb* | 


 | données de la base de stockage des métriques | 


 |
| kapacitor* | 


 | données concernant l'outil lui-même | 


 |
| kernel | 


 | 


 | 


 |
| kernel_vmstat | 


 | 


 | 


 |
| mem | 


 | 


 | 


 |
| memcached | 


 | 


 | 


 |
| net | 


 | 


 | 


 |
| netstat | 


 | 


 | 


 |
| nginx | 


 | 


 | 


 |
| phpfpm | 


 | 


 | 


 |
| postfix_queue | 


 | 


 | 


 |
| postgresql | 


 | informations sur la base de données de BlueMind | 


 |
| processes | 


 | 


 | 


 |
| swap | 


 | 


 | 


 |
| syslog | 


 | 


 | 


 |
| system | 


 | 


 | 


 |


