---
title: "Contribuer à BlueMind"
confluence_id: 57771878
position: 42
---
# Contribuer à BlueMind


# Règles de contribution

BlueMind est un projet Open Source, aussi les contributions sont les bienvenues et sont même encouragées !

Les modifications sont à fournir sous forme de patch dans un premier temps.
Envoyez-nous avant ou en même temps (mais mieux vaut avant pour éviter un rejet ou une incompréhension) le descriptif de vos modifications : objet, aspect fonctionnel, pour les aspects graphiques mieux vaut montrer un mockup en amont.
Nous portons une très grande attention à la qualité du logiciel (code, architecture, mais aussi ergonomie et cohérence globale), aussi nous appliquons cette rigueur à tout code ou fonctionnalité entrant dans BlueMind. Nous n'acceptons pas toutes les fonctionnalités et sommes exigeants sur leur ergonomie et leur présentation.


Au niveau juridique le code est Open Source (Affero GPL) et pour toute contribution dans le produit générique, vous devez signer un *copyright assignment* qui donne à BlueMind la co-propriété de ce code (vous gardez aussi bien sûr votre propriété). L'idée est simple, et la même qu'applique la Free Software Foundation ([http://www.gnu.org/licenses/why-assign.html](http://www.gnu.org/licenses/why-assign.html)) : nous souhaitons garantir la pérennité de BlueMind et donc garder la maîtrise de l'ensemble

Le document à signer est le suivant :

- Pour les particuliers : [BlueMind Individual Contributor Assignment Agreement-v1.0-VF.pdf](../attachments/57771878/57771879.pdf) ([English version](../attachments/57771878/57771880.pdf))
- Pour les sociétés et organisations : [BlueMind Entity Contributor Assignment Agreement-v1.0-VF.pdf](../attachments/57771878/57771881.pdf) ([English version](../attachments/57771878/57771882.pdf))


# Environnement de développement

La mise en place d'un environnement de développement pour BlueMind se fait en quelques étapes simples :

1 Installer BlueMind sur la machine de développement afin d'initialiser la base de données et la configuration.Pour cela, se référer au [Guide d'installation](/Guide_d_installation/)
1 
Récupérer les sources de BlueMind en clonant sur votre machine la version disponible dans les dépôts git :


```
git clone https://forge.bluemind.net/stash/scm/bm/bluemind-public.git
```

:::important

Vous pouvez utiliser la commande ci-dessus avec l'option `--depth 1` afin de récupérer un clone sans historique.

:::

NB : le dépôt peut être consulté en ligne à cette adresse : [https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public)

1 
[Installer Eclipse](/Guide_du_développeur/Configuration_de_l_environnement_de_développement/Eclipse/)


# Traduction du logiciel

Vous pouvez participer à enrichir la traduction de BlueMind dans une ou plusieurs langues au moyen du site [BlueMind Translate](https://forge.blue-mind.net/weblate/)

# MarketPlace BlueMind : outils et add-ons complémentaires

Vous avez développé ou voulez développer autour de BlueMind :

- add-ons sur le coeur du produit grâce aux points d'extension
- intégration avec des solutions externes
- outils d'intégration avec le système


Il est aussi possible de contribuer à BlueMind en développant des *add-ons* (modules complémentaires) ou programmes complémentaires et en les partageant avec la communauté BlueMind au moyen du [MarketPlace](https://marketplace.bluemind.net/).

Pour publier sur notre MarketPlace, contactez-nous : [https://www.bluemind.net/contact/](https://www.bluemind.net/contact/).

Vous pouvez aussi automatiser la publication de votre outil sur notre marketplace grâce à son API. Consultez notre page dédiée : [Utilisation de l'API Marketplace](/Guide_du_développeur/Utilisation_de_l_API_MarketPlace/).


