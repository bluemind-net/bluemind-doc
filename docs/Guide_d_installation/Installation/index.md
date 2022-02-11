---
title: "Installation"
confluence_id: 57771188
position: 42
---
# Installation


# Présentation
:::important

Nom de domaine technique "xxx.internal"

En fin de procédure d'installation, un domaine technique nommé "xxx.internal" apparait en lieu et place du nom de domaine saisi, qui est quant à lui positionné en alias.

Il s'agit d'un fonctionnement normal mis en place à partir de la version 4.3 de BlueMind : le nom de domaine principal n'étant pas modifiable mais les alias l'étant, ce fonctionnement permet de modifier le nom de domaine choisi lors de l'installation à tout moment par la suite.

La visibilité de ce nom de domaine est temporaire ; il sera masqué dans les versions futures de BlueMind : le fonctionnement sera le même, mais il sera rendu transparent, seul le nom de domaine choisi et ses alias apparaitront dans la console d'administration.

:::


# Pré-requis

Avant de commencer l’installation : Vérifier les [Pré-requis à l'installation de BlueMind](/Guide_d_installation/Prérequis_à_l_installation/)

# Installation

1 
Télécharger le script d’installation correspondant à votre version de Linux sur le [site de téléchargement de BlueMind](https://download.bluemind.net/bm-download/)

1 
Exécuter ce script en tant que root et suivre les étapes d'installation :


```
sudo sh bluemind-installer-xxx.bin
```


# Terminer l’installation

Une fois BlueMind installé, procéder à la [Configuration post-installation](/Guide_d_installation/Configuration_post_installation/)


