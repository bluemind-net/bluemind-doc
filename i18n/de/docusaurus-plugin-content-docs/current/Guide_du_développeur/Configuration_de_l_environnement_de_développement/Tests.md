---
title: "Tests"
confluence_id: 57771899
position: 56
---
# Tests


## Präsentation

Diese Seite zeigt die Ausführung und Bedienung der Tests über mavin, eclipse, docker oder eine virtuelle Maschine.


## Konfiguration

### Die Datei services.json

Die Datei `services.json` im Testprojekt listet die Container/Services (Docker) auf, die zur Ausführung der Tests benötigt werden.

Maven wird die Container in der Datei starten, bevor die Tests ausgeführt werden und sie danach stoppen.

Am Beispiel von zwei Docker-Images, eines für die Postgres-Bd und eines für eine Elasticsearch, enthält die Datei:


```
[{
    "name":"bluemind/postgres-tests"
    },{
    "name":"bluemind/elasticsearch-tests"
}]
```


### Das Fragment net.bluemind.pool.dockerconfig

Dieses Fragment ermöglicht es, die Klasse `BmConfIni` zu ersetzen.

Wenn das Fragment aktiv (nicht geschlossen) ist und das Testprojekt eine `services.json`-Datei enthält, kontaktiert das Fragment die Docker-Instanz, um die IP-Adressen der Container zu finden, die den Images in der `services.json`-Datei entsprechen, und überschreibt die verschiedenen von `BmConfIni` bereitgestellten Parameter (z.B. den Datenbankhost).

Wenn Sie die Tests in Eclipse ausführen und die von einer virtuellen BlueMind-Maschine bereitgestellten Dienste (Postgres, Elasticsearch usw.) nutzen möchten, kann das Fragment einfach geschlossen werden. Die traditionellen Konfigurationsdateien werden dann übernommen `(/etc/bm/bm.ini`, `/etc/bm/mcast.id`, usw.)

### Maven-Konfiguration

Die Maven-Konfiguration von Testprojekten listet die verschiedenen Plugins auf, die zum Starten der Tests benötigt werden:


```
<plugin>
    <groupId>org.eclipse.tycho</groupId>
    <artifactId>tycho-surefire-plugin</artifactId>
    <configuration>
        <showEclipseLog>true</showEclipseLog>
        <useUIHarness>false</useUIHarness>
        <useUIThread>false</useUIThread>
        <product>org.eclipse.platform.ide</product>
    </configuration>
</plugin>
<plugin>
    <groupId>org.eclipse.tycho</groupId>
    <artifactId>target-platform-configuration</artifactId>
    <configuration>
        <dependency-resolution>
            <extraRequirements>
                <requirement>
                    <type>eclipse-feature</type>
                    <id>net.bluemind.tests.feature</id>
                    <versionRange>0.0.0</versionRange>
                </requirement>
            </extraRequirements>
        </dependency-resolution>
    </configuration>
</plugin>
```


## Tests ab Docker ablaufen lassen

Installieren Sie [Docker](https://docs.docker.com/installation/#installation) (bevorzugen Sie Pakete, die Sie von [docker.com](http://docker.com) herunterladen können, und nicht die Pakete, die mit den Distributionen geliefert werden).

Docker lauscht an einem Socket, z.B. unter Debian/Ubuntu:

1. `/etc/default/docker` bearbeiten
2. Setzen Sie die folgende Variable:
`DOCKER_OPTS="-H tcp://<ip hote>:10000 -H [unix:///var/run/docker.sock](unix://forge.blue-mind.net/var/run/docker.sock)"`

3. Starten Sie den Docker-Dienst neu


Auf dem Entwicklungsrechner, auf dem sich Eclipse und die BlueMind-Quellen befinden, müssen Sie angeben, welcher Docker-Dienst verwendet werden soll, indem Sie die Datei `~/.docker.io.properties` mit dem folgenden Inhalt erstellen:


```
docker.io.url=http://<ip hote docker>:10000
```


Anschließend müssen die Docker-Container von Eclipse aus zugänglich sein. Möglicherweise muss auf dem Eclipse-Rechner eine Route hinzugefügt werden, um auf das Container-Netzwerk zugreifen zu können.

Andere mögliche Methoden sind auf [git docker-java](https://github.com/docker-java/docker-java) verfügbar.

### Docker-Images

Derzeit ist es erforderlich, die Images lokal zu installieren (auf dem Docker, der zum Testen verwendet wird). Die Images sind im Projekt `bm/bm-docker-devenv` zu finden:


```
$ git clone https://forge.blue-mind.net/stash/scm/bm/bm-docker-devenv.git
$ ./build
```


:::info

Denken Sie daran, Ihre Images regelmäßig neu zu erstellen, um aktuelle Versionen der BlueMind-Binärdateien verwenden zu können.

:::

### Lokale Verzeichnisse als Docker-Volumes verbinden

Dies geschieht über eine Tabelle (*Array*) von "Volumes".

Um z.B. das lokale Verzeichnis "`/tmp/backups/bluemind`" mit dem Verzeichnis "`/var/backups/bluemind`" im Container Docker zu verbinden, wird der folgende Code verwendet:


```
[{
    "name":"bluemind/postgres-tests",
    "volumes":[ { "localPath":"/tmp/backups/bluemind", "containerPath":"/var/backups/bluemind" } ]
}]
```


In der DockerFile von Docker-Images muss auch das VOLUME hinzugefügt werden:


```
VOLUME ["/var/backups/bluemind"]
```


## Tests ab Eclipse ablaufen lassen

Erstmalige Erstellung des BlueMind-Projekts:


```
$ cd <sourcesBM>/open
$ mvn -Dmaven.test.skip=true clean install
```


Starten Sie die notwendigen Docker-Container:


```
$ cd <repertoire plugin test>
$ mvn pre-integration-test
```


Führen Sie schließlich die Tests in Eclipse aus.


:::info

****Achtung:**** Für Windows und MacOS muss eine Route auf dem VM-Host (Windows oder MacOS) hinzugefügt werden, um das Netzwerk der Docker-Container zu erreichen.
Außerdem muss das Routing auf der VM Docker aktiviert werden:


```
$ sysctl -w net.ipv4.ip\_forward=1
$ echo 'net.ipv4.ip\_forward=1' > /etc/sysctl.conf
```


:::

## Testen ohne OSGI-Container (Junit)

Klassen mit dem Namen `*Test.java` (unterscheiden sich von `*Test**s**.java`) werden ohne OSGI-Container ausgeführt. 

Dies entspricht dem Ausführen vonTests in Eclipse mit "*Run as Junit Test*“ (im Gegensatz zu "*Run as Junit **Plugin** *Test") und löst Classpath-Probleme mit Mocking-Proxy-basierten Frameworks, wie Mockito. Die Tests laufen außerdem schneller.


