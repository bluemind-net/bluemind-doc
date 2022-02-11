---
title: "calDav/cardDav Server Administration"
confluence_id: 79863364
position: 60
---
# calDav/cardDav Server Administration


 


# Adding DNS SRV records

## Calendar (calDav)

The DNS domain configuration must be modified to allow the external network to recognize the BlueMind server *bm.mydomain.com* as the calDav server for the domain *mydomain.com*.

The following SRV records must be added:


| Key | Example |
| --- | --- |
| `_caldavs._tcp` | 

```
\_caldavs.\_tcp 86400 IN SRV 0 1 443 server.example.com
```

 |


## Contacts (cardDav)

Similarly as for Calendar, the domain's DNS configuration must be modified to allow the external server to recognize the BlueMind server *bm.mydomain.com* as the cardDav server for the domain *mydomain.com*.

The following SRV records must be added:


| Clé | Exemple |
| --- | --- |
| `_carddavs._tcp` | 

```
\_carddavs.\_tcp 86400 IN SRV 0 1 443 bm.mydomain.com
```

 |


 

 

