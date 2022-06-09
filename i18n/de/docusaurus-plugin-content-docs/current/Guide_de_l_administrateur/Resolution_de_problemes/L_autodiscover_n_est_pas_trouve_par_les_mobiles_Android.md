---
title: "Autodiscover wird von Android-Handys nicht gefunden"
confluence_id: 57771846
position: 68
---
# Autodiscover wird von Android-Handys nicht gefunden


## Symptome

Beim Konfigurieren eines Android-Mobilgeräts fehlt das Präfix in der Serveradresse.

Die Konfiguration von *Autodiscover* ist jedoch laut der Online-Diagnose unter [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/) OK

## Problem

Android hat eine besondere Funktionsweise, wenn die Domain der E-Mail-Adresse auf DNS-Ebene aufgelöst wird: wenn eine Website (außer BlueMind) unter der Adresse  ***https://&lt;bluemind.domain.com>*** existiert, dann versucht es, die Autodiscover-Konfiguration von ***&lt;bluemind.domain.com>https:///autodiscover&lt;/bluemind.domain.com>*** (oder ***&lt;bluemind.domain.com>https:///Autodiscover&lt;/bluemind.domain.com>***) wiederherzustellen

## Lösung

Konfigurieren Sie die Website so, dass https-Anfragen an BlueMind weitergeleitet werden:


```
location /autodiscover {
    rewrite ^(.\*) https://bluemind.domain.com$1?$args permanent;
}

location /Autodiscover {
    rewrite ^(.\*) https://bluemind.domain.com$1?$args permanent;
} 
```


