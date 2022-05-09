---
title: "Client PHP"
confluence_id: 57771891
sidebar_position: 56
---
# Client PHP


## Installation

Le client PHP s'installe pour le moment en récupérant une archive contenant le client, disponible à l'URL suivante : https://pkg.bluemind.net/pkg/&lt;numéro technique de BM>/clients/

## Utilisation

### Authentification

Le client s'initialise avec la classe BMClient :


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


url définie l'url d'accès au serveur BlueMind.

token correspond au mot de passe ou token de l'admin0, dans cet exemple on utilise le admin0 mais il est possible de s'authentifier avec n'importe quel utilisateur.. Il est également possible de s'authentifier en tant qu'utilisateur avec :


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


A noter qu'il est aussi possible d'utiliser la clé d'API d'un utilisateur à la place de son login.

### Lister les domaines


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


### Lister les évènements


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


Les examples sont disponibles sur notre git : [https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/php-api-examples](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/php-api-examples)

### FAQ

#### Problèmes de certificat

Si vous utilisez un certificat non reconnu, il faut modifier la valeur de CURLOPT_SSL_VERIFYPEER à FALSE dans le fichier BM/GlobalEnv.php


