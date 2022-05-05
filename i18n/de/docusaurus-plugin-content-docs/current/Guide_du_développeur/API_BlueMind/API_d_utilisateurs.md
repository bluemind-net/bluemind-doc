---
title: "Benutzer-API"
confluence_id: 57771887
position: 52
---
# Benutzer-API


## Präsentation

Auf dieser Seite finden Sie Beispiele für die Verwendung und Implementierung der Benutzer-API


## Anlegen eines Benutzers

Das Erstellen eines Benutzers umfasst alle Aktionen, die zum Anlegen eines betriebsbereiten Benutzers erforderlich sind:

- Erstellung auf Datenbankebene
- Benutzerzuordnung zu einer Domain
- Erstellung des Posteingangs 
- Erstellung des Standardkalenders
- Erstellung einer Standard-Kalenderansicht
- Erstellung der Adressbücher "Meine Kontakte" und "Gesammelte Kontakte"


[https://forge.bluemind.net/staging/doc/openui-models/web-resources/?bm_version=4.1.42252#!/net.bluemind.user.api.IUser/put_users_domainUid_uid](https://forge.bluemind.net/staging/doc/openui-models/web-resources/?bm_version=4.1.42252#!/net.bluemind.user.api.IUser/put_users_domainUid_uid)

![](../../attachments/57771887/57771889.png)

#### Beispiel in HTTP

| Methode | URL |
| --- | --- |
| PUT | https://&lt;domain>/api/users/&lt;domain>/&lt;uid> |
| 
domain = die Domain
 | 
uid = eindeutige Benutzer-ID
 |
| **Body** |
| 

```
{
	"emails": [{
		"address": "john@<domain>",
		"allAliases": false,
		"isDefault": true
	}],
	"login": "john",
	"password": "doe",
	"contactInfos": {
		"identification": {
			"name": {
				"familyNames": "Doe",
				"givenNames": "John"
			},
			"photo": false
		}
	},
	"routing": "internal",
	"accountType": "FULL"
}
```

 |

#### Beispiel in Curl


```
curl -X GET --header 'Content-Type: application/json' 
--header 'X-BM-ApiKey: <auth\_key>' 
--header 'Accept: application/json' 
--header 'X-BM-ApiKey: <auth\_key>' 
-d '{
	"emails": [{
		"address": "john@<domain>",
		"allAliases": false,
		"isDefault": true
	}],
	"login": "john",
	"password": "doe",
	"contactInfos": {
		"identification": {
			"name": {
				"familyNames": "Doe",
				"givenNames": "John"
			},
			"photo": false
		}
	},
	"routing": "internal",
	"accountType": "FULL"
}' https://<domain>/api/users/<domain>/<uid>
```


#### Beispiel in Java (unter Verwendung des von Bluemind generierten Clients)


```
IUser userService = serviceProvider.instance(IUser.class, domain); 
User user = new User();
user.login = "john";
user.password = "doe";
user.routing = Routing.internal;
user.emails = Arrays.asList(Email.create(login + "@" + domain, true));
user.contactInfos = new VCard();
user.contactInfos.identification.name = new Name();
user.contactInfos.identification.name.givenNames = login;
String userUid = UUID.randomUUID().toString();
userService.create(userUid, user);
```


