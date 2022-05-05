---
title: "Les identités"
confluence_id: 57770334
position: 48
---
# Les identités


## Présentation

BlueMind permet de créer plusieurs identités pour un même compte utilisateur.

Lorsque plusieurs identités ont été créées, l'utilisateur peut sélectionner l'identité (et donc l'adresse) utilisée pour envoyer un e-mail.

Ces identités peuvent être associées :

- à l'adresse principale
- à un des alias de l'utilisateur
- à une adresse correspondant à une boite partagée


Une identité par défaut peut être définie et sera sélectionnée par défaut lors de la création d'un nouveau message.


## Gérer les identités

Pour accéder à la gestion des identités, se rendre dans l'interface de gestion des paramètres utilisateurs :![](../../attachments/57770060/57770071.png)

Puis aller à la rubrique Messagerie > onglet Identités.

![](../../attachments/57770334/57770341.png)

Par défaut l'utilisateur possède une identité avec son adresse de messagerie et son nom d'utilisateur (prénom+nom).
Sa signature possède un label mais elle est vierge.

- Pour créer une identité, cliquer sur le bouton "Ajouter identité" en bas du formulaire
- Pour modifier une identité, cliquer sur le lien "Mettre à jour" en fin de ligne


Les deux actions mènent au même formulaire de gestion d'une identité :

![](../../attachments/57770334/57770339.png)

- **Le nom de l'expéditeur** est le nom qui apparaîtra dans les messages envoyés par l'utilisateur
- **Le label de la signature** sert à la distinguer dans la liste des identités, une même adresse et un même nom d'affichage pouvant être utilisés dans plusieurs identités
- L'utilisateur peut **choisir parmi toutes les adresses** de messagerie qui lui sont affectées ou partagées : alias de domaines, boites partagées, etc.


:::tip

En cochant la case « Utiliser une adresse courriel externe » vous pouvez créer une identité pour une adresse hors BlueMind.

Pour que cette option soit disponible, l'administrateur doit accorder le rôle "Messagerie > Identité externe" à l'utilisateur.
Pour en savoir plus sur l'affectation des droits, consultez la page du [Guide de l'administrateur](/Guide_de_l_administrateur/) > [Utilisateurs](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/)

:::

- Choisir le **format de la signature** (HTML ou non) et la remplir.

- **La case « Utiliser le dossier "Messages envoyés" de "&lt;identifiant>" »** permet de forcer l'utilisation du dossier envoyés du compte (utilisateur ou boîte partagée) correspondant à l'adresse email sélectionnée dans le champs "Courriel". Si cette case n'est pas cochée, c'est le dossier des messages envoyés par défaut de l'utilisateur qui sera utilisée.
- **Valider**


:::info

Une fois les identités créées, il faut enregistrer les modifications avec le bouton "Enregistrer" en bas de page pour qu'elles soient prises en compte.

:::


:::tip

Un utilisateur peut créer plusieurs identités avec le même nom d'expéditeur pour une même adresse de messagerie, par exemple pour écrire à des destinataires sous différents formats : signature HTML complète pour les messages professionnels, sans signature pour les messages personnels, signature simple au format texte pour les listes de diffusion...

La signature est alors l'élément différenciateur de ces identités et son label permet de les reconnaître dans la liste des identités :

![](../../attachments/57770334/57770337.png)

:::


## Identités et boites partagées

Lorsqu'un utilisateur est rattaché à une boite partagée avec les droits de modification ou de gestion, il peut alors se créer une identité afin d'utiliser cette boite en tant qu'expéditeur de messages.

Pour cela, dans la gestion des identités (voir ci-dessus) :

- Cliquer sur le bouton "Ajouter une identité"
- Saisir un nom d'expéditeur
- Choisir dans la liste des adresses de messagerie disponibles l'adresse de la boite partagée
- Les informations de signature de la boite partagée sont alors automatiquement insérées.
Ces informations correspondent à celles saisies par l'administrateur dans l'identité par défaut de la boite partagée.


:::info

Si une boite partagée possède plusieurs adresses mails, toutes apparaissent dans la liste des adresses disponibles mais seules les données de l'identité par défaut de la boite seront insérées, qu'il y ait ou non une identité correspondant à cette adresse dans la configuration de la boite partagée.

:::

- Choisir le dossier à utiliser pour le stockage des messages envoyés : cocher la case pour utiliser le dossier de la boîte partagée ou la laisser décochée pour utiliser le dossier par défaut de l'utilisateur
- Valider


