---
title: "BlueMind Ports"
confluence_id: 57771265
position: 50
---
# BlueMind Ports


## Incoming ports

| Required/Optional | Port Number | TLS/SSL/PLAIN | Description |
| --- | --- | --- | --- |
| **required** | 25 | PLAINTLS | 
Email delivery
 | 
Supports SMTP authentication
 |
| optional | 80 | PLAIN | HTTP redirect to HTTPs port 443 |
| optional | 110 | PLAIN/TLS | POP access for thick clients - not recommended |
| optional | 143 | PLAIN/TLS | IMAP access for thick clients |
| **required** | 443 | SSL | Access to BlueMind |
| optional | 465 | SSL | 
Sends emails from thick clients
 | 
SMTP authentication required
 | 
Prefer this port over port 25 for thick client configurations
 |
| optional | 587 | TLS | 
Sends emails from thick clients
 | 
SMTP authentication required
 | 
Prefer this port over port 25 for thick client configurations
 |
| optional | 993 | SSL | IMAP access for thick clients |
| optional | 995 | SSL | POP access for thick clients - not recommended |
| optional | 5222 | PLAIN/TLS | IM access for thick clients |
| optional | 5223 | SSL | IM access for thick clients |
| optional | 5269 | TLS | XMPP server-to-server communications for interconnection with XMPP from other domains |

When SSL is mentioned, we refer to the TLS protocol, without cleartext communication allowed.

TLS ports are using [Opportunistic TLS](https://en.wikipedia.org/wiki/Opportunistic_TLS).

## Internal ports

| Port number | Service |
| --- | --- |
| 
24
 | cyrus LMTP |
| 1110 | cyrus pop |
| 1143 | cyrus imap |
| 2000 | cyrus sieve |
| 2400 | BM LMTP |
| 2500 | BM milter |
| 2501 | core IMAP replication |
| 2502 | cyrus IMAP replication |
| 5001 | BM mapi |
| 5280, 5290 | BM XMPP |
| 5432 | postgresql |
| 5701:5715 | hazelcast |
| 8021, 8022 | BM node |
| 8079 | BM HPS |
| 8080 | BM webserver |
| 8082 | BM push |
| 8084 | BM locator |
| 8087 | BM Tika |
| 8086 | BM influxdb |
| 8090 | BM core |
| 8091 | BM SDS |
| 9200, 9300 | BM Elasticsearch |

Enregistrer

