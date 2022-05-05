---
title: "Administration du serveur calDav/cardDav"
confluence_id: 57771794
position: 60
---
# Administration du serveur calDav/cardDav


 

 


## Ajout d'enregistrements DNS de type SRV

### Calendar (calDav)

La configuration DNS du domaine doit être modifiée pour permettre au réseau externe de reconnaître le serveur BlueMind *bm.mydomain.com* comme serveur calDav du domaine *mydomain.com*.

Les enregistrements de type SRV à ajouter sont les suivants :

| Clé | Exemple |
| --- | --- |
| 
`_caldavs._tcp`
 | 

```
\_caldavs.\_tcp 86400 IN SRV 0 1 443 server.example.com
```

 |

### Contacts (cardDav)

De même que pour Calendar, la configuration DNS du domaine doit être modifiée pour permettre au réseau externe de reconnaître le serveur BlueMind *bm.mydomain.com* comme serveur carDav du domaine *mydomain.com*.

Les enregistrements de type SRV à ajouter sont les suivants :

| Clé | Exemple |
| --- | --- |
| 
`_carddavs._tcp`
 | 

```
\_carddavs.\_tcp 86400 IN SRV 0 1 443 bm.mydomain.com
```

 |

 

 


 

 

 

 

 

 

 

 

 

 

