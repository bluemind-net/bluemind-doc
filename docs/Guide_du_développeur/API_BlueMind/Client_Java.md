---
title: "Client Java"
confluence_id: 57771890
position: 54
---
# Client Java


L'API et le client généré sont publiés comme artifacts Maven dans notre repository. Il suffit de référencer la version souhaitée dans le pom.xml de votre projet maven. Par exemple, pour BlueMind 4.3.20 (dont le numéro technique est 4.1.51294) :


```
<repositories>
    <repository>
        <id>bluemind</id>
        <name>Bluemind Releases</name>
        <url>https://pkg.blue-mind.net/pkg/4.1.51294/mvn</url>
        <layout>default</layout>
    </repository>
</repositories>
```


et ajouter la dépendance suivante :


```
<dependency>
    <groupId>net.bluemind</groupId>
    <artifactId>net.bluemind.bm-api</artifactId>
	<version>4.1.51294</version>
</dependency>
```


Un "fat jar" client est également disponible au téléchargement dans le repo maven : [https://pkg.bluemind.net/pkg/4/mvn/net/bluemind/net.bluemind.bm-api-no-deps/](https://pkg.bluemind.net/pkg/4/mvn/net/bluemind/net.bluemind.bm-api-no-deps/)

Vous pouvez trouver un exemple dans notre dépôt GIT bluemind-samples : [https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/bm-api-client](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/bm-api-client)

