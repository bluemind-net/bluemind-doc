---
title: "Behebung von Fehlern mit Outlook"
confluence_id: 57771859
position: 80
---
# Behebung von Fehlern mit Outlook


## Präsentation

Diese Seite soll Ihnen helfen, Probleme, die bei der Verwendung von Outlook mit BlueMind festgestellt werden, zu untersuchen, zu diagnostizieren und zu beheben

Sollten nach der Erstellung des Kontos Probleme auftreten, ist zunächst auf der [Kompatibilitätsseite](/FAQ_Foire_aux_questions_/Compatibilité/) zu überprüfen, ob die **Outlook-Version unterstützt wird**; diese Seite enthält auch bekannte Einschränkungen.


:::info

Outlook für MacOS

Da die Kommunikationsprotokolle unterschiedlich sind, können wir nur die Kompatibilität mit Outlook **für Windows** garantieren.

**BlueMind 4 ist daher nicht mit Outlook-Versionen für MacOS kompatibel.**

:::


## Logs finden

**Auf der Seite der Client-Software** sind eventuelle Meldungen direkt in der Outlook-Oberfläche im Ordner "Synchronisationsprobleme“ zu finden.

**Serverseitig** sind 2 Dateien aufzurufen:

1. das allgemeine Log `/var/log/bm-mapi/mapi.log`
2. das Aktivitätslog `/var/log/bm-mapi/activities.log`


:::info

Es ist möglich, ein detailliertes Log auf dem Server für einen bestimmten Benutzer für eine erweiterte Untersuchung zu aktivieren;** **dies kann jedoch die Leistung beeinträchtigen** **. Die Aktivierung erfolgt über das [Kommandozeilen-Tool bm-cli](/Guide_de_l_administrateur/Administration_avancée/Client_CLI_pour_l_administration/) mit dem auf dem Server installierten Zusatzpaket `bm-plugin-cli-mapi`:


```
bm-cli mapi logging --enable jdoe@bluemind.loc
```


Die Logs sind in der Datei `/var/log/bm-mapi/user-jdoe@bluemind.loc.log` zu finden

![](../../attachments/57771859/57771860.png) ** Die Einstellung geht verloren, wenn der bm-mapi-Server neu gestartet wird**

:::

## Probleme diagnostizieren

### Eine E-Mail wird nicht in einen Ordner kopiert oder verschoben

**Probleme/Symptome:**

- Eine E-Mail ist in einem Ordner in Outlook sichtbar, aber sie erscheint nicht auf dem Server im selben Ordner (sie ist nicht im Webmailer oder auf mobilen Geräten sichtbar)
- Im Outlook-Ordner *„Synchronisationsprobleme“* liegen viele Fehler vor, die diese E-Mail betreffen
- Die Synchronisation ist blockiert, aber bei Löschung der E-Mail in Outlook wird die Synchronisation wieder aufgenommen


**Diagnose:**

1. Suchen Sie die E-Mail auf dem Server anhand eines Teils des Betreffs:


```
# cd /var/spool/cyrus/data/bluemind\_loc/domain/b/bluemind.loc/j/user/jdoe/
# grep "texte du sujet" \*
```


2. Kopieren Sie die gefundene Datei als eml-Datei:


```
# cp 4817. ~/email-deffectueux.eml
```


3.  Die Datei wiederherstellen und in ein Funktionstest-Outlook kopieren, um zu sehen, ob das Problem wieder auftritt. Beobachten Sie die entsprechenden Protokolle bzw. stellen Sie sie wieder her


## Bekannte Probleme

### Fehlerhafte Kontoerstellung aufgrund eines falsch gespeicherten Passworts

** **Probleme/Symptome******:** Trotz Eingabe des Passworts kann das Konto nicht ertellt werden, Outlook zeigt immer an, dass das Passwort falsch ist

** **Ursache:** **  Der Benutzer hat bei einem früheren Versuch, ein Konto zu erstellen, ein falsches Passwort für dieses Konto gespeichert

** **Überprüfung******:** In der Log-Datei des Servers `/var/log/nginx/access.log` sind Zeilen dieser Art zu finden:


```
192.168.61.133 - - [06/May/2019:16:57:53 +0200] "POST /autodiscover/autodiscover.xml HTTP/1.1" 401 0 "-" "Microsoft Office/16.0 (Windows NT 10.0; Microsoft Outlook 16.0.11601; Pro)"
```


oder


```
192.168.61.133 - tom@bm.lan [06/May/2019:16:58:31 +0200] "POST /mapi/nspi/?MailboxId=94a5c596-90a8-4985-91fd-57629ee06561@bm.lan HTTP/1.1" 200 149 "-" "Microsoft Office/16.0(Windows NT 10.0; Microsoft Outlook 16.0.11601; Pro)"
```


Diese Zeilen zeigen an, dass ein falsches Passwort für [tom@bm.lan](mailto:tom@bm.lan) bei der Kontoerstellung übermittelt wurde


** **Lösung:** **

Das falsche Passwort löschen:

- Sicherstellen, dass Outlook und der Bildschirm für Kontoerstellung geschlossen sind
- öffnen Sie den Identifikationsverwalter durch Eingabe von Windows + R
- `"control /name Microsoft.CredentialManager`" eingeben:![](../../attachments/57771859/57771862.png)
- Auf OK klicken (oder Taste &lt;Enter>)
- Löschen von Einträgen des Typs  `autodiscover.domaine.tld`  et  `MicrosoftOffice16\_SSPI:utilisateur@domaine.tld`  Z.B. zur Löschung des Passwortes von* tom@bm.lan*:![](../../attachments/57771859/57771861.png)


### Das Passwort wird in einer Schleife abgefragt

** **Problem/Symptom******:** Kontoerstellung und Synchronisation funktionieren, aber dann fragt Outlook ständig erneut nach dem Passwort des Benutzers.

** **Ursache****: Wenn eine CAS-Authentifizierungsmethode vorhanden ist, findet Outlook möglicherweise nicht die richtige Methode, um den automatischen Erkennungsdienst zu kontaktieren

** **Lösung**:** Sie müssen den Registrierungsschlüssel erzwingen, um Outlook anzuweisen, die direkte Verbindungsmethode zu Office365 auszuschließen

1. Öffnen Sie regedit:
    - wählen Sie die Schaltfläche Starten
    - Geben Sie `regedit` entweder in der Anwendung *Ausführen* oder in der Windows-Suchleiste ein
    - Eingabe drücken
2. **(DRINGEND EMPFOHLEN, ABER OPTIONAL)** Erstellen Sie eine Sicherungskopie Ihres Verzeichnisses. [Mit einem Klick hier die Verfahrensweise sehen](https://support.microsoft.com/help/322756).
3. Gehen Sie im Verzeichnis zu `HKEY_CURRENT_USER\Microsoft\Office\16.0\Outlook\AutoDiscover`
4. Klicken Sie mit der rechten Maustaste an eine beliebige Stelle in der rechten Spalte, wählen Sie NEU und dann *DWORD (32-Bit*).
5. Bennenen Sie diesen Eintrag: `ExcludeExplicitO365EndPoint`
6. Klicken Sie mit der rechten Maustaste auf diesen Eintrag und wählen Sie *Bearbeiten*
7. Ändern Sie den Wert im Feld für diesen Zweck auf 1 und drücken Sie OK
8. Starten Sie Ihren Computer neu
9. Erstellen Sie Ihr Outlook-Profil neu
10. Öffnen Sie Outlook und geben Sie bei Bedarf Ihre E-Mail-Adresse und das zugehörige Passwort ein.


Weitere Informationen zu diesem Thema: https: [//docs.microsoft.com/fr-fr/outlook/troubleshoot/domain-management/unexpected-autodiscover-behavior](https://docs.microsoft.com/fr-fr/outlook/troubleshoot/domain-management/unexpected-autodiscover-behavior)

### Die Ordner sind leer

** **Problem/Symptom******:** Die Standardordner (Posteingang, gesendete Nachrichten, Papierkorb usw.) sind vorhanden, aber leer. Im Webmailer enthalten sie viele Nachrichten.

** **Ursache**:** Dies ist auf eine Replikationsstörung auf dem betreffenden Konto zurückzuführen. 

** **Lösung**:** Verschiedene Wartungsarbeiten sind notwendig:


```
bm-cli maintenance repair --ops replication.subtree user@domain.tld
bm-cli maintenance repair --ops replication.parentUid user@domain.tld
```


**Outlook neu starten** und prüfen, ob die Nachrichten korrekt ankommen.

### Das globale Adressbuch in Outlook ist nicht vollständig

** **Problem/Symptom******:**

- Ich starte Outlook
- Ich schreibe eine Nachricht
- Ich klicke auf die Schaltfläche „An“
- Ich kann nicht alle Adressen des BlueMind-Servers finden


** **Überprüfen**:**

Prüfen Sie die Logdatei `/var/log/bm-mapi/mapi.log`. Sie kann Fehler wie diesen enthalten:


```
2019-11-22 10:51:07,079 [OAB-generation-pool-2-thread-7] n.b.e.p.c.o.OABGenerator WARN - Cannot handle directory entry a25a572f-eadd-4232-a183-4c0c41e56d0b of type USER
java.lang.NullPointerException: null
        at net.bluemind.exchange.mapi.commons.DistinguishedName.userDN(DistinguishedName.java:96)
        at net.bluemind.exchange.provider.core.impl.gal.UserAddressProps.getDn(UserAddressProps.java:60)
        at net.bluemind.exchange.provider.core.impl.gal.UserAddressProps.<init>(UserAddressProps.java:54)
        at net.bluemind.exchange.provider.core.oab.OABGenerator.userRecord(OABGenerator.java:221)
        at net.bluemind.exchange.provider.core.oab.OABGenerator.create(OABGenerator.java:119)
        at net.bluemind.exchange.oab.impl.OABIndexHandler.lambda$1(OABIndexHandler.java:121)
```


** **Ursache****: Die Hollow Base, die das Mapping von BlueMind uids ermöglicht, mit dem "uid outlook for mapi" neu generieren.

Beispiel: 
Lesen des Mappings möglich über


```
bm-cli hollow directory domain.tld
Record{uid=a25a572f-eadd-4232-a183-4c0c41e56d0b, dn=/o=mapi/ou=domain.tld/cn=recipients/cn=user:a25a572f-eadd-4232-a183-4c0c41e56d0b}
```


** **Lösung**: **Die Hollow Base nach folgendem Verfahren neu regenerieren:


**
BlueMind 4.0.x


**
BlueMind 4.1 et plus


```
systemctl stop bm-mapi && systemctl stop bm-core
rm -fr /var/spool/bm-hollowed/directory/domain.tld/
systemctl start bm-core
```


```
bm-cli maintenance repair --ops hollow.directory domain.tld
```


Die Core Logs überprüfen und das Ende der Regeneration der Hollow Base abwarten. Dann den mapi-Dienst neu starten:


```
systemctl start bm-mapi
```


### Nachrichten werden trotz aktiviertem Konversationsmodus nicht in einer Baumstruktur angezeigt

Diese Funktionalität ist in der MAPI-Verwaltung von BlueMind noch nicht implementiert.

Einige Nachrichten können jedoch als Konversationen nach dem Drittanbieter-Client sortiert sein, von dem sie stammen (z.B. Webmailer oder Thunderbird).

### Beim Erstellen eines Profils zeigt Outlook die Meldung "The name cannot be matched to a name in the address list."

****Ursache:**** Beim Erstellen eines Profils prüft Outlook, ob die E-Mail-Adresse des Kontos in der GAL vorhanden ist, aber nur die Standard-E-Mail-Adresse ist in der GAL vorhanden.

****Lösung:**** Bestimmen Sie in den Bluemind-Einstellungen des Kontos (Administrator) die E-Mail-Adresse, mit der Sie das Outlook-Profil erstellt haben, als Standard-E-Mail-Adresse.


