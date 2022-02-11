---
title: "Désactiver le SSO Kerberos si on se connecte depuis l'extérieur"
confluence_id: 57771921
position: 52
---
# Désactiver le SSO Kerberos si on se connecte depuis l'extérieur


# Problème

1 Quand Kerberos est activé, hps sert la page de login avec le statut http 401 pour que le browser initie un dialogue krb. Avec certains navigateurs, ceci à pour effet d'afficher une pop-up demandant de saisir un login et un mot de passe AD.Il faut annuler ce comportement pour tomber sur la page d'accueil standard car cette pop-up perturbe les utilisateurs.Depuis l'extérieur, les postes ne sont pas dans le domaine et le SSO ne peut pas fonctionner, cette pop-up ne devrait pas apparaître.
1 La déconnexion ne fonctionne pas bien si le SSO ne fonctionne pas (cas d'une machine se connectant de l'extérieur par exemple).Dans l'appcache il y a écrit (en résumé) "si code http != 200 => go offline". Par conséquent si on se déconnecte depuis l'application contact ou agenda, on n'est pas redirigé vers la page d'accueil de BlueMind bien qu'on soit bien déconnecté du point de vue du serveur et l'application reste affichée dans le navigateur.


# Solution

Au niveau d'un proxy HTTP, si on est sur un réseau où le SSO ne peut pas fonctionner (extérieur dans l'exemple ci dessous), il faut :

1 Rediriger le / vers /native si on se connecte depuis l'extérieur.
1 Rediriger le status 401 de /cal et /contact vers la page d'accueil


Modifier le VHost NGinx du relais en ajoutant les sections :


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


