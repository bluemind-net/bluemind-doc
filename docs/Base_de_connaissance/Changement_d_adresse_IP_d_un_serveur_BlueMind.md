---
title: "Changement d'adresse IP d'un serveur BlueMind"
confluence_id: 58593019
position: 42
---
# Changement d'adresse IP d'un serveur BlueMind


Le présent document décrit la marche à suivre pour modifier l'adresse IP d'un serveur BlueMind.


:::info

Mise en garde

Cette procédure est volontairement peu détaillée afin d'être réservée à des administrateurs expérimentés qui maîtrisent les opérations sensibles réalisées.

:::

## Procédure

- stopper BlueMind avec la commande


```
bmctl stop
```


- Démarrer postgresql :


```
systemctl start postgresql
```


- Mettre à jour la configuration réseau du serveur avec la nouvelle IP
- Modifier le fichier `/etc/bm/bm.ini` et remplacer l'adresse des paramètres "`host`" et "`hz-member-address`" par la nouvelle adresse IP
- Modifier le fichier `/etc/cyrus-replication` et remplacer l'adresse du paramètre "`core_sync_host`" par la nouvelle adresse IP
- Mettre à jour les informations en base de données avec la ligne de commande suivante :


```
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update t\_server set ip = '<new\_ip>' where ip = '<old\_ip>';"
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update rc\_users set mail\_host = '<new\_ip>' where mail\_host = '<old\_ip>';"
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update t\_systemconf set configuration = configuration || hstore('host','<new\_ip>') || hstore('hz-member-address', '<new\_ip>');"
```

où :

    - &lt;old_ip> est l'ancienne adresse IP

    - &lt;new_ip> la nouvelle

*NB : en cas de demande de mot de passe, taper "bj"*- Modifier l'arborescence de `/var/backups/bluemind` pour renommer le dossier `/var/backups/bluemind/dp_spool/rsync/<old_ip>` avec la nouvelle adresse IP
- Relancer BlueMind et le *node* avec les commandes suivantes :


```
bmctl start
systemctl restart bm-node
```


- Se connecter au panneau d'administration en tant que superadministrateur admin0
- Se rendre dans la partie Sécurité > Gestion du pare-feu et cliquer immédiatement sur le bouton "Enregistrer" pour forcer la re-génération des règles du parefeu BlueMind
- Se rendre dans la partie Gestion du Système > Maintenance des mails, cliquer sur le bouton "Exécuter" pour re-générer les tables de routage de mails postfix
- Se rendre dans la partie Gestion du Système > Configuration Système et remplacer l'ancienne adresse IP du champ "Mes réseaux" par la nouvelle adresse ou plage d'adresse pour laquelle on souhaite être relais ouvert avant de cliquer sur le bouton "Enregistrer"
- Reconfigurer tick à l'aide de la commande  suivante :


```
bm-cli tick reconfigure
```


