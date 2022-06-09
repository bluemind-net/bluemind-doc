---
title: "XMPP-Server-Verwaltung"
confluence_id: 57771795
position: 62
---
# XMPP-Server-Verwaltung


## Präsentation

Der XMPP-Server ist um den [Tigase XMPP](http://www.tigase.org/)-Server herum aufgebaut. Die meisten der eingebrachten Entwicklungen sind Plugins rund um Tigase, um ihn mit der BlueMind-Lösung zu integrieren.


## Installation

Das Paket *bm-xmpp* ermöglicht die vollständige Installation des BlueMind XMPP-Servers.

### Integration mit BlueMind-Diensten

Die folgenden Funktionen werden durch das Paket *bm-xmpp* zu BlueMind hinzugefügt:

- Integrierte Authentifizierung mit *bm-core*
- XMPP-Server für alle von BlueMind überwachten Domains
- Unterstützung von Kontaktinformationen durch vCard und Avatare aus BlueMind-Adressbuchdaten
- die Standard-E-Mail-Adresse der Benutzer stimmt mit ihren Jabber-Anmeldedaten überein


### Abhängigkeiten zwischen Diensten

*bm-xmpp* hängt von den folgenden BlueMind-Diensten ab:

- *bm-locator* zum Auffinden der verschiedenen BlueMind-Dienste
- *bm-mq*, um eine aktuelle Liste der von BlueMind überwachten Domains zu führen
- *bm-core* für Authentifizierung und vCard-Generierung
- *bm-elasticsearch* zum Archivieren und Abrufen von Konversationen


### Aktivieren von Instant Messaging

Um den Instant-Messaging-Dienst zu aktivieren, melden Sie sich bei BlueMind als admin0 an und:

- gehen Sie zu Systemadministration > Application Servers
- wählen Sie den Server > Registerkarte "Server-Rollen"
- aktivieren Sie "Indizierungsserver für Instant Messaging und XMPP-Server"
- klicken Sie auf "Speichern"


Kehren Sie dann zur Startseite der Administrationskonsole zurück:

- gehen Sie zu Systemadministration > Überwachte Domains
- wählen Sie den entsprechenden Bereich
- in der Registerkarte "BM Service": den XMPP-Server zuweisen
- in der Registerkarte Instant Messaging: die Zugänge definieren
- klicken Sie auf "Speichern"


Damit Benutzer Zugriff auf Instant Messaging haben, muss ihnen die der Anwendung entsprechende Rolle zugewiesen werden:

- entweder über die Verwaltung des Benutzerstammsatzes > Registerkarte Allgemein
- oder über die Gruppenrollenverwaltung > Registerkarte Rollen


Weitere Informationen über die Aktivierung dieser Rolle finden Sie auf der entsprechenden Seite: [Rollen: Zugriffs- und Administrationsrechte](/Guide_de_l_administrateur/Gestion_des_entites/Utilisateurs/Les_rôles_droits_d_accès_et_d_administration/)

## Ändern des SSL-Zertifikats

Die verwendeten SSL-Zertifikate werden von *bm-xmpp* automatisch generiert, wenn eine neue Domain verwendet wird. Diese selbstsignierten Zertifikate müssen durch gültige Zertifikate ersetzt werden.

Um das Zertifikat einer Domain zu ersetzen, ersetzen Sie einfach die entsprechenden Dateien in `/usr/share/bm-xmpp/certs/`.

Die Zertifikatsdatei muss in dieser Reihenfolge Folgendes enthalten: das Zertifikat, den privaten Schlüssel und die CA-Zertifikate, gefolgt von der Kette zum Root, falls erforderlich.

## Verbinden des XMPP-Servers mit dem Internet

Indem Sie dem XMPP-Server erlauben, sich mit dem Internet zu verbinden kann der Server sich mit anderen XMPP-Servern verbinden oder externen Benutzern erlauben, sich mit dem BlueMind XMPP-Server zu verbinden. BlueMind-Benutzer können dann Kontakte von außerhalb von BlueMind zu ihrer Instant-Messaging-Kontaktliste hinzufügen (die im "Roaster“ angezeigt wird).

### Suchen Sie eine aus dem Internet erreichbare DNS-Adresse

Wenn der XMPP-Server z. B. eine DNS-Adresse *xmpp.mydomain.com* hat, muss dieser DNS-Name extern und nicht nur vom internen Netzwerk aufgelöst werden.

### Kommunikationsanschlüsse

Die folgenden Ports müssen auf dem Server *xmpp.mydomain.com von außen erreichbar sein (siehe auch)[Die Dienste](/Guide_de_l_administrateur/Présentation_du_produit/Les_services/)*:

- 5222 vom Client zu Server für die Client-Server-Kommunikation
- 5269 wird für die Kommunikation zwischen Servern verwendet


Wenn *bm-xmpp* nicht auf dem Server mit dem DNS-Namen *xmpp.mydomain.com* installiert ist (z.B. im Falle eines Proxys), müssen Streams von diesen Ports auf den Server umgeleitet werden, der *bm-xmpp* hostet.

### Hinzufügen von DNS-Einträgen vom Typ SRV

Die DNS-Konfiguration der Domain mydomain.com muss geändert werden, damit das externe Netzwerk den Server *xmpp.mydomain.com* als XMPP-Server für die Domain *mydomain*.com erkennen kann.

Die folgenden Einträge vom Typ VRS sind hinzuzufügen:

| Schlüssel | Beispiel | Beschreibung |
| --- | --- | --- |
| 
```
\_xmpp-client.\_tcp.DOMAIN.
```
 | 
```
\_xmpp-client.\_tcp.mydomain.com.  86400  IN  SRV  5 0 5222  xmpp.mydomain.com
```
 | Client-Server-Kommunikation |
| 
```
\_xmpp-server.\_tcp.DOMAIN.
```
 | 
```
\_xmpp-server.\_tcp.mydomain.com.  86400  IN  SRV  5 0 5269  xmpp.mydomain.com
```
 | Server-zu-Server-Kommunikation |

### Prüfen von DNS-Einträgen

Es ist möglich, das Kommandozeilen-Tool *dig* zu verwenden, um DNS-Einträge zu überprüfen. Zum Beispiel, um herauszufinden, welcher Server für die Domain *gmail.com* zu verwenden ist:

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


