---
title: "CLI-Client für die Administration"
confluence_id: 57771796
position: 64
---
# CLI-Client für die Administration


## Präsentation

Mit dem CLI-Client ("Command Line Interface" = Kommandozeilen-Schnittstelle) können Sie Aufgaben zur Administration der BlueMind-Plattform direkt über die Befehlszeile ausführen, ohne dafür Skripte erstellen zu müssen.

Gekoppelt mit dem bm-tick Monitoringsystem ermöglicht es unter anderem die Durchführung von Administrationsaufgaben.

## Installation

Der bm-cli Client ist standardmäßig in BlueMind 4 installiert.

Eine zusätzliche Komponente für die mapi-Administrationsoperationen für Outlook ist optional und kann durch Installation des entsprechenden Pakets installiert werden:


```
$ aptitude install bm-plugin-cli-mapi
```


:::info

Es ist kein Neustart des Dienstes erforderlich, die Befehle können direkt verwendet werden

:::


## Funktionsweise

### Die Befehle

Befehle werden über ein Terminal direkt auf dem Server platziert, der z.B. per ssh verbunden ist.

Zum Beispiel ein Befehl, um die Adressbücher eines Benutzers zu kennen:


```
root@mail:~# bm-cli contact list jdoe@bluemind.loc
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:Contacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"My contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"Collected contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"408C741B-3FDC-44B6-B1FD-19E79404BFCF","name":"Perso"}
```


### Hilfe erhalten


:::info

Die Befehle werden mit neuen BlueMind-Versionen erweitert. Je nach Version Ihrer Installation können Sie mehr (oder weniger) Befehle haben.

**Verwenden Sie den Befehl "bm-cli help", um herauszufinden, welche Sie verwenden können**.

Zum Beispiel:


```
# bm-cli help
usage: bm-cli <command> [<args>]

The most commonly used bm-cli commands are:
    calendar      calendar task(s)
    contact       contact task(s)
    help          Display help information
    maintenance   maintenance task(s)
    tick          tick task(s)
    user          user task(s)

See 'bm-cli help <command>' for more information on a specific command.
```


Die Installation, hier in 3.5.11, umfasst die Befehle calendar, contact und user, die in früheren Versionen nicht vorhanden waren.

:::

Sie können jederzeit mit "help" Hilfe zu einem Befehl, Unterbefehl, dessen Verwendung und Optionen erhalten.

Zum Beispiel stellt "help maintenance" den Wartungsbefehl und seine verschiedenen möglichen Aktionen vor:


```
# bm-cli help maintenance
NAME
        bm-cli maintenance - maintenance task(s)

SYNOPSIS
        bm-cli maintenance
        bm-cli maintenance consolidateIndex [--workers <workers>]
        bm-cli maintenance list [--workers <workers>]
        bm-cli maintenance repair [--dry] [--workers <workers>]

COMMANDS
        With no arguments, List directory entries

        list
            List directory entries
...
```


Um weitere Details zu einem Unterbefehl zu erhalten, geben Sie einfach den Unterbefehl  ein, hier für die Hilfe zum Vorgang der Indexkonsolidierung:


```
# bm-cli help maintenance consolidateIndex
NAME
        bm-cli maintenance consolidateIndex - Consolidate a mailbox index

SYNOPSIS
        bm-cli maintenance consolidateIndex [--workers <workers>] [--] <target>

OPTIONS
        --workers <workers>
            run with X workers
...
```


:::info

BlueMind 4.4 unterstützt die Option `--help`. Es ist nun möglich, Hilfe zu erhalten, indem diese Option hinter einem Befehl hinzugefügt wird:


```
~# bm-cli maintenance --help
Usage: bm-cli maintenance [-hV] [COMMAND]
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
Commands:
  help                 Displays help information about the specified command
  generate-completion  Generate bash/zsh completion script for bm-cli.
  consolidateIndex     Consolidate a mailbox index
  hsm-to-cyrus         Converts HSM snappy spool to a cyrus maildir folder
  list                 List directory entries
  repair               Run repair maintenance operation
  ops                  List available maintenance operations
Exit Codes:
   0   Successful program execution
   1   Internal software error: an exception occurred when invoking the
         business logic of this command.
  51   Usage error: user input for the command was incorrect, e.g., the wrong
         number of arguments, a bad flag, a bad syntax in a parameter, etc.


```


:::

### Konkrete Beispiele

#### Verwaltung und Wartung

##### Ein globales *check&repair* durchführen

Mit dem folgenden Befehl kann die Operation "Validieren und Reparieren" für alle Domain-Benutzer mit 4 Threads durchgeführt werden:


```
bm-cli maintenance repair domain.net --workers 4
```


##### Passwort admin0 ändern

Aus verschiedenen technischen oder praktischen Gründen (z. B. bei Verlust) kann es sinnvoll sein, das Passwort des Benutzers admin0 zu ändern, ohne sich in BlueMind anmelden zu müssen.

Der folgende Befehl ermöglicht dies, ohne das alte Passwort zu kennen:


```
bm-cli user update admin0@global.virt --password "NewPassword"
```


##### Tick-Konfiguration aktualisieren

Wenn das [Bm-Tick Monitoringtool](/Guide_de_l_administrateur/Supervision/Monitoring_Bm_Tick/) installiert ist, können Verwaltungsaufgaben ausgeführt werden. So ist es möglich, die Konfiguration mit dem folgenden Befehl auf alle Server in der Domain neu zu verteilen:


```
# bm-cli tick reconfigure
```


:::tip

Die Option `--dry` wird zum Testen des Befehls verwendet: Der Vorgang wird nur simuliert


```
# bm-cli tick reconfigure --dry
```


:::

##### Update von BlueMind

Ab BlueMind 4.1 kann das BlueMind-Aktualisierung, sofern das Abonnement dies zulässt, komplett über die Kommandozeile durchgeführt werden, ohne den Assistenten über den Browser auszuführen:


**
Debian/Ubuntu


**
Redhat/CentOS


```
aptitude update
aptitude upgrade && bm-cli setup upgrade
```


```
yum update
yum upgrade && bm-cli setup upgrade
```


#### Benutzerverwaltung

##### Archivierte (suspendierte) Benutzer aus der Domain entfernen

Die Befehle können miteinander verbunden werden, um mehrere Vorgänge gleichzeitig auszuführen.

Mit dem folgenden Befehl können Sie z.B. nach den E-Mail-Adressen von gesperrten Benutzern suchen:


```
bm-cli user get domain.net --archived --display "email"
```


Es ist dann möglich, die Rückgabe dieses Befehls mit einem "delete"-Befehl zu koppeln, um die zurückgegebenen Benutzer zu löschen:


```
bm-cli user get local.lan --display "email" | jq -r '.[].email' > /tmp/archived.txt
while read account; do bm-cli user delete --dry $account ;done < /tmp/archived.txt
```


#### Kalenderoperationen

##### Freigabe von Kalendern von allen Benutzern für einen Benutzer

Es kann sinnvoll sein, dass ein Benutzer Zugriffsrechte auf die Kalender aller anderen Benutzer hat, ohne als Administrator ausgewiesen zu sein (z.B. ein Assistent, die in der Lage sein muss, Termine für alle Mitarbeitenden anzuzeigen/zu erstellen). Um zu vermeiden, zur Aktivierung einer Freigabe mühsam alle Benutzeradministration-Dateien einzeln durchzugehen, kann dies über die Kommandozeile erfolgen.

Dieser Vorgang ist nicht mit einem einzelnen Befehl durchführbar, aber es ist möglich, eine Schleife zu erstellen, die alle Benutzer der Domain abruft und dann für jeden von ihnen eine Freigabe aktiviert:


```
bm-cli users get domain.net > /tmp/allUser.domain.net
while read account; do bm-cli calendar share $account « default » toto@domain.net r;done < /tmp/allUser.domain.net
```


#### Aktionen in Bezug auf die Kontakte

Beispiel eines Verfahrens, um das Adressbuch von den gesammelten Adressen eines Benutzers zu bereinigen und diese Kontakte in sein persönliches Adressbuch zu übertragen (durch vorheriges Testen des Imports):


```
root@mail:~# bm-cli contact list jdoe@bluemind.loc
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:Contacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"My contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"Collected contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"408C741B-3FDC-44B6-B1FD-19E79404BFCF","name":"Perso"}
root@mail:~# bm-cli contact deduplicate jdoe@bluemind.loc --addressbook-uid book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18
2 were removed out of 35
root@mail:~# bm-cli contact export jdoe@bluemind.loc --vcf-file-path /tmp/jdoe-collected.vcf --addressbook-uid book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18
addressbook book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18 of jdoe@bluemind.loc was exported
root@mail:~# bm-cli contact import jdoe@bluemind.loc --vcf-file-path /tmp/jdoe-collected.vcf --addressbook-uid 408C741B-3FDC-44B6-B1FD-19E79404BFCF --dry
DRY : AddressBook 408C741B-3FDC-44B6-B1FD-19E79404BFCF of jdoe@bluemind.loc was imported
root@mail:~# bm-cli contact import jdoe@bluemind.loc --vcf-file-path /tmp/jdoe-collected.vcf --addressbook-uid 408C741B-3FDC-44B6-B1FD-19E79404BFCF
AddressBook 408C741B-3FDC-44B6-B1FD-19E79404BFCF of jdoe@bluemind.loc was imported
root@mail:~# bm-cli contact reset jdoe@bluemind.loc --addressbook-uid book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18
Addressbook book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18 of jdoe@bluemind.loc was reset
```


### Wartung

Das Tool bm-cli ermöglicht die Durchführung von Wartungsvorgängen an Benutzern, wie z. B.:


```
bm-cli maintenance repair user@domain.net			#réparer l'utilisateur user@domain.net
bm-cli maintenance repair domain.net --numworkers 4	#réparer l'ensemble des utilisateurs du domaine en utilisant 4 threads
bm-cli maintenance consolidateIndex user@domain.net	#consolider l'index de l'utilisateur user@domain.net
bm-cli maintenance consolidateIndex domain.net --from 0 --size 100 #traite les 100 premiers utilisateurs retournés
bm-cli maintenance consolidateIndex domain.net --from 101 --size 50 #traite les 50 utilisateurs suivants
bm-cli maintenance consolidateIndex domain.net --match '[a-c].\*' # traite les entités commencant par a, b ou c
```


### Installation und Update

Da das Abonnement Zugang zu den automatisierten Updates von BlueMind gewährt, erhalten Sie auch Zugang zu zusätzlichen bm-cli Client-Operationen für diese.


:::info

Da diese Vorgänge sensibel und riskant sind, handelt es sich um Befehle, die fortgeschrittenen Administratoren vorbehalten sein müssen.

:::

Um diese Befehle zu verwenden, muss das entsprechende Plugin installiert werden:


```
apt install bm-plugin-cli-setup

```


#### Befehle

Der zusätzliche Befehl `"setup`" ist verfügbar, sobald das Plugin installiert ist:


```
bm-cli help setup	#obtenir de l'aide sur les arguments disponibles et leur utilisation
bm-cli setup install --external-url bluemind.domain.net --domain domain.net --sw-pass Passw0rd
bm-cli setup install --external-url bluemind.domain.net --domain domain.net --sw-pass Passw0rd --set-contact admin@domain.net --reinstall
bm-cli setup upgrade #lance la procédure de mise à jour post-installation en lieu et place du déroulement de l'url https://<domain.net>/setup via un navigateur
```


- -`-external-url` : externe url von BlueMind
- `--domain`: Domain
- -`-contact-set`: ermöglicht das Festlegen der Standard-E-Mail-Adresse für Benachrichtigungen über den Ablauf von Abonnements
- -`-sw-pass`: ermöglicht das Festlegen des Admin-Passworts für den *Setupwizard*


#### Update-Verfahren

Um die Installation in der Kommandozeile mit dem Tool bm-cli zu aktualisieren, ist die Vorgehensweise die gleiche wie bei einem [herkömmlicher Aktualisierung](/Guide_d_installation/Mise_à_jour_de_BlueMind/):

1. **Vorbereitung der Aktualisierung:***Hinweis: Dieser Befehl ist ab der Version 3.5.14 verfügbar*****Mit dem Befehl "bm-cli setup" wird die Version eingestellt, auf die Sie aktualisieren möchten.
    - Geben Sie den folgenden Befehl ein, um auf die **neueste verfügbare Version** zu aktualisieren:


```
bm-cli setup version latest
```


    - Um auf **eine bestimmte Version** zu aktualisieren, übertragen Sie die Versionsnummer als Parameter:


```
bm-cli setup version 3.5.14-2
```

*Hinweis: Die Verwendung der Hauptversionsnummer (z. B. "3.5" oder "4") hat die gleichen Auswirkungen wie die Option "latest": Es wird die letzte verfügbare Nebenversion installiert*

    - Um **die Version zu sperren und Upgrades auf eine höhere Version zu verhindern**:


```
bm-cli setup version current
```


2. **Update von Paketen:**


:::info

Wenn Sie die Ausfallzeit begrenzen möchten, können Sie den Update-Befehl mit der Option "nur-download" erteilen, um das gesamte Paket zunächst nur  herunterzuladen.

Da diese Aktion keine Unterbrechung oder Verlangsamung der Dienste verursacht, kann sie zu jeder Tages- und Nachtzeit durchgeführt werden.

Der Befehl "Aktualisierung " zur tatsächlichen Aktualisierung der Pakete kann später zum günstigsten Zeitpunkt ausgeführt werden, was zu einer kürzeren Dienstunterbrechung führt.

:::


**
Debian/Ubuntu


**
Redhat/CentOS


```
## Opérations réalisables serveur en production
aptitude update
aptitude --download-only upgrade

## Opération passant le service en maintenance
aptitude upgrade

```


```
## Opérations réalisables serveur en production
yum makecache
yum --downloadonly upgrade

## Opération passant le service en maintenance
yum upgrade
```


3. **Aktualisierung-Vorgang starten:**


```
bm-cli setup upgrade
```


