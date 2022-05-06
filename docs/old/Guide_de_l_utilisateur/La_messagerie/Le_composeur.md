---
title: "Le composeur"
confluence_id: 57770262
position: 42
---
# Le composeur


## Présentation

![](../../attachments/57770262/57770277.png)

- ![](../../attachments/57769989/69896475.png) : cette zone propose les boutons d'actions pour le message : envoyer, annuler, joindre un fichier, ajouter la signature, sauvegarder
- ![](../../attachments/57769989/69896474.png) : cette zone permet d'accéder aux contacts de l'utilisateur afin de les ajouter en destinataires du message (destinataire principal, copie ou copie cachée)
- ![](../../attachments/57769989/69896473.png) : cette zone présente les champs d'adresses ainsi que l'objet du message.
    - L'utilisateur peut y sélectionner [l'identité](/Guide_de_l_utilisateur/La_messagerie/Les_identités/) avec laquelle il souhaite envoyer son message.
    - Les champs de destinataires (cliquer sur (Cc) ou (Cci) pour faire apparaître les champs correspondants) peuvent être remplis depuis les contacts ![](../../attachments/57769989/69896474.png) ou directement en écrivant dedans. L'autocomplétion propose les contacts correspondants.
- ![](../../attachments/57769989/69896472.png) : zone de rédaction du message.
    - Une barre d'outil permet de mettre en forme le message.
    - Sur la droite se trouve la gestion des pièces jointes : cliquer sur "Joindre un fichier" ou glisser-déposer pour ajouter une pièce jointe au message.
    - Des paramètres avancés sont accessibles au bas de la zone de rédaction pour plus d'options d'expédition.


## Destinataires du message

- Le champs «** À **» permet de saisir le ou les destinataires principaux du message.

- 2 liens permettent d'ajouter des destinataires : ![](../../attachments/57770262/57770275.png) et ![](../../attachments/57770262/57770274.png)

    - **CC** : destinataires en copie (« Copie Carbone »)

    - **CCi** : destinataires en copie **cachée** (« Copie Carbone invisible »)

- 2 autres liens permettent d'ajouter des champs particuliers :
    - **Répondre à** : permet de préciser une ou plusieurs adresses qui seront utilisées lorsque le destinataire utilisera la fonction "Répondre"
    - **Faire suivre à** : permet de préciser une ou plusieurs adresses qui seront ajoutées lorsque le destinataire utilisera la fonction "Répondre à tous"


:::info

Autocomplétion

Sur la base des premiers caractères saisis, les champs de destinataires proposent des résultats par recherche dans les carnets d'adresses de l'utilisateur et dans l'annuaire.

:::

## Pièces jointes

Pour ajouter des pièces jointes :

- Cliquer sur le bouton ![](../../attachments/57770136/57770141.png) qui ouvre un navigateur de fichiers

- **Glisser** un ou plusieurs fichiers depuis le navigateur de fichier et le **déposer** dans la partie droite de la fenêtre d'édition.


Pour supprimer une pièce jointe :

- cliquer sur l'icône ![](../../attachments/57770262/57770271.png) correspondante


## Paramètres avancés

Le lien ![](../../attachments/57770136/57770139.png) en bas de message permet d'ouvrir le volet des options avancées permettant de :

- Choisir le **mode d'édition** : les messages sont par défaut édités en mode HTML, avec mise en forme. Pour utiliser un mode d'édition sans mise en forme, sélectionner le type d'éditeur « texte brut »

- Modifier la **priorité** du message

- Demander un **accusé de réception** (lorsque le destinataire ouvre le message et s'il accepte l'envoi de l'accusé)

- Demander la **notification de l'état de distribution** (le serveur du destinataire a reçu le message)

- Choisir un dossier différent du dossier «Messages envoyés» pour la **copie du message envoyé**


## Sauvegarde du message

- Les messages en cours de rédaction sont sauvegardés automatiquement à intervalles réguliers.

- Pour **forcer la sauvegarde d'un message en cours de rédaction**, cliquer sur le bouton ![](../../attachments/57770262/57770269.png)  « **Enregistrer ce brouillon** ».
Le message est alors sauvegardé dans le dossier « **Brouillons** ».

- Le bouton ![](../../attachments/57770262/57770268.png) « **Insérer la signature** » permet d'ajouter au message la signature associée à l'identité utilisée

- Le champ « **De **», qui correspond à l'expéditeur, est prérempli avec l'identité par défaut de l'utilisateur.
Sélectionner une autre [identité](/Guide_de_l_utilisateur/La_messagerie/Les_identités/) si désiré.


## Envoi du message

Cliquer sur le bouton ![](../../attachments/57770136/57770140.png) en haut à gauche de la fenêtre de composition

## Signature d'entreprise

### Présentation

Lors de l'insertion des destinataires, si des [signatures d'entreprises](/Guide_de_l_administrateur/Configuration/Signatures_d_entreprise/) sont paramétrées et correspondent aux critères d'expéditeurs et destinataires pour l'email, alors un encadré informe de l'ajout d'une signature et présente celle-ci :

![](../../attachments/57770262/57770265.png)

Cela permet à l'utilisateur de contrôler quelle est la signature utilisée, dans le cas où plusieurs signatures sont paramétrées et pourraient lui correspondre (s'il est membre de plusieurs groupes par exemple ou si une signature événementielle temporaire est mise en place).

### Placement de la signature

La signature est placée par défaut à la toute fin du message. Néanmoins, certains paramétrages permettent d'optimiser ce placement.

Si le gestionnaire de la signature a activé l'option permettant à l'utilisateur de placer la signature, la chaîne "--X-BM-SIGNATURE–" apparaît là où la signature apparaîtra. Cette information est intéressante en particulier lors d'une réponse à un fil de discussion :

![](../../attachments/57770262/57770266.png)

Ainsi, l'utilisateur peut déplacer la signature en déplaçant simplement cette chaine de façon simple :

- sélectionner/déplacer
- ou couper/coller
- ou supprimer/réécrire.


:::info

Suppression des signatures multiples

Afin d'épurer les discussions lors de multiples échanges de réponses, les versions précédentes de la signature de l'utilisateur dans le fil des messages pourront être supprimées automatiquement par le système.

Il s'agit là d'une option qui doit être activée par l'administrateur et non d'un comportement par défaut systématique.

:::


