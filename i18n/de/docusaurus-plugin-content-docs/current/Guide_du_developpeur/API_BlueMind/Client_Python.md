---
title: "Python-Client"
confluence_id: 57771892
position: 58
---
# Python-Client


## Python-Version

Der Python-Client unterstützt Python 2.7 oder die aktuelle Version von Python 3. Wir empfehlen die Verwendung von Python 3 für alle neuen Projekte, da Python 2 am Ende seiner Lebensdauer angelangt ist.

## Installation

Der Python-Client kann auf zwei verschiedene Arten installiert werden, entweder durch die Installation des Pakets *python-bm-client*, das in den BlueMind-Repositories verfügbar ist (nur Python 2.7), oder durch die Installation über pip (Python 2.7 oder Python 3).

Wir empfehlen die Installation über pip, wenn möglich in einer [virtuellen Umgebung](https://docs.python.org/3/glossary.html#term-virtual-environment) (virtualenv oder venv), um das System nicht zu stören. Da das Einrichten einer solchen Umgebung den Rahmen dieser Dokumentation sprengen würde, beschränken sich die folgenden Anweisungen auf die Verwendung der Python-Distribution des Systems.


**
Debian/Ubuntu


**
CentOS/Redhat


**
Mac OSX


```
aptitude install python-pip  
pip install --upgrade setuptools  
pip install netbluemind4
```


```
yum install python-pip  
pip install --upgrade setuptools  
pip install netbluemind4
```


```
curl -O https://bootstrap.pypa.io/get-pip.py
sudo /usr/bin/python get-pip.py
sudo /usr/local/bin/pip install --upgrade pip  
pip install --upgrade setuptools  
sudo /usr/local/bin/pip install netbluemind4
```


## Verwendung

### Authentifizierung

Der Client wird mit der Klasse BMClient initialisiert:


```
from netbluemind.python.client import BMClient

# BEGIN CONF
URL="http://localhost:8090/api"
# END CONF

f = open('/etc/bm/bm-core.tok', 'r')
KEY = f.readline()
f.close()

client = BMClient(URL, KEY)
```


URL definiert die Zugriffs-Url auf den BlueMind-Server,  von außerhalb des Servers ist die Url *https://bluemind.domain.net/api*.

KEY entspricht dem Passwort oder Token des admin0, in diesem Beispiel verwenden wir das auf dem Server verfügbare Token admin0, um erweiterte Rechte auf der API-Ebene zu haben, ist es möglich, sich als Benutzer zu authentifizieren mit:


```
from netbluemind.python.client import BMClient

# BEGIN CONF
URL="http://localhost:8090/api"
# END CONF

client = BMClient(URL)
client.login('login@domain.net', 'password')
```


Es ist außerdem möglich, den API-Schlüssel eines Benutzers anstelle seines Passworts zu verwenden.

### Verwendung

#### BMClient

Die Klasse BMClient ist ein Helper, der auch den Zugriff auf die verschiedenen Klassen zum Handling von Benutzern, Gruppen usw. zu ermöglicht.


```
from netbluemind.python.client import BMClient

# BEGIN CONF
URL="http://localhost:8090/api"
# END CONF

client = BMClient(URL)
client.login("login@domain.net", "password")
print client.apiKey

iUser = client.users("domain.net")
user = iUser.byEmail("login@domain.net")
print user.value.login


```


#### User

iUser (Instanz von UIser) ermöglicht den Zugriff und die Änderung aller Informationen über einen Benutzer (Passwort, Foto, Kontakt, archivierter Status usw.), die verschiedenen Methoden geben eine Instanz eines *ItemValue*-Objekts zurück, das den Zugriff auf das betreffende Objekt über das Attribut *value* ermöglicht.

#### Domains

*


*Es ist möglich, Domains über die *IDomains*-Schnittstelle zu erstellen oder zu ändern.
Beim Erstellen einer Domain ist es wichtig, dass die uid der Domain gleich ihrem Namen ist, daher wird die Erstellung wie folgt durchgeführt:


```
domain = Domain()
domain.name = "local.lan"
domain.label = "local.lan"
domain.description = "Domain of " + "local.lan"
domain.properties = {}
# global doit toujours être à False
domain.global\_ = False
# permet de définir les alias du domaine
domain.aliases = []

idomains.create("local.lan", domain)
```


Es ist möglich, die Konfigurationsparameter für die Plugins *ImportLDAP* und *ImportAD* über das Attribut *properties* zu setzen:


```
properties = dict()
properties['import\_ldap\_hostname'] = 'ldap.local'
properties['import\_ldap\_password'] = 'ldap-password'
properties['import\_ldap\_user\_filter'] = '(mail=\*)'
properties['import\_ldap\_accept\_certificate'] = True
properties['import\_ldap\_ext\_id\_attribute'] = 'entryUUID'
properties['import\_ldap\_relay\_mailbox\_group'] = ''
properties['import\_ldap\_enabled'] = True
properties['import\_ldap\_group\_filter'] = '(objectClass=posixGroup)'
properties['import\_ldap\_protocol'] = 'tls'
properties['import\_ldap\_base\_dn'] = 'dc=lan,dc=local'
properties['import\_ldap\_login\_dn'] = 'uid=admin,cn=users,cn=accounts,dc=lan,dc=local'
properties['lang'] = 'fr'
properties['im\_public\_auth'] = True # allow Instant messaging for all users
properties['domain\_max\_users'] = None
properties['mail\_routing\_relay'] = ''
properties['mailbox\_max\_user\_quota'] = '0'
properties['mailbox\_default\_user\_quota'] = '0'
properties['mailbox\_max\_publicfolder\_quota'] = '0'
properties['mailbox\_default\_publicfolder\_quota'] = '0'
properties['filehosting\_max\_filesize'] = '0'
properties['filehosting\_retention'] = '365'
properties['mail\_autoDetachmentLimit'] = '0'
properties['mail\_forward\_unknown\_to\_relay'] = False


```


Für den Active Directory-Import ersetzen Sie einfach *ldap* durch *ad*.

### Beispiele

Viele Beispiele für diverse Möglichkeiten finden Sie hier: [https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples)

#### Ein Backup starten


```
client = BMClient(URL, KEY)
idataprotect = client.instance(IDataProtect)

taskRef = idataprotect.saveAll()
status = client.waitTask(taskRef)
print "\nBackup done with status [" + status.state.value + "]"
```


