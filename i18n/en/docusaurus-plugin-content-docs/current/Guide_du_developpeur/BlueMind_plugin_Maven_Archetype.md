---
title: "BlueMind plugin Maven Archetype"
confluence_id: 57771893
position: 46
---
# BlueMind plugin Maven Archetype


To simplify the process of setting up a BlueMind plugin project, a Maven archetype is available in the BlueMind repository.

## Creating the project:

To create the project you will need to execute following command:

***mvn archetype:generate -DarchetypeCatalog=[http://forge.blue-mind.net/nexus-2.7.2-03/service/local/repositories/snapshots/content/](http://forge.blue-mind.net/nexus-2.7.2-03/service/local/repositories/snapshots/content/)***

Choose the archetype "net.bluemind.sample.parent-archetype" which should be the only option available.

 

The project will be created in interactive mode:

groupId: net.bluemind

artifactId: &lt;the general artifactId of the plugin>

version: 1.0-SNAPSHOT

package: &lt;the base java package>

project-artifactId: &lt;the specific artifactId of the plugin implementation>

 

If, for example, you want to develop a "filehosting" plugin which will be implemented using the filesystem, you would answer the questions as follows:

groupId: net.bluemind

artifactId: net.bluemind.filehosting

version: 1.0-SNAPSHOT

package: net.bluemind.filehosting.filesystem

project-artifactId: filehosting.filesystem

 

Notice, that you don't need to prefix the project-artifactId with "net.bluemind"

## Building the project:

The created project will contain a parent maven project with 2 sub-modules, one for the implementation, the other for unit- and integration tests.

All necessary dependencies to BlueMind and 3-party libraries are automatically added to the OSGI Manifest.

To build the project execute following command in the root folder of your newly created project:

***maven clean install***

