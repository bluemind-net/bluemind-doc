---
title: "MAPI-Implementieren für Outlook"
confluence_id: 57771792
position: 90
---
# MAPI-Implementieren für Outlook


## Präsentation

Die Outlook-Synchronisation mit BlueMind 4.0 erfordert nicht mehr die Installation eines Connectors auf den Client-Arbeitsplätzen. Serverseitig sind jedoch einige Vorgänge erforderlich, damit die Outlook-Software im Netzwerk eine Verbindung zu BlueMind herstellen kann.


:::info

Die MAPI in 4-Funktionalität befindet sich auf einigen Installationen in der Produktion in der Beobachtungsphase. Sie ist daher absichtlich standardmäßig deaktiviert. Wenden Sie sich daher an [Ihren gewohnten Ansprechpartner oder kontaktieren Sie uns, um zu definieren, in welchem Rahmen diese Funktionalität für Ihre Installation oder Ihr Projekt aktiviert werden kann](https://content.bluemind.net/decouvrez-bluemind-4-0).

:::


:::info

Sicherheitswarnung

Wir erinnern Sie daran, dass es ratsam ist, an virtuellen Maschinen mit Snapshots zu arbeiten, damit Sie im Falle eines Fehlers zurückgehen können.

:::

## Kompatibilität

Da die Kommunikationsprotokolle unterschiedlich sind, unterstützt BlueMind nur Outlook für **Windows-Versionen**.

**BlueMind kann die korrekte Funktion mit Outlook für MacOS-Versionen nicht garantieren.**

### Ordner unter dem Posteingang

In BlueMind-Versionen 4.0.x sind die von Outlook unter dem Posteingang angelegten Ordner keine E-Mail-Ordner, sondern virtuelle Ordner.

**BlueMind 4.1 bietet Unterstützung für Posteingangs-Unterordner**.


:::info

Aktualisierung von 4.0.x auf 4.x

**Achtung:** Bei einer Aktualisierung von BlueMind 4.0.x auf 4.1 oder höher werden die virtuellen Ordner nicht migriert und gelöscht.

Um sich davor zu schützen, können diese virtuellen Ordner **vor dem** Update aus dem Posteingang verschoben werden, so dass sie erhalten bleiben, dann wieder in den Posteingang zurückkehren und als E-Mail-Ordner neu erstellt werden.

:::

### Anhänge zu Terminplaner-Terminen

Zusätzlich zur  [BlueMind Online-Terminplaner-Anwendung](../Guide_de_l_utilisateur/L_agenda/Créer_un_évènement.md) können Sie mit Version 4.1 Dateien an Kalendertermin aus Outlook anhängen.

## Voraussetzungen

1. [BlueMind](https://download.bluemind.net/bm-download/4.0) ist in [Version 4.0](https://download.bluemind.net/bm-download/4.0)installiert
2. Die folgenden BlueMind-Adressen müssen in HTTPS von den Client-Arbeitsstationen aus erreichbar sein:
    - externe url (*external-url*) des Servers (z.B. *[https://mail.bluemind.loc](https://mail.bluemind.loc)*)
    - *autodiscover* url – wird normalerweise gebildet, indem der 1. Teil der externen url durch das Schlüsselwort "`autodiscover`" ersetzt wird (zum Beispiel *[https://autodiscover.bluemind.loc](https://autodiscover.bluemind.loc))*, das ebenfalls auf die external-url von BlueMind zeigen muss


:::info

**Outlook im MAPI-Modus kann ohne ein korrekt konfiguriertes autodiscover nicht funktionieren**. Beim Start prüft der MAPI-Dienst, ob autodiscover für die Domain oder mindestens einen ihrer Aliase konfiguriert ist; **wenn nicht, wird der MAPI-Dienst nicht gestartet.**

Um sicherzustellen, dass der Server richtig konfiguriert und erreichbar ist, können Sie das Online-Diagnosetool von Microsoft verwenden: [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/)

:::
3. Beim Zugriff auf diese Adressen über einen Browser darf keine **Sicherheitswarnung in Bezug auf das ssl-Zertifikat angezeigt werden**.


## Implementierung


:::tip

Schnelle Implementierung einer Evaluierungsumgebung

Für eine schnelle Implementierung einer Evaluierungsumgebung können Sie den folgenden Artikel in unserem Blog lesen: [BM 4.0 beta + Outlook: Schritt für Schritt](https://blog.bluemind.net/fr/bm-4-0-beta-outlook-pas-a-pas/)

:::

Die Installation muss durchgeführt werden,** **bevor Sie die Benutzer anlegen, die Outlook verwenden werden****:

- [Das Abonnement verfügbar machen](../Guide_d_installation/Mise_en_œuvre_de_la_souscription.md)
- Installieren Sie die notwendigen Pakete:

| Debian/Ubuntu | RedHat/CentOS |
| -- | -- |
| $ aptitude install bm-mapi | $ yum install bm-mapi |

*Hinweis: Ein Neustart von BlueMind ist nicht erforderlich*

- Melden Sie sich in der BlueMind-Administrationskonsole an und [erstellen Sie Benutzer,](./Gestion_des_entités/Utilisateurs/index.md) **indem Sie ihnen eine E-Mail-Adresse zuweisen**.


Die folgende Seite enthält eine Konfigurationsanleitung für Geräte mit Outlook: [Synchronisation mit Outlook](../Guide_de_l_utilisateur/../old/Guide_de_l_utilisateur/Configuration_des_clients_lourds/index.md)


