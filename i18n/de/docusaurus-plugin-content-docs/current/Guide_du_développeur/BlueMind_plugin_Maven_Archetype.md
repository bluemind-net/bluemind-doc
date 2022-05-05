---
title: "BlueMind-Plugin Maven Archetype"
confluence_id: 57771893
position: 46
---
# BlueMind-Plugin Maven Archetype


Um die Implementierung eines BlueMind-Plugin-Projekts zu vereinfachen, ist ein Maven-Archetyp im BlueMind-Repository verfügbar.

## Das Projekt erstellen

Um das Projekt zu erstellen, führen Sie den folgenden Befehl aus:


```
mvn archetype:generate -DarchetypeRepository=http://forge.blue-mind.net/nexus/service/local/repositories/snapshots/content/
```


Wählen Sie den Archetyp `net.bluemind.sample.parent-archetype`

Das Projekt wird dann im interaktiven Modus erstellt:


```
groupId: net.bluemind
artifactId: <the general artifactId of the plugin>
version: 1.0-SNAPSHOT
package: <the base java package>
project-artifactId: <the specific artifactId of the plugin implementation>
```


Um z. B. ein "Filehosting"-Plugin zu erstellen, das über das Dateisystem (filesystem) implementiert wird:


```
groupId: net.bluemind
artifactId: net.bluemind.filehosting
version: 1.0-SNAPSHOT
package: net.bluemind.filehosting.filesystem
project-artifactId: filehosting.filesystem
```


:::info

Dem ArtefaktId muss nicht "net.bluemind" vorangestellt werden

:::

## Aufbau des Projekts

Das erstellte Projekt enthält ein übergeordnetes Maven-Projekt, das wiederum 2 Untermodule enthält: eines für die Implementierung, das andere für Unit- und Integrationstests.

Alle erforderlichen BlueMind-Abhängigkeiten und Bibliotheken von Drittanbietern werden dem Manifest automatisch hinzugefügt.

Um das Projekt zu erstellen, führen Sie den folgenden Befehl aus dem Stammverzeichnis Ihres neuen Projekts aus:


```
maven clean install
```


