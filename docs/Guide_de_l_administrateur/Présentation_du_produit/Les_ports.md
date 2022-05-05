---
title: "Les ports"
confluence_id: 57771265
position: 50
---
# Les ports


## Les ports entrants

| Nécessité | Numéro de port | TLS/SSL/PLAIN | Description |
| --- | --- | --- | --- |
| **obligatoire** | 25 | PLAINTLS | 
Réception des mails
 | 
Supporte l'authentification SMTP
 |
| facultatif | 80 | PLAIN | Redirection HTTP vers HTTPs port 443 |
| facultatif | 110 | PLAIN/TLS | Accès POP pour les clients lourds - déconseillé |
| facultatif | 143 | PLAIN/TLS | Accès IMAP pour les clients lourds |
| **obligatoire** | 443 | SSL | Accès à BlueMind |
| facultatif | 465 | SSL | 
Envoi des mails depuis les clients lourds

Authentification SMTP obligatoire

Il est préférable d'utiliser ce port plutôt que le 25 pour la configuration des clients lourds

![](../../attachments/57770017/66096241.png) à partir de BlueMind 4.4 le port utilise un protocole TLS v1.2 minimum
 |
| facultatif | 587 | TLS | 
Envoi des mails depuis les clients lourds

Authentification SMTP obligatoire

Il est préférable d'utiliser ce port plutôt que le 25 pour la configuration des clients lourds

![](../../attachments/57770017/66096241.png) à partir de BlueMind 4.4 le port utilise un protocole TLS v1.2 minimum
 |
| facultatif | 993 | SSL | Accès IMAP pour les clients lourds |
| facultatif | 995 | SSL | Accès POP pour les clients lourds - déconseillé |
| facultatif | 5222 | PLAIN/TLS | Accès à l'IM pour les clients lourds |
| facultatif | 5223 | SSL | Accès à l'IM pour les clients lourds |
| facultatif | 5269 | TLS | Dialogue inter-serveur XMPP pour interconnexion avec les serveurs XMPP des autres domaines |


:::info

Lorsque SSL est mentionné, nous faisons référence au protocole TLS exclusivement, sans possibilité de communication non chiffrée.

Les ports TLS font référence au protocole [TLS opportuniste](https://en.wikipedia.org/wiki/Opportunistic_TLS).

:::


## Les ports internes

| Numéro de port | Service |
| --- | --- |
| 
24
 | cyrus LMTP |
| 1110 | cyrus pop |
| 1143 | cyrus imap |
| 2000 | cyrus sieve |
| 2400 | BM LMTP |
| 2500 | BM milter |
| 2501 | replication IMAP core |
| 2502 | replication IMAP cyrus |
| 5001 | BM mapi |
| 5280, 5290 | BM XMPP |
| 5432 | postgresql |
| 5701:5715 | hazelcast |
| 8021, 8022 | BM node |
| 8079 | BM HPS |
| 8080 | BM webserver |
| 8082 | BM push |
| 8084 | BM locator |
| 8086 | BM influxdb |
| 8087 | BM Tika |
| 8090 | BM core |
| 8091 | BM SDS |
| 9200, 9300 | BM Elasticsearch |

