---
title: "Multi-calendrier sur les smartphones"
confluence_id: 57771926
position: 62
---
# Multi-calendrier sur les smartphones


# Présentation

Via une fonctionnalité expérimentale, BlueMind permet de consulter plusieurs agendas sur les smartphones Android.

Cette fonctionnalité est à utiliser avec précaution : certains dysfonctionnements connus n'ont pas à ce jour de résolution. Voir le chapître ci-après.
:::important

En BlueMind 4 cela ne concerne que les calendriers de l'utilisateur lui-même (calendrier par défaut et calendriers secondaires personnels) : les calendriers qui lui sont partagés, calendriers de domaine ou calendriers d'autres utilisateurs, ne seront pas visibles sur smartphones.

:::

# Mise en œuvre coté serveur

Configurer cette fonctionnalité par la création d'un fichier système.


```
# touch /root/eas.multical
```


Relancer le service EAS :


```
# service bm-eas restart
```


# Fonctionnement

Afin que les calendriers qui ont été partagés apparaissent, il faut en premier lieu **s'y abonner** dans BlueMind via la gestion des paramètres : Paramètres > Agenda > Abonnements.

# Limitations connues

### Android : Google Agenda

Sous Android, **tous les agendas partagés remontent dans la même couleur**, rendant impossible la différenciation visuelle des événements par agenda.

**Solution :** Installer une application tierce permettant de choisir des couleurs différentes par agenda.

Exemple d'application testée et validée par BlueMind : [https://play.google.com/store/apps/details?id=net.slintes.android.ccc.full](https://play.google.com/store/apps/details?id=net.slintes.android.ccc.full)

### Samsung : SPlanner

Dans l'application SPlanner de Samsung, tous les agendas partagés sont fusionnés dans l'agenda de l'utilisateur.

**Solution : **installer et utiliser l'application Android par défaut [Google Agenda](https://play.google.com/store/apps/details?id=com.google.android.calendar), couplée avec une application de différenciation de couleurs (voir ci-dessus).

NB : avec certains appareils/versions les événements des agendas secondaires n'apparaissent pas du tout dans l'application SPlanner

