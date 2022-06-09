---
title: "Mehrdomänen-Mailbox"
confluence_id: 57771242
position: 30
---
# Mehrdomänen-Mailbox

BlueMind kann auf derselben Infrastruktur (ein oder mehrere Server, physisch oder virtualisiert) mehrere vollständig partitionierte Mailbox-Systeme hosten. Dieses Prinzip, das als **Mehrdomänen** oder Multi-Tenant bezeichnet wird, kann eingesetzt werden, um mehrere Mailbox-Systeme in Einklang zu bringen oder in Cloud-Infrastrukturen genutzt werden.

Wenn diese **Mehrdomänen-Infrastruktur** technisch gesehen einer einzigen Installation entspricht, muss funktionell gesehen jede Domäne dieser Infrastruktur als separates Mailbox-System betrachtet werden, unabhängig und getrennt von den anderen Domänen.


## Domäne(n) und Domänen-Aliasse

Eine **Domäne** wird durch ihren **Hauptdomänennamen** identifiziert (z. B. [mail.bluemind.net](http://mail.bluemind.net)).

Jede Domäne kann einen oder mehrere Domänen-Aliasse haben: Es sind andere Domänennamen oder Subdomänen (z.B. [webmail.bluemind.net](http://webmail.bluemind.net) oder [mail.bluemind.fr](http://mail.bluemind.fr)), die auf der gleichen Domäne gehostet werden. In diesem Fall gibt es keine Partitionierung dieser Mailboxen.
Diese Domänen können:

- Aliasse anlegen, jeder Benutzer kann auf einer oder mehreren Alias-Domänen existieren (der Benutzer kann folglich auf jeder Domäne, auf der seine Adresse definiert wurde, Nachrichten empfangen)
- unterschiedliche, aber nicht völlig getrennte Mailbox-Dienste darstellen. So ist es z. B. möglich, dass zwei Unternehmen mit demselben Geschäftsführer nur einen Mailbox-Dienst haben und nur der Geschäftsführer ein Konto auf beiden Domänen hat. Auf diese Weise hat er einen Kalender, den er mit Benutzern aus beiden Domänen gemeinsam nutzen kann. In dieser Konfiguration haben alle Benutzer eine E-Mail-Adresse auf der Hauptdomäne.


### Auswahlkriterien in einer Mehrdomänen-Architektur

In der gleichen E-Mail-Domäne werden die Daten nicht partitioniert.
Einzelrechte  ermöglichen jedoch das Ausblenden oder Partitionieren von Benutzerdaten entsprechend den von Administratoren und Benutzern selbst verwalteten Rechten.

Auf partitionierten Domänen einer Mehrdomänen-Infrastruktur sind die Daten vollständig partitioniert.
Die Mailbox-Systeme sind abgeschottet, eine gemeinsame Nutzung von Daten ist nicht möglich (siehe nachstehend einige Beispiele für eine eventuelle gemeinsame Nutzung).

### Austausch von Informationen zwischen Mailboxen

Die kollaborativen Funktionen von Mailboxen erlauben es generell, bestimmte Daten und Informationen für andere Systeme zu öffnen. Dies trifft für die BlueMind-Lösung zu, für die Sharing-Mechanismen mit anderen Mailbox-Systemen und natürlich auch mit anderen Domänen eines BlueMind-Mailbox-Systems implementiert werden können.


:::tip

Genauigkeit

In diesen Beispielen können Kalender und Adressbücher für alle oder einige Benutzer sichtbar gemacht werden.

:::

#### Gemeinsame Nutzung individueller Kalender

Die Veröffentlichungsfunktionen der Kalender ermöglichen den Zugriff auf einen BlueMind-Kalender von einer anderen BlueMind-Domäne aus (siehe [Kalender-Freigabe](../../Guide_de_l_utilisateur/L_agenda/Partager_un_calendrier.md)

Anwendungsfall: Ein Direktor von zwei Betrieben, die sich auf getrennten Domänen befinden, kann seinen Kalender der ersten Domäne auf der zweiten über die Freigabe seiner Url (öffentlich oder privat) einsehen, er kann sie auch mit seinen Mitarbeitern der einen oder anderen Domäne teilen.

#### Gemeinsame Nutzung von Domänen-Kalendern

Ein (von einem Administrator erstellter) Domänen-Kalender kann auf dieselbe Weise für eine andere BlueMind-Domäne freigegeben werden.

Anwendungsfall: Ein gemeinsamer Marketing-Kalender für zwei Niederlassungen wird in zwei getrennten Domänen eingesehen. Er wird von den Benutzern einer dieser Domänen betrieben. Er kann dann von der anderen Domäne aus veröffentlicht und eingesehen werden, indem ein neuer externer Kalender mit der ihm zugeordneten Freigabe-URL erstellt wird.

#### Gemeinsame Nutzung von Adressbüchern

Durch die Verwendung von APIs ist es möglich, das Adressbuch einer BlueMind-Domäne zu exportieren und es dann, ebenfalls per API, als Adressbuch einer anderen BlueMind-Domäne einzufügen.

Anwendungsfall: Das Adressbuch der gewählten Vertreter einer Gemeinde wird von der Mailbox-Domäne der Gemeinde gepflegt und ist von der Gemeindevertreter-Domäne des Gemeindeverbands zugänglich.

## Domänenverwaltung

Der Bereich der Domänenverwaltung ermöglicht dem Administrator den Zugriff auf technische Domäneneinstellungen (Serveradressen, Domänen-Aliasse usw.) sowie auf allgemeine und Standard-Benutzereinstellungen (Adressbücher, Nachrichtenfilter, Speicherquoten, Archivierung usw.).

Für weitere Informationen besuchen Sie bitte die Seite [Domänenverwaltung](../../Guide_de_l_administrateur/Configuration/Gestion_des_domaines/index.md)


