---
title: "L'autodiscover n'est pas trouvé par les mobiles Android"
confluence_id: 57771846
position: 68
---
# L'autodiscover n'est pas trouvé par les mobiles Android


## Symptômes

Lors de la configuration d'un appareil mobile Android, il manque le préfixe dans l'adresse du serveur.

Pourtant, la configuration de l'*autodiscover* est bonne d'après le diagnostic en ligne sur [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/)

## Problème

Android à un fonctionnement particulier si le domaine de l'adresse de messagerie résout au niveau DNS : si un site (autre que BlueMind) existe à l'adresse ***https://&lt;bluemind.domain.com>*** alors il tente de récupérer la configuration d'autodiscover depuis ***https://&lt;bluemind.domain.com>/autodiscover*** (ou ***https://&lt;bluemind.domain.com>/Autodiscover***)

## Solution

Configurer le site pour qu'il renvoie les requêtes https vers BlueMind :


```
location /autodiscover {
    rewrite ^(.\*) https://bluemind.domain.com$1?$args permanent;
}

location /Autodiscover {
    rewrite ^(.\*) https://bluemind.domain.com$1?$args permanent;
} 
```


