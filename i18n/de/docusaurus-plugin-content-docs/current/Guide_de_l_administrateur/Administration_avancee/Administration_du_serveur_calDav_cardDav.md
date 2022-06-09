---
title: "Verwaltung des calDav/cardDav-Servers"
confluence_id: 57771794
position: 60
---
# Verwaltung des calDav/cardDav-Servers


 

 


## Hinzufügen von DNS-Einträgen vom Typ SRV

### Calendar (calDav)

Die DNS-Konfiguration der Domain muss geändert werden, damit das externe Netzwerk den BlueMind-Server *bm.mydomain.com* als calDav-Server für die Domain *mydomain.com* erkennen kann.

Die folgenden Einträge vom Typ VRS sind hinzuzufügen:

| Schlüssel | Beispiel |
| --- | --- |
| 
`_caldavs._tcp`
 | 

```
\_caldavs.\_tcp 86400 IN SRV 0 1 443 server.example.com
```

 |

### Contacts (cardDav)

Wie bei Calendar muss die DNS-Konfiguration der Domain geändert werden, damit das externe Netzwerk den BlueMind-Server *bm.mydomain.com* als carDav-Server für die Domain *mydomain.com* erkennen kann.

Die folgenden Einträge vom Typ VRS sind hinzuzufügen:

| Schlüssel | Beispiel |
| --- | --- |
| 
`_carddavs._tcp`
 | 

```
\_carddavs.\_tcp 86400 IN SRV 0 1 443 bm.mydomain.com
```

 |

 

 


 

 

 

 

 

 

 

 

 

 

