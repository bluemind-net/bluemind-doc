---
title: "Messagerie multi-domaines"
confluence_id: 57771242
sidebar_position: 30
---
# Messagerie multi-domaines

BlueMind peut héberger plusieurs messageries totalement cloisonnées, sur une même infrastructure (un ou plusieurs serveurs, physiques ou virtualisés). 
Ce principe, appelé **multi-domaines** ou multi-tenant, peut être utilisé dans des infrastructures clouds ou simplement pour faire cohabiter plusieurs messageries.

Si, techniquement, cette **infrastructure multi-domaines** correspond à une seule installation, fonctionnellement, chaque domaine de cette infrastructure doit être considéré comme une messagerie à part, indépendante et isolée des autres domaines.


## Domaine(s) et alias de domaines

Un **domaine** est identifié par son **nom de domaine principal** (tel que [mail.bluemind.net](http://mail.bluemind.net)).

Chaque domaine peut avoir un ou plusieurs alias de domaine : il s'agit d'autres noms de domaines ou des sous-domaines (tel que [webmail.bluemind.net](http://webmail.bluemind.net) ou [mail.bluemind.fr](http://mail.bluemind.fr)) qui sont alors hébergés sur le même domaine. Dans ce cas, il n'y a pas de cloisonnement de ces messageries.
Ces domaines peuvent :

- constituer des alias, chaque utilisateur pouvant exister sur un ou plusieurs domaines alias (l'utilisateur peut ainsi recevoir des messages sur chacun des domaines sur lesquels son adresse a été définie)
- constituer des services de messagerie différents, mais pas totalement cloisonnés. Ainsi, par exemple, pour deux sociétés ayant le même directeur, il est possible d'avoir un seul service de messagerie et seul le directeur a un compte sur les deux domaines. Il a ainsi un seul agenda qu'il peut partager à des utilisateurs de l'un ou l'autre des domaines. Dans une telle configuration, tous les utilisateurs ont une adresse e-mail sur le domaine principal.

## Critères de sélection dans une architecture multi-domaines

Sur un même domaine de messagerie, les données ne sont pas cloisonnées.
Les droits unitaires permettent toutefois de masquer ou cloisonner les données utilisateurs selon les droits gérés par les administrateurs et les utilisateurs eux-mêmes.

Sur des domaines cloisonnés d'une infrastructure multi-domaines, les données sont totalement cloisonnées.
Les messageries sont étanches, il n'est pas possible de partager des données (voir ci-dessous pour quelques exemples de partage possibles).

### Partage d'informations entre messageries

Les fonctionnalités collaboratives des messageries permettent généralement d'ouvrir certaines données et informations vers d'autres systèmes. C'est le cas de la solution BlueMind, pour laquelle des mécanismes de partage peuvent être mis en œuvre avec d'autres messageries, et, bien entendu, avec d'autres domaines d'une messagerie BlueMind.


:::tip

Précision

Dans ces exemples, agendas et carnets d'adresses peuvent être rendus visibles à tout ou partie des utilisateurs.

:::

### Partager des agendas individuels

Les fonctionnalités de publication des agendas vers l'extérieur permettent d'accéder à un agenda BlueMind depuis un autre domaine BlueMind (voir [Le partage d'agenda](../../Guide_de_l_utilisateur/L_agenda/Partager_un_calendrier.md)).

Cas d'utilisation : un directeur de deux entités qui sont sur des domaines séparés peut consulter son agenda du premier domaine sur le second via le partage de son url (publique ou privée), il peut aussi le partager avec ses collaborateurs de l'un ou de l'autre.

### Partager des agendas de domaine

Un agenda de domaine (créé par un administrateur) peut être partagé vers un autre domaine BlueMind de la même façon.

Cas d'utilisation : un agenda marketing commun à deux filiales est consulté sur deux domaines séparés. Il est alimenté par les utilisateurs de l'un de ces domaines. Il peut ensuite être publié et consulté depuis l'autre domaine en créant un nouvel agenda de type externe auquel est associée l'url de partage.

### Partager des carnets d'adresses

Par l'utilisation des API, il est possible d'exporter un carnet d'adresses d'un domaine BlueMind puis de l'insérer, toujours par API, comme carnet d'adresses d'un autre domaine BlueMind.

Cas d'utilisation : un carnet des élus d'une collectivité est maintenu depuis le domaine de messagerie d'une ville et accessible depuis le domaine de messagerie de la communauté d'agglomération.

## L'administration des domaines

L'espace d'administration des domaines permet à l'administrateur d'accéder aux paramétrages techniques des domaines (adresses des serveurs, alias de domaines, etc.) ainsi qu'aux paramétrages commun et par défaut des utilisateurs (carnets d'adresses, filtres de messages, quotas de stockage, archivage, etc.).

Pour en savoir plus, veuillez consulter la page dédiée à la [Gestion des domaines](../../Guide_de_l_administrateur/Configuration/Gestion_des_domaines/index.md)


