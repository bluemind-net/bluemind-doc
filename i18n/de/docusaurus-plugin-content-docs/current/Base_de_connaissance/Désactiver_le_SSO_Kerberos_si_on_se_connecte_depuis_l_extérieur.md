---
title: "Deaktivieren Sie Kerberos SSO, wenn Sie sich von außen verbinden"
confluence_id: 57771921
position: 52
---
# Deaktivieren Sie Kerberos SSO, wenn Sie sich von außen verbinden


## Problem

1. Wenn Kerberos aktiviert ist, bedient hps die Login-Seite mit dem Status http 401, damit der Browser einen krb-Dialog initiiert. Bei einigen Browsern hat dies den Effekt, dass ein Pop-up angezeigt wird, das zur Eingabe eines AD-Logins und -Passworts auffordert.Dieses Verhalten muss aufgehoben werden, um auf die Standard-Startseite zu gelangen, da dieses Pop-up die Benutzer stört.Von außerhalb befinden sich diese PCs nicht im Domain und das SSO kann nicht funktionieren, sollte dieses Pop-up nicht erscheinen.
2. Die Trennung funktioniert nicht gut, wenn das SSO nicht läuft (z.B. bei einer Maschine, die sich von außen verbindet).Im Appcache steht (zusammengefasst) "if http code != 200 => go offline". Wenn Sie sich aus der Kontakt- oder Terminplaneranwendung abmelden, werden Sie nicht auf die BlueMind-Homepage umgeleitet, obwohl Sie aus Sicht des Servers tatsächlich abgemeldet sind und die Anwendung weiterhin im Browser angezeigt wird.


## Lösung

Wenn Sie sich auf der Ebene eines HTTP-Proxys in einem Netzwerk befinden, in dem das SSO nicht funktionieren kann (im Beispiel unten außen), gehen Sie wie folgt vor:

1. Das / auf /native umleiten, wenn die Verbindung von außen stattfindet.
2. Status 401 von /cal und /contact auf die Startseite umleiten


Den VHost NGinx des Relais ändern, indem Sie die folgenden Abschnitte hinzufügen:


```
geo $local {
  default 0;
  127.0.0.0/8 1;
  192.168.0.0/16 1;
  172.16.0.0/12 1;
  10.0.0.0/8 1;
}

server {
  ...
  location / {
    proxy\_intercept\_errors on;

    if ($local = 0) {
      error\_page 401 https://bluemind-ext-url/native;
    }

    proxy\_pass https://bluemind-srv;
  }

  location /cal {
    proxy\_intercept\_errors on;

    if ($local = 0) {
      error\_page 401 https://bluemind-ext-url/;
    }

    proxy\_pass https://bluemind-srv;
  }

  location /contact {
    proxy\_intercept\_errors on;

    if ($local = 0) {
      error\_page 401 https://bluemind-ext-url/;
    }

    proxy\_pass https://bluemind-srv;
  }
  ...
}
```


