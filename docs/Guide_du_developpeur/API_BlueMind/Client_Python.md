---
title: "Client Python"
confluence_id: 57771892
sidebar_position: 58
---
# Client Python


## Version de python

Le client python supporte python 2.7 ou la version courante de python 3. Nous recommandons l'utilisation de python 3 pour tous les nouveaux projets, python 2 étant en fin de vie.

## Installation

Le client python peut s'installer de deux manières différentes, soit en installation le paquet *python-bm-client* disponible dans les dépôts BlueMind (python 2.7 seulement), soit en l'installant via pip (python 2.7 ou python 3).

Nous recommandons l'installation via pip, si possible dans un [environnement virtuel](https://docs.python.org/3/glossary.html#term-virtual-environment) (virtualenv ou venv) de façon à ne pas interférer avec  le système. La mise en place d'un tel environnement dépassant le cadre de cette documentation, les instructions suivantes se limitent à l'utilisation de la distribution python du système.


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


## Utilisation

### Authentification

Le client s'initialise avec la classe BMClient :


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


URL définie l'url d'accès au serveur BlueMind,  depuis l’extérieur l'url sera *https://bluemind.domain.net/api*.

KEY correspond au mot de passe ou token de l'admin0, dans cet exemple on utilise le token admin0 disponible sur le serveur afin d'avoir des droits étendus au niveau de l'API, il est possible de s'authentifier en tant qu'utilisateur avec :


```
from netbluemind.python.client import BMClient

# BEGIN CONF
URL="http://localhost:8090/api"
# END CONF

client = BMClient(URL)
client.login('login@domain.net', 'password')
```


A noter qu'il est aussi possible d'utiliser la clé d'API d'un utilisateur à la place de son mot de passe.

### Utilisation

#### BMClient

La classe BMClient est un helper qui permet aussi d'accéder aux différentes classes pour manipuler les utilisateurs, groupes, etc


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


#### Users

iUser (instance de IUser) permet d'accéder et modifier toutes les informations sur un utilisateur (mot de passe, photo, contact, statut archivé, etc), les différentes méthodes retournent une instance d'un object *ItemValue* qui permet d'accéder à l'object en question via l'attribut *value.*

#### Domains

*


*Il est possible de créer ou modifier des domaines en utilisant l'interface *IDomains*.
Lors de la création d'un domain, il est important que l'uid du domain soit égale à son nom, la création se fait donc ainsi :


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


Il est possible de définir la configuration des paramètres pour les plugins *ImportLDAP* et *ImportAD* en utilisant l'attribut *properties* :


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


Pour l'import Active Directory il suffit de remplacer *ldap* par *ad*.

### Exemples

De nombreux exemples de possibilités sont accessibles ici : [https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples)

#### Démarrer un backup


```
client = BMClient(URL, KEY)
idataprotect = client.instance(IDataProtect)

taskRef = idataprotect.saveAll()
status = client.waitTask(taskRef)
print "\nBackup done with status [" + status.state.value + "]"
```


