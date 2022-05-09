---
title: "Administration du serveur XMPP"
confluence_id: 57771795
sidebar_position: 62
---
# Administration du serveur XMPP


## Présentation

Le serveur XMPP est conçu autour du [serveur XMPP Tigase](http://www.tigase.org/). La plupart des développements apportés sont des plugins autour de Tigase pour l'intégrer avec la solution BlueMind.


## Installation

Le package *bm-xmpp* permet d'installer complètement le serveur XMPP BlueMind.

### Intégration aux services BlueMind

Les fonctionnalités suivantes sont ajoutés à BlueMind par le paquet *bm-xmpp* :

- authentification intégrée avec *bm-core*
- serveur XMPP pour tous les domaines supervisés par BlueMind
- support des informations de contact par vCard et avatars à partir des données du carnet d'adresses BlueMind
- l'adresse email par défaut des utilisateurs correspond à leurs identifiants jabber


### Dépendances entre services

*bm-xmpp* dépend des services BlueMind suivants :

- *bm-locator* pour localiser les différents services BlueMind
- *bm-mq* pour maintenir à jour une liste des domaines supervisés par BlueMind
- *bm-core* pour l'authentification et la génération de vCard
- *bm-elasticsearch* pour l'archivage et la recherche des conversations


### Activation de la messagerie instantanée

Pour activer le service de messagerie instantanée, se connecter à BlueMind en tant qu'admin0 et :

- se rendre dans Gestion du système > Serveurs de l'application
- choisir le serveur > onglet "Rôles du serveur"
- cocher "Serveur d'indexation pour la messagerie instantanée et Serveur XMPP"
- cliquer sur «Enregistrer»


Ensuite, revenir à l'accueil de la console d'administration puis :

- se rendre dans Gestion du système > Domaines supervisés
- choisir le domaine concerné
- dans l'onglet "Service BM" : assigner le serveur XMPP
- dans l'onglet messagerie instantanée : définir les accès
- cliquer sur «Enregistrer»


Enfin, pour que les utilisateurs aient accès à la messagerie instantanée, il est nécessaire de leur attribuer le rôle correspondant à l'application :

- soit via la gestion de la fiche utilisateur > onglet Général
- soit via la gestion des rôles du groupe > onglet Rôles


Pour en savoir plus sur l'activation de ce rôle, consultez la page dédiée : [Les rôles : droits d'accès et d'administration](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/Les_rôles_droits_d_accès_et_d_administration/)

## Changement du certificat SSL

Les certificats SSL utilisés sont auto-générés par *bm-xmpp* quand un nouveau domaine est utilisé. En tant que certificats auto-signés, ils doivent être remplacés par des certificats valides.

Pour remplacer le certificat d'un domaine, il suffit de remplacer les fichiers correspondants dans `/usr/share/bm-xmpp/certs/`.

Le fichier du certificat doit contenir dans l'ordre : le certificat, la clé privée, et les certificat de la CA suivi de la chaine jusqu'au root si besoin.

## Connexion du serveur XMPP vers internet

En permettant la connexion du serveur XMPP vers Internet, le serveur devient en mesure de se connecter à d'autres serveurs XMPP ou de permettre à des utilisateurs externes de se connecter au serveur XMPP BlueMind. Les utilisateurs BlueMind peuvent alors ajouter des contacts extérieurs à BlueMind dans leur liste de contacts de messagerie instantanée (affichée dans  le "roaster").

### Localiser une adresse DNS accessible depuis Internet

Par exemple, dans le cas où le serveur XMPP possède une adresse DNS *xmpp.mydomain.com*, ce nom DNS doit être résolue par l'extérieur et pas seulement par le réseau interne.

### Ports de communication

Les ports suivants doivent être accessibles depuis l'extérieur sur le serveur *xmpp.mydomain.com (voir aussi [Les services](/Guide_de_l_administrateur/Présentation_du_produit/Les_services/))* :

- 5222 du client vers le serveur pour les communications client-serveur
- 5269, utilisé pour la communication entre serveurs


Si *bm-xmpp* n'est pas installé sur le serveur portant le nom DNS *xmpp.mydomain.com* (par exemple dans le cas d'un proxy), les flux de ces ports doivent être redirigés vers le serveur hébergeant *bm-xmpp*.

### Ajout d'enregistrements DNS de type SRV

La configuration DNS du domaine mydomain.com doit être modifiée pour permettre au réseau externe de reconnaître le serveur *xmpp.mydomain.com* comme serveur XMPP du domaine *mydomain.com*.

Les enregistrements de type SRV à ajouter sont les suivants :

| Clé | Exemple | Description |
| --- | --- | --- |
| 
```
\_xmpp-client.\_tcp.DOMAIN.
```
 | 
```
\_xmpp-client.\_tcp.mydomain.com.  86400  IN  SRV  5 0 5222  xmpp.mydomain.com
```
 | Communications client-serveur |
| 
```
\_xmpp-server.\_tcp.DOMAIN.
```
 | 
```
\_xmpp-server.\_tcp.mydomain.com.  86400  IN  SRV  5 0 5269  xmpp.mydomain.com
```
 | Communications serveur-serveur |

### Vérification des enregistrements DNS

Il est possible d'utiliser l'outil en ligne de commande *dig* pour vérifier les enregistrements DNS. Par exemple, pour savoir quel serveur utiliser pour le domaine *gmail.com* :

```
root@prec:~# dig SRV \_xmpp-client.\_tcp.gmail.com

; <<>> DiG 9.8.1-P1 <<>> SRV \_xmpp-client.\_tcp.gmail.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 56538
;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 10

;; QUESTION SECTION:
;\_xmpp-client.\_tcp.gmail.com.	IN	SRV

;; ANSWER SECTION:
\_xmpp-client.\_tcp.gmail.com. 5	IN	SRV	5 0 5222 xmpp.l.google.com.
\_xmpp-client.\_tcp.gmail.com. 5	IN	SRV	20 0 5222 alt1.xmpp.l.google.com.
\_xmpp-client.\_tcp.gmail.com. 5	IN	SRV	20 0 5222 alt2.xmpp.l.google.com.
\_xmpp-client.\_tcp.gmail.com. 5	IN	SRV	20 0 5222 alt3.xmpp.l.google.com.
\_xmpp-client.\_tcp.gmail.com. 5	IN	SRV	20 0 5222 alt4.xmpp.l.google.com.

;; ADDITIONAL SECTION:
xmpp.l.google.com.	5	IN	A	74.125.132.125
xmpp.l.google.com.	5	IN	AAAA	2a00:1450:400c:c06::7d
alt1.xmpp.l.google.com.	5	IN	A	173.194.70.125
alt1.xmpp.l.google.com.	5	IN	AAAA	2a00:1450:4001:c02::7d
alt2.xmpp.l.google.com.	5	IN	A	173.194.69.125
alt2.xmpp.l.google.com.	5	IN	AAAA	2a00:1450:4008:c01::7d
alt3.xmpp.l.google.com.	5	IN	A	74.125.135.125
alt3.xmpp.l.google.com.	5	IN	AAAA	2404:6800:4001:c01::7d
alt4.xmpp.l.google.com.	5	IN	A	74.125.128.125
alt4.xmpp.l.google.com.	5	IN	AAAA	2404:6800:4005:c00::7d

;; Query time: 572 msec
;; SERVER: 172.16.45.2#53(172.16.45.2)
;; WHEN: Tue Sep  3 01:28:26 2013
;; MSG SIZE  rcvd: 470
```


