---
title: "PHP-Client"
confluence_id: 57771891
position: 56
---
# PHP-Client


## Installation

Die Installation des PHP-Clients erfolgt derzeit durch Abrufen eines Archivs, das den Client enthält, unter folgender URL: https://pkg.bluemind.net/pkg/&lt;technische Nummer des BM>/clients/

## Verwendung

### Authentifizierung

Der Client wird mit der Klasse BMClient initialisiert:


```
<?php
require 'BM/AuthenticationClient.php';
require 'BM/DomainsClient.php';

$url="https://external-url";
$token="admin";

$authClient = new BM\AuthenticationClient($url, NULL);
$loginResponse = $authClient->login('admin0@global.virt', $token, 'bm-php-client');
echo "Login result : ".$loginResponse->status;
?>
```


url definiert die Zugriffs-Url auf den BlueMind-Server.

token entspricht dem Passwort oder Token des admin0, in diesem Beispiel verwenden wir den admin0, aber es ist möglich, sich mit einem beliebigen Benutzer zu authentifizieren. Es ist auch möglich, sich wie folgt als Benutzer zu authentifizieren:


```
<?php
require 'BM/AuthenticationClient.php';
require 'BM/DomainsClient.php';

$url="https://external-url";
$token="admin";

$authClient = new BM\AuthenticationClient($url, NULL);
$loginResponse = $authClient->login('admin0@global.virt', $token, 'bm-php-client');
print "Login result : ".$loginResponse->status;
$authClient = new BM\AuthenticationClient($url, $loginResponse->authKey);
$token = $authClient->su("user@local.lan");
print "sudo result : ".$token->status
?>
```


Anstelle eines Benutzer-Logins kann ebenfalls der API-Schlüssel verwendet werden.

### Auflisten der Domains


```
<?php
require 'BM/AuthenticationClient.php';
require 'BM/DomainsClient.php';

$url="https://external-url";
$token="admin";

$authClient = new BM\AuthenticationClient($url, NULL);
$loginResponse = $authClient->login('admin0@global.virt', $token, 'bm-php-client');
print "Login result : " + $loginResponse->status;

$domainClient = new BM\DomainsClient($url, $loginResponse->authKey);
$domains = $domainClient->all();
#var\_dump($domains);
foreach ($domains as $domain)
{
    print $domain->value->name."\n";
}
?>
```


### Auflisten der Termine


```
<?php
require 'BM/AuthenticationClient.php';
require 'BM/DomainsClient.php';
require 'BM/UserClient.php';
require 'BM/CalendarClient.php';
require 'BM/ContainersClient.php';
require 'BM/ContainerQuery.php';

// BEGIN CONF
$url="https://external-url";
$token="admin";
$user="user@local.lan";
$domain="local.lan";
// END CONF

$authClient = new BM\AuthenticationClient($url, NULL);
$loginResponse = $authClient->login('admin0@global.virt', $token, 'bm-php-client');
//var\_dump($loginResponse);
print "Login result : " + $loginResponse->status;

$userClient =  New BM\UserClient($url, $loginResponse->authKey, $domain);
$userValue = $userClient->byEmail($user);

$containersClient =  New BM\ContainersClient($url, $loginResponse->authKey);
$query = New BM\ContainerQuery();
$query->owner = $userValue->uid;
$query->type = "calendar";
$containers = $containersClient->allForUser($domain, $userValue->uid, $query);

foreach ($containers as $container)
{
    print "calendar : ".$container->name. " uid : ".$container->uid."\n";
    $calendarClient =  New BM\CalendarClient($url, $loginResponse->authKey, $container->uid);
    foreach ($calendarClient->list\_()->values as $event)
    {
        print "Event : ".$event->value->main->summary."\n";
    }
}
?>
```


Beispiele sind auf unserem Git verfügbar: [https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/php-api-examples](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/php-api-examples)

### FAQ

#### Probleme mit dem Zertifikat

Wenn Sie ein nicht anerkanntes Zertifikat verwenden, müssen Sie in der Datei BM/GlobalEnv.php den Wert von CURLOPT_SSL_VERIFYPEER auf FALSE ändern


