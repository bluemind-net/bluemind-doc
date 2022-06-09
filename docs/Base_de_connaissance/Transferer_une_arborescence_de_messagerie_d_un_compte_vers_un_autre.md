---
title: "Transférer une arborescence de messagerie d'un compte vers un autre"
confluence_id: 57771958
sidebar_position: 78
---
# Transférer une arborescence de messagerie d'un compte vers un autre


## Objectif

Suite au départ d'un utilisateur ou pour une reprise d'activité par exemple, on souhaite transférer les messages d'un utilisateur vers un collaborateur. On souhaite récupérer les messages avec la même arborescence de dossier sans avoir à la recréer manuellement.

Problèmes rencontrés :

- le webmail BlueMind ne permet pas de copier/déplacer les dossiers depuis une boîte partagée ou un autre utilisateur
- les clients lourds, même avec des extensions d'import/export gèrent mal voire pas du tout la copie de dossiers d'un compte à un autre


## Solutions

### Réaliser une restauration d'utilisateur

BlueMind propose des scripts permettant de restaurer une boîte vers une autre boîte : [Restauration du contenu d'une boîte utilisateur ou partagée](/Base_de_connaissance/Restauration_du_contenu_d_une_boite_utilisateur_ou_partagee/)

L'arborescence complète de l'utilisateur est alors recréée dans un sous-dossier de l'utilisateur cible qui peut alors déplacer à sa guise des dossiers, messages ou encore supprimer ceux qu'il ne souhaite pas conserver.
Pour des raisons de confidentialité, si besoin, l'administrateur peut effectuer cela à sa place dès la fin de la restauration.

### Réaliser un import par imapsync

L'import au moyen d'[imapsync](https://github.com/imapsync/imapsync), plus complexe, permet un paramétrage plus fin, notamment par l'exclusion de dossiers.

BlueMind met à votre disposition un guide pour vous aider à réaliser un import : [doc-bluemind-imapsync.pdf](../attachments/57771958/57771959.pdf)

