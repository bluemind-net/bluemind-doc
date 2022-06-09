---
title: "XMPP Server Administration"
confluence_id: 57771795
position: 62
---
# XMPP Server Administration


## Introduction

The XMPP server is built on a [Tigase XMPP server](http://www.tigase.org/). Most development add-ons are Tigase-related plugins to enable integration with the BlueMind solution.


## Installation

The *bm-xmpp* package allows you to install the BlueMind XMPP server comprehensively.

### Integration with BlueMind services

The "*bm-xmpp" *package adds the functionalities below to BlueMind:

- integrated authentication with *bm-core*
- XMPP server for all domains monitored by BlueMind
- support of vCard contact information and avatars from the data in the BlueMind address book 
- default user email addresses match their jabber ID


### Service inter-dependencies

*"bm-xmpp"* depends on the following BlueMind services:

- *bm-locator* to locate BlueMind services
- *bm-mq* to keep the list of domains monitored by BlueMind up to date
- *bm-core* for vCard authentication and generation
- *bm-elasticsearch* for archiving and searching conversations


### Enabling the instant messaging service 

To enable the instant messaging service, connect to BlueMind as admin0 and:

- go to System Management > Application's servers
- select the server > "Server roles"
- tick "Instant messaging indexing server"
- click "Save"


Next go back to the admin console home page and:

- go to System Management > Supervised domains
- select the domain concerned
- in the "BM Server" tab: assign the XMPP server
- in the "Instant messaging" tab, define accesses
- click "Save"


Finally, for users to be able to access the instant messaging service, they must be given the appropriate role for the application:

- either via the user's management page > General tab
- or via the group roles management page > Roles tab


To find out more about enabling this role, go to the dedicated page: [Roles: Access and Administration Rights](/Guide_de_l_administrateur/Gestion_des_entites/Utilisateurs/Les_rôles_droits_d_accès_et_d_administration/)

## Changing SSL certificates

SSL certificates are generated automatically by *bm-xmpp* when a new domain is used. As self-signed certificates, they must be replaced by valid certificates.

To replace a domain's certificate, simply replace the appropriate files in  */usr/share/bm-xmpp/certs/*.

## Connecting the XMPP server to the internet

By allowing the XMPP server to connect to the internet, the server is able to connect to other XMPP servers or to allow external users to connect to BlueMind's XMPP server. BlueMind users are then able to add non-BlueMind contacts to their instant messaging's contact list (displayed in the roaster). 

### Finding an externally-accessible DNS address

For example, if an XMPP server's DNS is "*xmpp.mydomain.com"*, this DNS name must be resolved externally, from the internet, and not only internally.

### Communication ports

The ports below must be accessible externally on the server "*xmpp.mydomain.com" (see also [Services](/Guide_de_l_administrateur/Présentation_du_produit/Les_services/))*:

- 5222 from the client to the server for client-server communications
- 5223 from the client to the server for client-server SSL communications
- 5269, used for server-to-server communications 


If "*bm-xmpp"* is not installed on the server whose DNS name is "*xmpp.mydomain.com"* (e.g. in the case of a proxy), these ports' data flows must be redirected to the server hosting "*bm-xmpp"*.

### Adding DNS SRV records

The DNS configuration of the domain "*mydomain.com*" must be edited to allow the external network to recognize "*xmpp.mydomain.com"* as the XMPP server for the domain "*mydomain.com"*.

The following SRV records must be added:

| Key | Example | Description |
| --- | --- | --- |
| 
```
\_xmpp-client.\_tcp.DOMAIN.
```
 | 
```
\_xmpp-client.\_tcp.mydomain.com.  86400  IN  SRV  5 0 5222  xmpp.mydomain.com
```
 | Client-server communications |
| 
```
\_xmpp-server.\_tcp.DOMAIN.
```
 | 
```
\_xmpp-server.\_tcp.mydomain.com.  86400  IN  SRV  5 0 5269  xmpp.mydomain.com
```
 | Server-server communications |

#### Checking DNS records

You can use the command-line tool "*dig" *to check DNS records. For example, to find out which server to use for the domain "*gmail.com"*:

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


