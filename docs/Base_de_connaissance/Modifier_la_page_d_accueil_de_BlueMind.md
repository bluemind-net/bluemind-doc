---
title: "Modifier la page d'accueil de BlueMind"
confluence_id: 57771925
sidebar_position: 60
---
# Modifier la page d'accueil de BlueMind


## Présentation

Par défaut, BlueMind permet de [personnaliser le logo](https://forge.bluemind.net/confluence/display/BM35/Personnaliser+le+logo+de+l+application) de la page d'accueil.

Afin de remplacer la page d'accueil par défaut par une page personnalisée, il est nécessaire d'écrire une extension au service HPS.


:::info

Cette méthode est fournie à titre d'exemple.

Lors des mises à jour, il se peut que l'extension nécessite d'être adaptée à la nouvelle version de BlueMind.

Si une telle extension est présente sur votre installation, nous vous conseillons fortement de tester son comportement sur une plate-forme de pré-production utilisant la version de BlueMind que vous vous apprêtez à mettre en production.

:::

## Pré-requis

Une installation de test de BlueMind à jour de la dernière version disponible.

## Principe

La modification de la page d'accueil de BlueMind se fait via l'écriture d'une extension HPS qui va surcharger le modèle et les ressources de la page d'accueil officielle afin de définir votre propre page d'accueil.

## Initialiser l'extension

### Définition du nom de l'extension

Vous devez définir un nom pour votre extension. Ce nom peut-être composé des caractères *[a-z]* et *.* (point).


:::info

Dans la suite de cette documentation, nous avons choisi le nom *my.sample.loginpage*, pensez à remplacer celui-ci par le nom choisi pour votre extension.

:::

### Création de la structure de l'extension

Se connecter en tant qu'utilisateur *root* sur l'installation de test de BlueMind, puis :

1. exécuter les commandes :


```
mkdir /root/my.sample.loginpage
cd /root/my.sample.loginpage
mkdir META-INF templates web-resources

```


2. créer le fichier `/root/my.sample.loginpage/META-INF/MANIFEST.MF, avec le contenu :`


```
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: my.sample.loginpage
Bundle-SymbolicName: my.sample.loginpage
Bundle-Version: 1.0.0
Bundle-Vendor: bluemind.net
Fragment-Host: net.bluemind.webmodules.loginapp
Bundle-RequiredExecutionEnvironment: JavaSE-1.8
```


:::info

Pensez à adapter les lignes `Bundle-Name` et `Bundle-SymbolicName` en fonction du nom choisi pour votre extension

:::


## Définir votre page d'accueil

La page d'accueil se compose de 2 grand types de données :

- **le code HTML** de la page sous forme de modèle
- **les ressources** référencées par votre page (images, css...)


### HTML

Le code HTML de la page doit être placé dans le fichier `templates/login.xml`. Ce fichier modèle sera analysé par BlueMind qui y placera des données dynamiquement.

Ce modèle doit contenir dans la section `<body>` le code du formulaire d'authentification d'origine. Pour obtenir ce code dans sa dernière version à jour, rendez-vous sur [la page login.xml de notre dépôt git](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/templates/login.xml) et recopiez les sections suivantes :

1. la section `de <#if authErrorMsg??>` à `</#if>` (balises incluses)
2. la section du formulaire en lui-même : de `<form>` à `</form>` (balises incluses)


De plus, la balise `</body>` du modèle doit être précédée par :


```
${jsRuntime}
```


### Ressources

Les ressources de votre page d'accueil -  telles que les images, les feuilles CSS... - doivent-être placées dans le dossier `web-resources`.

Vous pouvez référencer les ressources directement à partir de ce répertoire dans le code HTML. Par exemple pour insérer la ressource `web-resources/sample.jpg` depuis le modèle `templates/login.xml` :


```
<img src="sample.jpg>Sample image</img>
```


:::tip

Si vous créez une arborescence de dossiers, utilisez la notation relative pour les référencer en considérant toujours `web-resources` comme répertoire racine. Par exemple, pour une feuille CSS placée dans `/web-ressources/css/style.css` :


```
<link rel="stylesheet" href="css/style.css" />
```


NB : notez que l'arborescence **ne commence pas** par '/', qui pointerait vers la racine du site web

:::

Vous pouvez trouver les ressources par défaut sur notre dépôt git : [https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/web-resources](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/web-resources)

## Générer et installer l'extension

Se connecter en tant qu'utilisateur *root* sur l'installation de test de BlueMind, puis :

1. générer l'extension :


```
cd /root/my.sample.loginpage
/usr/lib/jvm/bm-jdk/bin/jar cvfm /root/my.sample.loginpage\_1.0.0.jar META-INF/MANIFEST.MF .
```


2. installer l'extension :


```
cd /usr/share/bm-hps/extensions
mkdir my.sample.loginpage
mv /root/my.sample.loginpage\_1.0.0.jar my.sample.loginpage/
```


3. re-démarrer le service HPS :


```
/etc/init.d/bm-hps stop
rm -rf /var/lib/bm-hps
/etc/init.d/bm-hps start
```


Connectez-vous ensuite à BlueMind, votre page doit s'afficher à la place de la page standard de BlueMind.


:::info

Si la page ne s'affiche pas, forcez un rafraîchissement en maintenant la touche *shift* appuyée tout en rechargeant la page.

Vous pouvez utiliser un navigateur en mode de navigation privée pour éviter les éventuels effets de cache.

:::

## Notes

### Exemple

Le code du plugin *my.sample.loginpage* décrit dans cette documentation est accessible sur ce site : [https://github.com/bluemind-net/loginapp-plugin-sample/tree/master/my.sample.loginpage](https://github.com/bluemind-net/loginapp-plugin-sample/tree/master/my.sample.loginpage)

Pour la tester:

1. télécharger l'extension générée depuis ce lien : [https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar](https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar)
2. se référer aux étapes 2 et 3 du paragraphe [Générer et installer l'extension](#Modifierlapaged'accueildeBlueMind-buildAndInstall)


:::info

Le contenu de l'[extension générée](https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar) peut-être modifié directement depuis un logiciel supportant le format de compression zip (winzip par exemple).

Vous pouvez remplacer le fichier modèle `templates/login.xml`, ainsi qu'ajouter ou supprimer des resources dans le dossier `web-resources`.

:::

