---
title: "Configuration des clients de messagerie instantanée"
confluence_id: 57770743
position: 52
---
# Configuration des clients de messagerie instantanée


## Présentation

L'utilisation du protocole XMPP permet aux utilisateurs de connecter leur logiciel dédié à la messagerie instantanée de BlueMind et ainsi de pouvoir discuter avec les autres utilisateurs, qu'ils utilisent la messagerie instantanée intégrée ou un autre logiciel dédié eux aussi, quel qu'il soit.


##  Thunderbird

1. Aller dans le menu de Thunderbird ![](../../attachments/57770743/66094998.png) > Outils > État de messagerie instantanée > Afficher les comptes...

2. Ouverture de l'assistant de création de compte :
    - Si aucun compte n'existe, l'assistant s'ouvre automatiquement
    - Si au moins un compte existe déjà, cliquer sur «Nouveau compte» en bas à gauche de la fenêtre de gestion des comptes
3. Choisir «XMPP» et cliquer sur «Suivant»
![](../../attachments/57770743/66095007.png)

4. Saisir comme nom d'utilisateur l'adresse de messagerie complète (incluant le nom de domaine)
![](../../attachments/57770743/66094994.png)

5. Saisir le mot de passe de messagerie
![](../../attachments/57770743/66094995.png)

6. L'alias local demandé ensuite est facultatif, il ne sera visible que par vous.
![](../../attachments/57770743/66094996.png)
Options XMPP :

    - Ressource > facultatif
    - Priorité > facultatif
    - Sécurité de la connexion > Nécessite un chiffrement
    - Serveur > l'adresse est identique à celle de BlueMind
    - Port > 5222
7. Écran Résumé > décocher «Se connecter à ce compte maintenant» sans quoi la fenêtre d'acceptation du certificat ne sera pas proposée par Thunderbird lors de la première connexion.![](../../attachments/57770743/66094997.png)


## Pidgin

1. Aller dans le menu Comptes > «Gérer les comptes» et cliquer sur le bouton «Ajouter...»
2. Dans l'onglet «Essentiel» remplir les informations de connexion :![](../../attachments/57770743/66094993.png)
    - Protocole : XMPP
    - Utilisateur : nom d'utilisateur seul
    - Domaine : domaine du serveur BlueMind
    - Ressource : facultatif
    - Mot de passe : mot de passe de l'utilisateur
NB : Les «options de l'utilisateur» sont facultatives elles permettent notamment de définir un avatar et un nom d'affichage, qui ne sera pas visible des correspondants.3. Dans l'onglet «Avancé», remplir les informations concernant le serveur :![](../../attachments/57770743/66094999.png)
    - Sécurité de la connexion : «Nécessite un chiffrement»
    - Port de connexion : 5222
    - Serveur de connexion : adresse complète du serveur BlueMind, généralement identique à l'adresse de l'application web


## Gajim

1. Ouverture de l'assistant de création de compte :
    - Lors du lancement de Gajim, si aucun compte n'existe, la fenêtre de création est automatiquement proposée
    - Sinon, se rendre dans le menu Édition > Comptes > cliquer sur «Ajouter»
2. Choisir «J'ai déjà un compte que je veux utiliser» et cliquer sur «Suivant»![](../../attachments/57770743/66095000.png)
3. Saisir les informations de connexion de l'utilisateur puis cliquer sur «Suivant» :![](../../attachments/57770743/66095001.png)
    - identifiant Jabber : première puis deuxième partie de l'adresse de messagerie de l'utilisateur
    - mot de passe : identique au mot de passe de messagerie
4. Une fois le compte créé, cliquer sur «Avancées» :![](../../attachments/57770743/66095002.png)
5. Se rendre dans l'onglet «Connexion» et cocher «Utiliser un nom d'hôte/port personnalisé» afin de saisir les informations du serveur :![](../../attachments/57770743/66095003.png)
    - Nom d'hôte : adresse complète du serveur BlueMind, généralement identique à l'adresse de l'application web

    - Port : 5222
6. Cliquer sur «Fermer» pour revenir à l'interface principale de Gajim
7. Lors de la première connexion (passage au statut «Disponible» par exemple), un avertissement apparaît concernant le certificat de sécurité. Valider l'ajout du certificat afin de pouvoir se connecter :![](../../attachments/57770743/66095004.png)


