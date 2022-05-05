---
title: "BlueMind 4 Einsatz: Schwachstellen"
confluence_id: 57771184
position: 38
---
# BlueMind 4 Einsatz: Schwachstellen


## Einführung

Die BlueMind Version 4 integriert wichtige Architekturentwicklungen mit einerseits nativer Outlook-Unterstützung und andererseits Datenreplikation zur Aufbereitung von E-Mail-Daten für Outlook und andere Anwendungen (insbesondere neue Webmailer und Mobilgeräte).

## Die Replikation

Die Replikation, aktiviert per [Mail-shard](/Guide_d_installation/Installation/Installation_avec_répartition_des_données_sur_plusieurs_serveurs/) (also eine pro [Mailbox-Rolle](/Guide_de_l_administrateur/Configuration/Gestion_des_serveurs/)), ermöglicht es Cyrus, eine Kopie der Nachrichten an den bm-core Dienst zu senden. Der bm-core Dienst nutzt diese Replikation, um „Metadaten“ von Nachrichten abzurufen, die für bm-eas, bm-mapi und ElasticSearch benötigt werden. Diese „Metadaten“ werden in Datenbanken (wie bei Exchange) und in ElasticSearch gespeichert.

So kann auch bei Replikationsausfall ein ganzer Mailspool (Cyrus-Seite) übernommen werden, wobei die Mails in Webmailer und Thunderbird angezeigt werden. Unter diesen Bedingungen sind die Nachrichten (ganz oder teilweise) nicht verfügbar:

- im Outlook
- über EAS (Smartphones)
- in der Suchmaschine (Webmailer, Smartphones)
- zum Erstellen von Filtern in den Benutzereinstellungen oder der Verwaltungskonsole (Ordner werden nicht angezeigt)


### Datenübernahme und Replikation

In der aktuellen Phase der Stabilisierung des MAPI-Protokolls zwischen BlueMind und Outlook ist eine Datenübernahme durch PST-Laden aus Outlook verboten. Im Allgemeinen ist einee serverseitig überwachte Datenübernahme sicherer und bezüglich der Übernahmeergebnisse konsistenter.

Die empfohlenen Übernahmelösungen sind:

- das Exchange-Migrationstool
- das serverseitige PST-Übernahmetool
- das iMAP-Synchronisierungstools mit imapsync (siehe nachstehende Empfehlungen)
- das Domino-Übertragungstool


Die Replikation extrahiert und speichert Informationen aus dem Mailspool in BlueMind-Objekten, die zuvor existieren müssen. Damit die Replikation richtig funktioniert, dürfen folglich nur Daten in Cyrus eingespeist werden, die BlueMind bekannt sind: Domänen und Mailboxen müssen also in der Administrationskonsole (oder per API) angelegt werden, ** **bevor** ** die Mailboxen gefüllt werden.

Derzeit ist es in admin0 (BlueMind-Superadministrator) möglich, BlueMind-Daten ohne Berücksichtigung von BlueMind-Objekten und Mail-Speicherregeln zu übernehmen. In der Tat können mit admin0-Rechten E-Mail-Daten auf dem Cyrus-Server gespeichert werden, ohne dass irgendwelche Rechte oder Konsistenzprüfungen durchgeführt werden. Aus diesem Grund können die Daten für BlueMind als inkonsistent angesehen werden und somit kann die Replikation fehlschlagen. **Wir raten daher davon ab, Daten per imapsync mit dem Benutzer admin0 zu importieren**.

Um dies zu vermeiden, muss bei geplanter BlueMind-Datenübertragung per imapsync  **der imapsync mit dem Login des Benutzers erfolgen**. Wenn Sie die Vorgänge als E-Mail-Benutzer durchführen, können Sie sicher sein, dass das Konto existiert, dass die Partition die richtige ist usw.

So erstellen Sie einen API-Schlüssel für einen bestimmten Benutzer:

[https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples/generateUserToken.py](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples/generateUserToken.py)

Beispiel für eine Datenübernahme, die dem Quellserver und den wiederherzustellenden Konten/Daten anzupassen ist:

[https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/migration/4.0/kerio](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/migration/4.0/kerio)

Generell und insbesondere für die 4 wird dringend empfohlen, die Datenübernahme auf einem Testserver zu testen, der anschließend neu installiert oder vernichtet wird. Die Datenübernahme muss, nachdem sie validiert wurde, auf einem leeren Server (oder einer leeren Domäne) durchgeführt werden, die keine Spur der in der Testphase durchgeführten Vorgänge aufweisen. Die LDAP / AD-Verbindung, die ImapSync-Datenübernahme oder die Exchange-Wiederherstellung können nach erfolgreichem Prototyping auf dem Produktionsserver nachgespielt werden.

### Replikation auf ordnungsgemäße Funktion prüfen

In der [Überwachungskonsole bm-tick](/Guide_de_l_administrateur/Supervision/Monitoring_Bm_Tick/) können Sie die Tabelle (*Dashboard*) „Mailspool & Replication“ überwachen. Zwei Graphen sind besonders wichtig:

 **Anzahl der replizierten Nachrichten pro Stunde:**  :  

 ![](https://forge.bluemind.net/jira/secure/attachment/27530/27530_image-2019-07-09-18-26-52-783.png) 

 **Anzahl der aktiven Replikationen**  :

 ![](https://forge.bluemind.net/jira/secure/attachment/27531/27531_image-2019-07-09-18-27-16-720.png) 

Diese Zahl muss 1 pro Server mit der Mailbox-Rolle und damit der bm-cyrus-imapd Dienst sein, wenn diese Zahl sinkt, bedeutet dies, dass die Replikation nicht (mehr) erfolgt.

Umgekehrt, wenn diese Zahl die Anzahl der IMAP Backends übersteigt, ist es in den meisten Fällen so, dass die Rolle einem (oder mehreren) [separaten Speicherserver(n)](/Guide_d_installation/Installation/Installation_avec_répartition_des_données_sur_plusieurs_serveurs/) zugewiesen wurde, der Dienst aber noch auf dem Hauptserver läuft. Nun muss die Deaktivierung erzwungen werden, indem Sie die folgenden Dateien auf dem bm-core erstellen und dann die Dienste stoppen:


```
touch /etc/bm/bm-cyrus-imapd.disabled
touch /etc/bm/bm-lmtpd.disabled
systemctl stop bm-cyrus-imapd ; systemctl stop bm-lmtpd
```


Um zu sehen, ob die Replikation funktioniert, können Sie jederzeit einen Vorgang mit einer E-Mail durchführen (z. B. sie ungelesen weiterleiten) und mit einem  Befehl `tail` prüfen, ob gleichzeitig eine Zeile dieser Art in der Protokolldatei `/var/log/bm/replication.log` hinzugefügt wird:


```
{{APPLY MAILBOX (.... loginUtilisateur ) }}
```


### Fortschritt des Replikationsprozesses

Die Tick Verbesserungen werden in künftigen Versionen einen besseren Überblick über den Replikationsfortschritt ermöglichen.

Unterdessen kann die Anzahl der Mails in den Mail- und Archiv-Spools mit der Anzahl der Einträge in der Tabelle verglichen werden, in der die Nachrichten gespeichert sind. Die Entsprechung ist nicht exakt, gibt aber einen guten Überblick über den Fortschritt.

Zum Beispiel, um die Anzahl der zu synchronisierenden E-Mails zu kennen:


```
# Nombre de mails du spool :
find /var/spool/cyrus/data/ -type f|wc -l

# Nombre de mails des archives :
find /var/spool/bm-hsm/cyrus-archives -type f|wc -l
```


Die Summe der beiden muss dem Abfrageergebnis auf der bj-Datenbank nahe kommen:


```
select count(\*) from t\_message\_body;
```


Beachten Sie, dass der Standard-Replikationsstrom nur „lebendige“ Mailboxen überwacht. Das heißt, wenn das Replikationsdelta signifikant bleibt, während die Replikation fast gestoppt ist, wurden alle aktiven Benutzer repliziert und haben Zugriff auf die zugehörigen Funktionen (Webmailer-Suche, EAS usw.).
Beachten Sie auch, dass es sich um eine ungefähre Zählung handelt: Wenn eine E-Mail an N Benutzer gesendet wird, wird sie einmal in t_message_body gezählt, ist aber N-mal in Spool vorhanden.

Um die Replikation auf passiven (unbenutzten) Boxen zu starten, müssen Sie alle Boxen mit dem folgenden Befehl in der Replikationswarteschlange positionieren, nachdem Sie einige Cyrus-Protokolle bereinigt haben:


```
#nettoyage cyrus
service bm-cyrus-imapd stop
rm /var/lib/cyrus/sync/core/log\*
service bm-cyrus-imapd start
#lancement de la réplication
bm-cli maintenance repair --ops replication.parentUid $DOMAIN\_UID$
```


wobei `$DOMAIN_UID$` der Domänenname ist, zum Beispiel: bluemind.net


## BlueMind ohne MAPI

##### Outlook

Ohne den MAPI-Dienst arbeitet Outlook weiterhin mit dem Connector [wie in Version 3.5](https://forge.bluemind.net/confluence/display/BM35/Synchronisation+avec+Outlook). Administratoren müssen das gleiche Verfahren von [Provisioning Users to the Outlook Connector](https://forge.bluemind.net/confluence/display/BM35/Mise+a+disposition+du+connecteur+Outlook) aus durchführen, damit Benutzer es herunterladen und auf ihren Rechnern installieren können.

##### Cyrus

Ab Version 4.1 wird beim Start von BlueMind eine Überprüfung des Cyrus Baums durchgeführt und eine Warnung (durch eine Warnung in den Protokollen) erfolgt, wenn der Baum nicht konsistent ist.

## BlueMind mit MAPI

##### Autodiscover

Ab Version 4.1 wird eine Autodiscover-Prüfung auf allen Domänen und Aliassen der Installation durchgeführt: wenn kein Autodiscover funktioniert, dann startet der MAPI-Dienst nicht, wenn mindestens ein Autodiscover gut ist, dann beginnt der Dienst, die erreichbaren Domänen zu bedienen.

Der mapi Server versucht also für jede Domäne und jeden Alias eine Anfrage an `domain.loc/autodiscover` und `autodiscover.domain.loc/autodiscover` und prüft, ob er die Anfrage selbst erhält.

Eine Prüfung auf dem DNS-Server wird durchgeführt, um den Eintrag `_autodiscover.\_tcp.domain.loc` und `_autodiscover.<alle Aliasse>` zu prüfen.


:::info

Um sicherzustellen, dass der Server richtig konfiguriert und unter diesen Urls erreichbar ist, können Sie das Online-Diagnosetool von Microsoft verwenden:[https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/)

:::

##### Cyrus

Ab Version 4.1 wird beim Start von BlueMind eine Überprüfung des Cyrus Baums durchgeführt und eine Warnung (durch eine Warnung in den Protokollen) erfolgt, wenn der Baum nicht konsistent ist.

### Outlook

#### Erstellen eines leeren Outlook-Profils

Um Outlook ohne Connector korrekt zu verbinden, sollten Sie zunächst  Implementierungsdokumentation auf der Serverseite lesen:

[Implementieren von MAPI für Outlook](/Guide_de_l_administrateur/La_souscription_BlueMind/Mise_en_œuvre_de_MAPI_pour_Outlook/)

**Wir weisen Sie insbesondere auf das Kapitel über die Anforderungen an die Serverkommunikation hin: Die automatische Erkennung muss korrekt funktionieren, damit Outlook mit BlueMind kommunizieren kann.


**

Befolgen Sie für jede Position die Dokumentation zum Erstellen eines Profils für Outlook

[Synchronisation mit Outlook](/Guide_de_l_utilisateur/Configuration_des_clients_lourds/Synchronisation_avec_Outlook/)

Auch hier ist darauf zu achten, dass die **Zugänglichkeit der Urls vom Rechner aus vorher validiert wird**.

#### Outlook Einschränkungen in Bezug auf den Betrieb von BlueMind

Bekannte Einschränkungen bezüglich der Funktion von Outlook sind auf unserer Seite zur [Kompatibilität von BlueMind mit Client-Software und Geräten](/FAQ_Foire_aux_questions_/Compatibilité/#Compatibilite-compat-outlook) aufgeführt

## Bekannte Einschränkungen

Sie können die bekannten Einschränkungen in der [BlueMind-Kompatibilitätsdokumentation](/FAQ_Foire_aux_questions_/Compatibilité/)nachlesen.

### Aktualisierung von BlueMind 4.0 auf 4.x

#### Ordner unter dem Posteingang

In BlueMind-Versionen 4.0.x sind die von Outlook unter dem Posteingang angelegten Ordner keine E-Mail-Ordner, sondern virtuelle Ordner.

**BlueMind 4.1 bietet Unterstützung für Posteingangs-Unterordner**.


:::info

Aktualisierung von 4.0.x auf 4.x

****Achtung!**** Im Rahmen der Aktualisierung von BlueMind 4.0.x auf 4.1 oder höher, **werden virtuelle Ordner nicht migriert, sondern gelöscht.**

Daher können diese virtuellen Ordner **vor der** Aktualisierung aus dem Posteingang verschoben werden, so dass sie erhalten bleiben, dann wieder in den Posteingang zurückkehren und als E-Mail-Ordner neu erstellt werden.

:::


