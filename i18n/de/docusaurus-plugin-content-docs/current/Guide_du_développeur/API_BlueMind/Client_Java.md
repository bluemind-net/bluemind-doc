---
title: "Java-Client"
confluence_id: 57771890
position: 54
---
# Java-Client


Die API und der generierte Client werden als Maven-Artefakte in unserem Repository veröffentlicht. Verweisen Sie einfach auf das pom.xml Ihres Maven-Projekts. Am Beispiel für BlueMind 4.3.20 (mit der technischen Nummer 4.1.51294):


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


und fügen Sie die folgende Abhängigkeit hinzu:


```
<dependency>
    <groupId>net.bluemind</groupId>
    <artifactId>net.bluemind.bm-api</artifactId>
	<version>4.1.51294</version>
</dependency>
```


Ein „Fat-Jar“-Client steht ebenfalls im Maven-Repository zum Download bereit: https: [//pkg.bluemind.net/pkg/4/mvn/net/bluemind/net.bluemind.bm-api-no-deps/](https://pkg.bluemind.net/pkg/4/mvn/net/bluemind/net.bluemind.bm-api-no-deps/)

Ein Beispiel finden Sie in unserem GIT-Repository bluemind-samples: https: [//forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/bm-api-client](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/bm-api-client)

