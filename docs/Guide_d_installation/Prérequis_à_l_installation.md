---
title: "Prérequis à l'installation"
confluence_id: 57771186
sidebar_position: 40
---
# Prérequis à l'installation

## Système

**Mémoire RAM**

**12 Go** minimum avec la configuration par défaut

**CPU**

**2 vCPU** minimum

**Locales**

La locale en_US.UTF-8 doit être installée et générée (même si le système est en français).

Pour vérifier sa bonne installation, utiliser la commande suivante :


```
$ locale -a|grep en\_US
en\_US.utf8
```


:::tip

Astuce

Si la locale n'est pas présente, vous pouvez l'ajouter sous Ubuntu avec la commande suivante :


```
# locale-gen en\_US.utf8
```


:::


**Distribution Linux**


:::info

**L’installation de BlueMind nécessite un serveur ou une machine virtuelle vierge et dédié(e).**

:::


:::info

Virtualisation

BlueMind ne supporte pas la technologie de virtualisation LXC, il faut lui préférer KVM.

:::


BlueMind nécessite une **version 64-bit** des distributions supportées (pour Ubuntu, s'assurer d'avoir la version Serveur)  :

- Ubuntu 18.04 LTS Server (Bionic Beaver)
- Ubuntu 20.04 LTS Server (Focal Fossa)
- Ubuntu 22.04 LTS Server (Jammy Jellyfish)
- RedHat Entreprise Linux / CentOS 7
- RedHat Entreprise Linux / Rocker Linux 8 / AlmaLinux 8
- Debian 9 Stretch
- Debian 10 Buster


:::info

Debian/Ubuntu : Signature des dépôts

Les dépôts sont signés pour toutes les distributions Ubuntu/Debian supportées, ceci étant obligatoire pour Ubuntu 18.04 et Debian 9.

Il est possible, si nécessaire ou désiré, d'importer manuellement la clé sur l'ensemble de nos distributions supportées via la commande suivante :


```
curl https://pkg.bluemind.net/bluemind-deb.asc | apt-key add -
```


Sans cela, un warning peut survenir lors de la mise à jour de certaines versions précédentes **sans que cela gêne pour autant la mise à jour**.

:::


:::info

Ubuntu : dépôts universe

Pour les distributions Ubuntu, l'installation de Bluemind requiert les dépôts **universe**. Il est possible de les ajouter facilement à l'aide des commandes suivantes :


```
add-apt-repository universe
apt update
```


:::


**Configuration système**

Afin de s'assurer que le script d'installation pourra lancer des commandes avec élévation de privilèges (*sudo*), la directive `requiretty` ne doit pas être activée dans le fichier de configuration `/etc/sudoers`. Si elle est présente, il convient de la supprimer ou la mettre en commentaire.

## Réseau & DNS

### Adresse IP

Le serveur doit avoir une adresse IP fixe, définie statiquement au niveau système ou fournie par un serveur DHCP.

### Hostname

Le hostame du serveur BlueMind doit être correctement configuré, et le serveur accessible par ce nom depuis une autre machine.

En particulier, BlueMind attend les résultats suivants à la commande hostname :


```
$ hostname -s
mail
```


  ![](../attachments/57769989/69896490.png) doit afficher le nom court du système, par exemple ici : mail


:::info

Pour les versions **antérieures à 4.0.5** le nom court doit être renvoyé par la commande `hostname` sans option :


```
$ hostname
mail
```


À partir de BlueMind 4.0.5, le retour de cette commande sans option est sans importance.

:::


```
$ hostname -f
mail.bluemind.net
```

![](../attachments/57769989/69896490.png) doit afficher le nom complet du système, par exemple ici : mail.bluemind.net

Le hostname doit aussi correctement être déclaré sur l'adresse IP dans le fichier `/etc/hosts` du serveur :


```
IP\_SERVER mail.bluemind.net mail
```

### Cartes réseaux

Si votre serveur possède plusieurs carte réseaux il faut que la première carte (eth0) soit celle qui porte l'adresse ip externe du serveur BlueMind.

## Partitionnement

Les préconisations suivantes ne sont pas obligatoire mais il est recommandé de les suivre afin de simplifier la maintenance de votre serveur.

| point de montage | description | type NFS | type Block Device |
| --- | --- | --- | --- |
| / | racine | :white_check_mark: | :white_check_mark: |
| /var/spool/cyrus | emails | :x: | :white_check_mark: |
| /var/spool/bm-hsm | emails archivés | :white_check_mark: | :white_check_mark: |
| /var/spool/bm-elasticsearch | index de recherche | :x: | :white_check_mark: |
| /var/spool/bm-mail | envoi des emails via EAS/mapi ~2Go | :white_check_mark: | :white_check_mark: |  
| /var/log | logs (fichiers journaux) | :white_check_mark:  | :white_check_mark: |
| /var/backups/bluemind | sauvegardes | :white_check_mark: | :white_check_mark: |


