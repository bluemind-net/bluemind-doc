---
title: "Restaurer les messages supprimés par un utilisateur"
confluence_id: 66096543
position: 74
---
# Restaurer les messages supprimés par un utilisateur


## Présentation

À partir de BlueMind 4.4, la corbeille est dite "à double fond" : elle propose un délai côté serveur pendant lequel les emails effacés sont conservés. Ainsi pendant ce délai une récupération peut être effectuée par l'utilisateur directement depuis son client Oulook (connecté en mapi) ou par l'administrateur depuis le serveur en ligne de commande.


## Procédure

Lorsqu'un email est supprimé par l'utilisateur, le serveur de messagerie cyrus ne supprime pas immédiatement le message : le message est marqué comme supprimé et n'est plus disponible mais le fichier est conservé.

Les clients IMAP peuvent exécuter la commande "expunge" afin de lancer la suppression immédiate des messages (par exemple via l'option "vider la corbeille") mais là aussi cyrus est capable d'ajouter un délai entre le moment où l'utilisateur demande l'expunge et la suppression définitive réelle du message sur le serveur.

Ainsi, la nouvelle commande bm-cli permet pendant ce délai de récupérer les messages :


```
bm-cli mail unexpunge
```


:::tip

Pourquoi ne pas utiliser la commande cyrux unexpunge ?

La commande bm-cli est nécessaire car la commande cyrus "unexpunge" permettant de faire en apparence la même chose ne renvoie pas des informations suffisantes au protocole de réplication et casse le lien entre Cyrus et BlueMind.

:::

#### Restauration des messages d'un utilisateur

L'utilisateur John Doe (identifiant jdoe@bluemind.loc) demande la récupération des emails supprimés dans les 2 jours qui viennent de passer. On utilisera la commande suivante :


```
#> bm-cli mail unexpunge --days 2 jdoe@bluemind.loc
Folder has 1 deleted message(s)
Recovering messages less than 2 day(s)) old
+-----+---------+---------+------------------------------+
| id  | subject | preview | last-modification            |
+-----+---------+---------+------------------------------+
| 406 | Contact |   Boss  | Mon Jan 18 11:36:54 GMT 2021 |
+-----+---------+---------+------------------------------+
Checked 1 deleted item(s), will restore 1 item(s)
```


#### Restauration des messages d'une boîte partagée

Pour restaurer les messages d'une boîte partagée, il est nécessaire de s'authentifier en tant qu'un utilisateur ayant droit de lecture sur celle-ci. Il faut alors rajouter le paramètre `authn` à la commande.

Exemple : on souhaite restaurer les messages effacés depuis hier dans la boite Contact (contact@bluemind.loc) sur laquelle John Doe a un droit de gestion


```
#> bm-cli mail unexpunge --days 1 --authn jdoe@bluemind.loc contact@bluemind.loc

Folder has 1 deleted message(s)
Recovering messages less than 1 day(s)) old
+-----+---------+---------+------------------------------+
| id  | subject | preview | last-modification            |
+-----+---------+---------+------------------------------+
| 203 |  Coucou |    XMen | Tue Jan 19 15:22:34 GMT 2021 |
+-----+---------+---------+------------------------------+
Checked 1 deleted item(s), will restore 1 item(s)
```


## Pour aller plus loin

### Configuration

Le délai maximum entre une commande `expunge` et la récupération `unexpunge` est configurée dans Cyrus `/etc/cyrus.conf` sous la commande `delprune`, paramètre -X.

Le délai par défaut est de 7 jours.

### Utilisation

Il est possible d'utiliser divers paramètres pour affiner la récupération :

- days : le nombre de jours à restaurer
- dry : teste la commande sans exécuter réellement la récupération
- folder : préciser un répertoire particulier
- id : l'id d'un message donné


Pour plus de détails sur les options disponibles et leur usage, consultez l'aide en ligne de la commande :


```
# bm-cli mail help unexpunge
```


