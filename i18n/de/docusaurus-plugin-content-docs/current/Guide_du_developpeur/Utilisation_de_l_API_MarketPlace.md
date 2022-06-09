---
title: "Verwenden der MarketPlace-API"
confluence_id: 57771910
position: 50
---
# Verwenden der MarketPlace-API


## Präsentation

In diesem Abschnitt wird die API vorgestellt, die eine Automatisierung der Veröffentlichung von Add-ons für BlueMind und deren Versionen auf dem MarketPlace ermöglicht.

Diese API ist auf dem  [BlueMind MarketPlace](https://marketplace.blue-mind.net/) herunterladbar.


:::tip

API-Schlüssel
Um die API zu nutzen, benötigen Sie Ihren API-Schlüssel, der in der Administrationsoberfläche verfügbar ist: [https://marketplace.blue-mind.net/admin/](https://marketplace.blue-mind.net/admin/). Dieser API-Schlüssel kann nur durch den Website-Administrator geändert werden.
:::


## Meine Plugins und ihre Versionen

Um herauszufinden, welche Plugins freigegeben sind, welchen Status sie haben (freigegeben oder nicht), wie die aktuelle Version lautet und viele andere Informationen, müssen Sie eine GET-Abfrage an die URL stellen:[https://marketplace.blue-mind.net/addons/api/plugins/](https://marketplace.blue-mind.net/addons/api/plugins/). Diese Abfrage gibt Informationen im JSON-Format zurück.
Der **API-Schlüssel**, der dem anfragenden Benutzer zugeordnet ist **, muss als *Header*** der Abfrage in der folgenden Form enthalten sein: "api-key: la_cle_d_api".

Hier ist ein Beispiel für Python-Code, um diese Anfrage zu stellen:
**GET /api/plugins/**

```
import requests

headers = {
    'api-key': 'your\_api\_key'
}

URL = 'https://marketplace.blue-mind.net/addons/api/plugins/'

req = requests.get(URL, headers=headers, verify=False)
print "Status code : " + str(req.status\_code)
if req.text:
    print "Contents : " + str(json.dumps(req.json(), indent=4, sort\_keys=True))
```


:::tip

Vergessen Sie nicht, den API-Schlüssel durch den Schlüssel zu ersetzen, der mit Ihrem Konto im MarketPlace verbunden ist.

:::

Beispiele für Implementierungen in anderen Sprachen finden Sie am Ende dieser Seite. Wenn Sie die Abfrage in einer Sprache erstellen möchten, die nicht vorhanden ist, können Sie das Beispiel eines generierten Frame entwickeln:
Generierter Frame
GET /addons/api/plugins/ HTTP/1.1

Host: marketplace.blue-mind.net

Content-Length: 51

Content-Type: application/x-www-form-urlencoded

Accept-Encoding: gzip, deflate

Accept: */*

User-Agent: python-requests/2.3.0 CPython/2.7.5+ Linux/3.11.0-12-generic

api-key: your_api_key

## Ein bestimmtes Plugin

Um Informationen über ein bestimmtes Plugin (dessen ID bekannt ist) zu erhalten, kann eine GET-Anfrage an die Url : https: [//marketplace.blue-mind.net/addons/api/plugin/{id}/](#) gerichtet werden, wobei {id} die ID des betreffenden Plugins ist. Diese Abfrage gibt Informationen über das gewünschte Plugin im JSON-Format zurück, wenn der Benutzer das Plugin besitzt, andernfalls wird ein Fehler 403 zurückgegeben.
Diese Abfrage verlangt außerdem, **den API-Schlüssel als *header*** in der folgenden Form einzuschließen: "api-key: der api-Schlüssel".

Hier ein Beispiel für Python-Code, mit dem Sie diese Anfrage stellen können:
**GET /api/plugin/1**

```
import requests

headers = {
    'api-key': 'your\_api\_key'
}

URL = 'https://marketplace.blue-mind.net/addons/api/plugin/1/'

req = requests.get(URL, headers=headers, verify=False)
print "Status code : " + str(req.status\_code)
if req.text:
    print "Contents : " + str(json.dumps(req.json(), indent=4, sort\_keys=True))
```


Beispiele für Implementierungen in anderen Sprachen finden Sie am Ende dieser Seite. Wenn Sie die Abfrage in einer Sprache erstellen möchten, die nicht vorhanden ist, können Sie das Beispiel eines generierten Frame entwickeln:
Generierter Frame
GET /addons/api/plugin/1/ HTTP/1.1

Host: [marketplace.blue-mind.net](http://marketplace.blue-mind.net)

Content-Length: 51

Content-Type: application/x-www-form-urlencoded

Accept-Encoding: gzip, deflate

Accept: */*

User-Agent: python-requests/2.3.0 CPython/2.7.5+ Linux/3.11.0-12-generic

api-key: your_api_key

## Ein Plugin hinzufügen

Um ein Plugin hinzuzufügen, müssen Sie eine POST-Anfrage erstellen, die die Informationen für seine Erstellung im JSON-Format enthält, und diese Anfrage an die URL [https://marketplace.blue-mind.net/addons/api/plugins/](https://marketplace.blue-mind.net/addons/api/plugins/) senden. Die betreffenden Informationen sind:

| Name des Schlüssels | Obligatorisch | Beschreibung des Schlüssels |
| --- | --- | --- |
| api_key | ja | Benutzeridentifizierung des Benutzers, der ein Plugin erstellen wird |
| name | ja | Name des zu erstellenden Plugins |
| shortdesc | ja | Kurzbeschreibung des zu erstellenden Plugins (wird unter dem Titel angezeigt) |
| Beschreibung | ja | Langbeschreibung des zu erstellenden Plugins (wird unter den Bildschirmfotos angezeigt) |
| license | ja | Lizenz zur Veröffentlichung des zu erstellenden Plugins |
| installation_instructions | ja | Installieren des Plugins |
| home_url | nein | URL der Website, die mit dem Plugin verknüpft ist |


:::info

Die Anfrage ist vom Typ "*multipart/form-data*"; es wurde gewählt, dass JSON-Daten mit dem Namen "json" assoziiert werden. Diese Konvention ist für eine erfolgreiche Anfrage einzuhalten.

:::

Sie können auch Bilder mit Bezug zum Plugin hinzufügen, indem Sie sie als verknüpfte Dateien an die POST-Anfrage anhängen. Die Namen der Bilder müssen der folgenden Konvention entsprechen:

| Name | Beschreibung |
| --- | --- |
| Thumbnail | Das Bild, das mit dem Plugin-Logo verbunden ist. |
| * | 
Jedes Bild mit einem anderen Namen wird als Screenshot für das Plugin importiert.
 |


:::tip

Die Anzahl der Screenshot ist nicht begrenzt.

:::

Hier ist ein Beispiel für Python-Code, der ein Plugin mit einem Logo und zwei *Screenshots* erstellt:
**POST /api/plugins/**

```
import requests, json

data = {
  'api\_key': 'your\_api\_key',
  'name': 'Super plugin',
  'shortdesc': 'A short description',
  'description': 'A long description',
  'license': 'A license',
  'installation\_instructions': 'Some instructions',
  'home\_url': "http://www.blue-mind.net"
}

files = {
    'thumbnail': open('/home/user/Images/my\_thumbnail.jpg', 'rb'),
    'screen1': open('/home/user/Images/my\_screenshot1.png', 'rb'),
    'screen2': open('/home/user/Images/my\_screenshot2.png', 'rb')
}

URL = 'https://marketplace.blue-mind.net/addons/api/plugins/'

req = requests.post(URL, files=files, data={'json': json.dumps(data)}, verify=False)
print "Status code : " + str(req.status\_code)
```


Beispiele für Implementierungen in anderen Sprachen finden Sie am Ende dieser Seite. Wenn Sie die Abfrage in einer Sprache erstellen möchten, die nicht vorhanden ist, können Sie das Beispiel eines generierten Frame entwickeln:
Generierter Frame
POST /addons/api/plugins/ HTTP/1.1
Host: [marketplace.blue-mind.net](http://marketplace.blue-mind.net)
Content-Length: 279271
Content-Type: multipart/form-data; boundary=1824dd5f14f14e57bb2b2a27424628db
Accept-Encoding: gzip, deflate
Accept: */*
User-Agent: python-requests/2.3.0 CPython/2.7.5+ Linux/3.11.0-12-generic

--1824dd5f14f14e57bb2b2a27424628db
Content-Disposition: form-data; name="json"
{"home_url": "[http://www.blue-mind.net](http://www.blue-mind.net)", "name": "Super plugin", "license": "A license", "installation_instructions": "Some instructions", "shortdesc": "A short description", "api_key": "your_api_key", "description": "A long description"}


--1824dd5f14f14e57bb2b2a27424628db
Content-Disposition: form-data; name="screen2"; filename="my_screenshot2.png"
[... DATA ...]
--1824dd5f14f14e57bb2b2a27424628db--
--1824dd5f14f14e57bb2b2a27424628db
Content-Disposition: form-data; name="screen1"; filename="my_screenshot1.png"
[... DATA ...]
--1824dd5f14f14e57bb2b2a27424628db--
--1824dd5f14f14e57bb2b2a27424628db
Content-Disposition: form-data; name="thumbnail"; filename="my_thumbnail.jpg"
[... DATA ...]
--1824dd5f14f14e57bb2b2a27424628db--

## Hinzufügen einer Plugin-Version

Um eine Plugin-Version zu einem eigenen Plugin hinzuzufügen, müssen Sie eine POST-Anfrage erstellen, die die Informationen zum Erstellen der Version im JSON-Format enthält, und diese Anfrage an die URL [https://marketplace.blue-mind.net/addons/api/plugin_version/](https://marketplace.blue-mind.net/addons/api/plugin_version/) senden. Die betreffenden Informationen sind:

| Name des Schlüssels | Obligatorisch | Beschreibung des Schlüssels |
| --- | --- | --- |
| api_key | ja | Benutzeridentifizierung des Benutzers, der das Plugin erstellen wird |
| plugin_name | ja | Name des Plugins, das der Version zugeordnet ist |
| version | ja | Nummer der neuen Version des Plugins |
| target_bm_versions | ja | BlueMind-Versionen, die von dieser neuen Version betroffen sind |
| release_notes | ja | 
Informationen über den Grund für diese neue Version
 |


:::info

Die Anfrage ist vom Typ "*multipart/form-data*"; es wurde gewählt, dass JSON-Daten mit dem Namen "json" assoziiert werden. Diese Konvention ist für eine erfolgreiche Anfrage einzuhalten.

:::


:::info

Sie müssen dieser neuen Version **eine Datei zuordnen** (die herunterzuladende Datei), indem Sie sie unter dem Namen "package" an die POST-Anfrage anhängen.

:::

Hier ist ein Beispiel für Code in Python, mit dem die Version 0.2 für das "Super-Plugin" hinzugefügt werden kann:
**POST /api/plugin_version/**

```
import requests, json

data = {
  'api\_key': 'your\_api\_key',
  'plugin\_name': 'Super plugin',
  'version': '0.2',
  'target\_bm\_versions': '3.x',
  'release\_notes': 'Brand new release'
}

files = {
    'package': open('/home/user/Files/super\_plugin.jar', 'rb')
}

URL = 'https://marketplace.blue-mind.net/addons/api/plugin\_version/'

req = requests.post(URL, files=files, data={'json': json.dumps(data)}, verify=False)
print "Status code : " + str(req.status\_code)
```


:::info

Die neue Version wird abgelehnt, wenn sie keine Datei enthält oder wenn das Plugin nicht Ihnen gehört (außer bei einem MarketPlace-Administrator).

:::

Beispiele für Implementierungen in anderen Sprachen finden Sie am Ende dieser Seite. Wenn Sie die Abfrage in einer Sprache erstellen möchten, die nicht vorhanden ist, können Sie das Beispiel eines generierten Frame entwickeln:
Click here to expand...
POST /addons/api/plugin_version/ HTTP/1.1

Host: [marketplace.blue-mind.net](http://marketplace.blue-mind.net)

Content-Length: 1191498

Content-Type: multipart/form-data; boundary=947a3f6396a244a99118fd5a3faa5204

Accept-Encoding: gzip, deflate

Accept: */*

User-Agent: python-requests/2.3.0 CPython/2.7.5+ Linux/3.11.0-12-generic

 

--947a3f6396a244a99118fd5a3faa5204

Content-Disposition: form-data; name="json"

{"api_key": "your_api_key", "release_notes": "Dies ist ein neues Release", "Version": "0.2", "plugin_name": "Super plugin", "target_bm_versions": "3.x"}

 

--947a3f6396a244a99118fd5a3faa5204

Content-Disposition: form-data; name="package"; filename="super_plugin.jar"

[... DATA...]

--947a3f6396a244a99118fd5a3faa5204--

## Verwendung der API in verschiedenen Sprachen

### In Python

Dieses komplette Skript übernimmt die vorherigen Skripte und ermöglicht es, POST oder GET (je nachdem, was kommentiert ist) auf dem MarketPlace auszuführen:
**Vollständiges Skript**

```
#!/usr/bin/env python
# -\*- coding: utf-8 -\*-
import requests, json

WEBSITE = "https://marketplace.blue-mind.net/"
API\_KEY = "your\_api\_key"

#### POST PLUGIN
data = {
  'api\_key': API\_KEY,
  'name': 'Super plugin',
  'shortdesc': 'A short description',
  'description': 'A long description',
  'license': 'A license',
  'installation\_instructions': 'Several instructions !',
  'home\_url': "http://www.blue-mind.net"
}

files = {
    'thumbnail': open('/home/user/Images/thumbnail.jpg', 'rb'),
    'screen1': open('/home/user/Images/screenshot1.png', 'rb'),
    'screen2': open('/home/user/Images/screenshot1.png', 'rb')
}

URL = WEBSITE + 'addons/api/plugins/'

#### POST PLUGIN VERSION
# data = {
#   'api\_key': API\_KEY,
#   'plugin\_name': 'Super plugin',
#   'version': '0.2',
#   'target\_bm\_versions': '3.x',
#   'release\_notes': 'On vient de faire une nouvelle release'
# }
#
# files = {
#     'package': open('/home/user/Files/super\_plugin.jar', 'rb')
# }
#
# URL = WEBSITE + 'addons/api/plugin\_version/'

#### POST REQUEST
req = requests.post(URL, files=files, data={'json': json.dumps(data)}, verify=False)


#### GET PLUGINS
# headers = {
#     'api-key': API\_KEY
# }
#
# URL = WEBSITE + 'addons/api/plugins/'
#
# #### GET REQUEST
# req = requests.get(URL, headers=headers, verify=False)


#### POST OR GET RESPONSE
print "Status code : " + str(req.status\_code)
if req.text:
    print "Contents : " + str(json.dumps(req.json(), indent=4, sort\_keys=True))
```


:::tip

Laden Sie den Quellcode herunter: [api_python.py](../attachments/57771910/57771912.py)

:::

### In Java

Die folgenden Codeschnipsel geben einen Überblick darüber, was Sie in Java tun müssen, um funktionierende GET- und POST-Anfragen zu erhalten. Sie verwenden die APIs **Apache HTTP** und **JSON-Simple**.
**GET /addons/api/plugins**

```
private static HttpClient httpClient = StaticTools.getHttpClient(true);
private static String API\_KEY = "your\_api\_key";
private static String WEBSITE = "https://marketplace.blue-mind.net/";

private static void getPlugins() throws IOException {
    HttpGet httpGet = new HttpGet(WEBSITE + "/addons/api/plugins/");
    httpGet.addHeader("api-key", API\_KEY);
    ResponseHandler<String> handler = new BasicResponseHandler();
    HttpResponse rep = httpClient.execute(httpGet);
    if (rep != null) {
        int statusCode = rep.getStatusLine().getStatusCode();
        System.out.println("Status code : " + statusCode);
        if (statusCode == 200) {
            System.out.println("Contents : " + handler.handleResponse(rep));
        }
    }
}
```

**GET /addons/api/plugin/id**

```
private static HttpClient httpClient = StaticTools.getHttpClient(true);
private static String API\_KEY = "your\_api\_key";
private static String WEBSITE = "https://marketplace.blue-mind.net/";
    
private static void getPlugin(int id) throws IOException {
    HttpGet httpGet = new HttpGet(WEBSITE + "/addons/api/plugin/" + id);
    httpGet.addHeader("api-key", API\_KEY);
    ResponseHandler<String> handler = new BasicResponseHandler();
    HttpResponse rep = httpClient.execute(httpGet);
    if (rep != null) {
        int statusCode = rep.getStatusLine().getStatusCode();
        System.out.println("Status code : " + statusCode);
        if (statusCode == 200) {
            System.out.println("Contents : " + handler.handleResponse(rep));
        }
    }
}
```

**POST /addons/api/plugins**

```
private static HttpClient httpClient = StaticTools.getHttpClient(true);
private static String API\_KEY = "your\_api\_key";
private static String WEBSITE = "https://marketplace.blue-mind.net/";
    
@SuppressWarnings("unchecked")
private static void postPlugin() throws IOException {
    HttpPost httpPost = new HttpPost(WEBSITE + "/addons/api/plugins/");
    MultipartEntityBuilder builder = MultipartEntityBuilder.create();
    ContentType contentType = ContentType.getOrDefault(null);
    
    // Json part
    JSONObject j = new JSONObject();
    j.put("api\_key", API\_KEY);
    j.put("name", "Super plugin");
    j.put("shortdesc", "A short description");
    j.put("description", "A long description");
    j.put("license", "A license");
    j.put("installation\_instructions", "Several instructions");
    j.put("home\_url", "http://www.blue-mind.net");
    StringBody json = new StringBody(j.toString(), contentType);
     
    // Files part
    FileBody thumbnail = new FileBody(new File("/home/user/Images/thumbnail.jpg"));
    FileBody screen1 = new FileBody(new File("/home/user/Images/screenshot1.png"));
    FileBody screen2 = new FileBody(new File("/home/user/Images/screenshot2.png"));
    
    // Grouping
    builder.addPart("json", json);
    builder.addPart("thumbnail", thumbnail);
    builder.addPart("screen1", screen1);
    builder.addPart("screen2", screen2);
      
    httpPost.setEntity(builder.build());
    HttpResponse rep = httpClient.execute(httpPost);
    if (rep != null) {
        int statusCode = rep.getStatusLine().getStatusCode();
        System.out.println("Status code : " + statusCode);
    }
}
```

**POST /addons/api/plugin_version**

```
private static HttpClient httpClient = StaticTools.getHttpClient(true);
private static String API\_KEY = "your\_api\_key";
private static String WEBSITE = "https://marketplace.blue-mind.net/";

@SuppressWarnings("unchecked")
private static void postPluginVersion() throws IOException {
    HttpPost httpPost = new HttpPost(WEBSITE + "/addons/api/plugin\_version/");
    MultipartEntityBuilder builder = MultipartEntityBuilder.create();
    ContentType contentType = ContentType.getOrDefault(null);
    
    // Json part
    JSONObject j = new JSONObject();
    j.put("api\_key", API\_KEY);
    j.put("plugin\_name", "Super plugin");
    j.put("version", "0.2");
    j.put("target\_bm\_versions", "3.x");
    j.put("release\_notes", "On vient de faire une nouvelle release");
    StringBody json = new StringBody(j.toString(), contentType);
    
    // Files part
    FileBody pack = new FileBody(new File("/home/user/Files/super\_plugin.jar"));
    
    // Grouping
    builder.addPart("json", json);
    builder.addPart("package", pack);
    
    httpPost.setEntity(builder.build());
    HttpResponse rep = httpClient.execute(httpPost);
    if (rep != null) {
        int statusCode = rep.getStatusLine().getStatusCode();
        System.out.println("Status code : " + statusCode);
    }
}
```


:::tip

Laden Sie den Quellcode herunter: [api_java.zip](../attachments/57771910/57771911.zip)

:::


 

Speichern

