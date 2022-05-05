---
title: "Die BlueMind-Startseite bearbeiten"
confluence_id: 57771925
position: 60
---
# Die BlueMind-Startseite bearbeiten


## Präsentation

Standardmäßig kann mit BlueMind [das Logo der Startseite](https://forge.bluemind.net/confluence/display/BM35/Personnaliser+le+logo+de+l+application) angepasst werden.

Um die Standard-Startseite durch eine benutzerdefinierte Seite zu ersetzen, muss eine Erweiterung für den HPS-Dienst geschrieben werden.


:::info

Diese Methode wird als Beispiel angegeben.

Bei Updates muss die Erweiterung eventuell an die neue Version von BlueMind angepasst werden.

Wenn eine solche Erweiterung in Ihrer Installation vorhanden ist, raten wir dringend, ihr Verhalten auf einer Vorproduktionsplattform mit der Version von BlueMind zu testen, die Sie in Produktion nehmen möchten.

:::

## Voraussetzungen

Eine Testinstallation von BlueMind wurde auf die neueste verfügbare Version aktualisiert.

## Prinzip

Die Modifikation der BlueMind-Startseite erfolgt durch das Schreiben einer HPS-Erweiterung, die die offizielle Startseiten-Vorlage und die Ressourcen außer Kraft setzt, um eine eigene Startseite zu definieren.

## Initialisieren der Erweiterung

### Definition des Erweiterungsnamens

Sie müssen einen Namen für Ihre Erweiterung festlegen. Dieser Name kann aus den Zeichen *[a-z]* und *.* (Punkt) bestehen. (Punkt).


:::info

Im Rest dieser Dokumentation haben wir den Namen *my.sample.loginpage* gewählt. Vergessen Sie nicht, ihn durch den für Ihre Erweiterung gewählten Namen zu ersetzen.

:::

### Erstellen der Erweiterungsstruktur

Melden Sie sich als *Root-Benutzer* auf der BlueMind-Testinstallation an und:

1. führen Sie die folgenden Befehle aus:


```
mkdir /root/my.sample.loginpage
cd /root/my.sample.loginpage
mkdir META-INF templates web-resources

```


2. Erstellen Sie die Datei `/root/my.sample.loginpage/META-INF/MANIFEST.MF mit dem Inhalt:`


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

Denken Sie daran, die Zeilen `Bundle-Name` und `Bundle-SymbolicName` entsprechend dem für Ihre Erweiterung gewählten Namen anzupassen

:::


## Definieren Sie Ihre Startseite

Die Startseite besteht im Wesentlichen aus 2 Datentypen:

- **HTML-Code** Seite in Form einer Vorlage
- Den von Ihrer Seite referenzierten **Ressourcen** (Bilder, CSS...)


### HTML

Der HTML-Code der Seite muss in der Datei `templates/login.xml` platziert werden. Diese Modelldatei wird von BlueMind analysiert und die Daten werden dynamisch in die Datei eingefügt.

Diese Vorlage muss im Abschnitt `<body>` den Code des ursprünglichen Authentifizierungsformulars enthalten. Um die neueste Version dieses Codes zu erhalten, gehen Sie zur [Seite login.xml in unserem Git-Repository](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/templates/login.xml) und kopieren Sie die folgenden Abschnitte:

1. den Abschnitt `von <#if authErrorMsg??>` bis `</#if>` (inklusive Tags)
2. den Abschnitt des eigentlichen Formulars: von `<form>` bis `</form>` (inklusive Tags)


Darüber hinaus muss dem Tag `</body>` des Modells Folgendes vorangestellt werden:


```
${jsRuntime}
```


### Ressourcen

Die Ressourcen Ihrer Startseite, z.B. wie Bilder, CSS-Sheets... - müssen im Ordner `web-resources` abgelegt werden.

Sie können im HTML-Code direkt auf Ressourcen aus diesem Verzeichnis verweisen. Zum Beispiel, um die Ressource `web-resources/sample.jpg` aus der Vorlage `templates/login.xml` einzufügen:


```
<img src="sample.jpg>Sample image</img>
```


:::tip

Wenn Sie einen Ordnerbaum erstellen, verwenden Sie die relative Notation, um auf sie zu verweisen, wobei `Web-Ressourcen` immer als Stammverzeichnis betrachtet werden. Zum Beispiel für ein CSS-Sheet, das in `/web-resources/css/style.css` abgelegt ist:


```
<link rel="stylesheet" href="css/style.css" />
```


NB: Beachten Sie, dass die Baumstruktur **nicht** mit '/' beginnt, was auf das Stammverzeichnis der Website verweisen würde

:::

Sie finden die Standard-Ressourcen in unserem Git-Repository: [https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/web-resources](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/web-resources)

## Generieren und installieren Sie die Erweiterung

Melden Sie sich als *Root-Benutzer* auf der BlueMind-Testinstallation an und:

1. die Erweiterung generieren:


```
cd /root/my.sample.loginpage
/usr/lib/jvm/bm-jdk/bin/jar cvfm /root/my.sample.loginpage\_1.0.0.jar META-INF/MANIFEST.MF .
```


2. die Erweiterung installieren:


```
cd /usr/share/bm-hps/extensions
mkdir my.sample.loginpage
mv /root/my.sample.loginpage\_1.0.0.jar my.sample.loginpage/
```


3. den HPS-Dienst neu starten:


```
/etc/init.d/bm-hps stop
rm -rf /var/lib/bm-hps
/etc/init.d/bm-hps start
```


Nach der Anmeldung in BlueMind muss anstelle der Standard-BlueMind-Seite Ihre Seite angezeigt werden.


:::info

Wird die Seite nicht angezeigt, erzwingen Sie eine Aktualisierung, indem Sie die *Shift*-Taste gedrückt halten, während Sie die Seite neu laden.

Sie können einen Browser im privaten Browsing-Modus verwenden, um mögliche Cache-Effekte zu vermeiden.

:::

## Hinweise

### Beispiel

Der Code des in dieser Dokumentation beschriebenen *my.sample.loginpage*-Plugins ist auf dieser Seite verfügbar: [https://github.com/bluemind-net/loginapp-plugin-sample/tree/master/my.sample.loginpage](https://github.com/bluemind-net/loginapp-plugin-sample/tree/master/my.sample.loginpage)

Um sie zu testen:

1. laden Sie die generierte Erweiterung über dieses Link herunter: [https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar](https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar)
2. beachten Sie die Schritte 2 und 3 des Abschnitts [Erweiterung generieren und installieren](#Modifierlapaged'accueildeBlueMind-buildAndInstall)


:::info

Der Inhalt der [generierten Erweiterung](https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar) kann direkt von einer Software aus geändert werden, die das Zip-Komprimierungsformat unterstützt (z.B. Winzip).

Sie können die Vorlagendatei `templates/login.xml` ersetzen und Ressourcen im Ordner `web-resources` hinzufügen oder entfernen.

:::

