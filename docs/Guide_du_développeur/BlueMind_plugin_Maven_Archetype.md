---
title: "BlueMind plugin Maven Archetype"
confluence_id: 57771893
position: 46
---
# BlueMind plugin Maven Archetype


Afin de simplifier la mise en place d'un projet de plugin BlueMind, un archetype Maven est disponible dans le dépôt BlueMind.

## Créer le projet

Pour créer le projet, exécuter la commande suivante :


```
mvn archetype:generate -DarchetypeRepository=http://forge.blue-mind.net/nexus/service/local/repositories/snapshots/content/
```


Choisissez l'archetype `net.bluemind.sample.parent-archetype`

Le projet est alors créé en mode interactif :


```
groupId: net.bluemind
artifactId: <the general artifactId of the plugin>
version: 1.0-SNAPSHOT
package: <the base java package>
project-artifactId: <the specific artifactId of the plugin implementation>
```


Par exemple, pour créer un plugin "filehosting" qui sera implémenté en utilisant le système de fichier (filesystem) :


```
groupId: net.bluemind
artifactId: net.bluemind.filehosting
version: 1.0-SNAPSHOT
package: net.bluemind.filehosting.filesystem
project-artifactId: filehosting.filesystem
```


:::info

Il n'est pas nécessaire de préfixer l'artifactId par "net.bluemind"

:::

## Construire le projet

Le projet créé contiendra un projet maven parent contenant lui-même 2 sous-modules : un pour l'implémentation, l'autre pour les tests unitaires et d'intégration.

Toutes les dépendants nécessaires à BlueMind et les librairies tierces sont automatiquement ajoutées dans le manifeste.

Pour construire le projet, exécuter la commande suivante depuis le répertoire racine de votre nouveau projet :


```
maven clean install
```


