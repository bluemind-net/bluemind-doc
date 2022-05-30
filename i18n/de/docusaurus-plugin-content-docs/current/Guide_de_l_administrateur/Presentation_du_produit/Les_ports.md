---
title: "Ports"
confluence_id: 57771265
position: 50
---
# Ports


## Eingangsport

| Bedarf | Port-Nummer | TLS/SSL/PLAIN | Beschreibung |
| --- | --- | --- | --- |
| **obligatorisch** | 25 | PLAINTLS | 
E-Mail-Empfang
 | 
Unterstützt SMTP-Authentifizierung
 |
| optional | 80 | PLAIN | HTTP-Weiterleitung auf HTTPs Port 443 |
| optional | 110 | PLAIN/TLS | POP-Zugang für Fat Clients - nicht empfohlen |
| optional | 143 | PLAIN/TLS | IMAP-Zugang für Fat Clients |
| **obligatorisch** | 443 | SSL | Zugriff auf BlueMind |
| optional | 465 | SSL | 
Versenden von E-Mails von Fat Clients

SMTP-Authentifizierung erforderlich

Für die Fat-Client-Konfiguration ist es besser, diesen Port anstelle von 25 zu verwenden

![](../../attachments/57770017/66096241.png) Ab BlueMind 4.4 verwendet der Port mindestens das Protokoll TLS v1.2
 |
| optional | 587 | TLS | 
Versenden von E-Mails von Fat Clients

SMTP-Authentifizierung erforderlich

Für die Fat-Client-Konfiguration ist es besser, diesen Port anstelle von 25 zu verwenden

![](../../attachments/57770017/66096241.png) Ab BlueMind 4.4 verwendet der Port mindestens das Protokoll TLS v1.2
 |
| optional | 993 | SSL | IMAP-Zugang für Fat Clients |
| optional | 995 | SSL | POP-Zugang für Fat Clients - nicht empfohlen |
| optional | 5222 | PLAIN/TLS | IM-Zugang für Fat Clients |
| optional | 5223 | SSL | IM-Zugang für Fat Clients |
| optional | 5269 | TLS | XMPP-Interserver-Dialog zur Verbindung mit XMPP-Servern in anderen Domänen |


:::info

Wenn von SSL die Rede ist, beziehen wir uns ausschließlich auf TLS, ohne die Möglichkeit einer unverschlüsselten Kommunikation.

TLS-Ports beziehen sich auf das [opportunistische TLS-Protokoll](https://en.wikipedia.org/wiki/Opportunistic_TLS).

:::


## Interne Ports

| Port-Nummer | Dienst |
| --- | --- |
| 
24
 | cyrus LMTP |
| 1110 | cyrus pop |
| 1143 | cyrus imap |
| 2000 | cyrus sieve |
| 2400 | BM LMTP |
| 2500 | BM milter |
| 2501 | IMAP-Kernreplikation |
| 2502 | IMAP-Cyrus-Replikation |
| 5001 | BM mapi |
| 5280, 5290 | BM XMPP |
| 5432 | postgresql |
| 5701:5715 | hazelcast |
| 8021, 8022 | BM-Knoten |
| 8079 | BM HPS |
| 8080 | BM-Webserver |
| 8082 | BM-Push |
| 8084 | BM Locator |
| 8087 | BM Tika |
| 8090 | BM Kern |
| 9083, 9086, 9090, 9099 | BM influxdb |
| 9200, 9300 | BM Elasticsearch |

