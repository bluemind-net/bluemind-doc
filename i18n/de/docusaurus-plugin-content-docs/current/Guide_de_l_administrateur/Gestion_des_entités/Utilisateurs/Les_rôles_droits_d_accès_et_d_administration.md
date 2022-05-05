---
title: "Rollen: Zugriffs- und Administrationsrechte"
confluence_id: 57771478
position: 56
---
# Rollen: Zugriffs- und Administrationsrechte


Bei den Rollen, die den Benutzern zugewiesen werden, kann es sich um Zugriffsrechte auf Anwendungen (Webmailer, Kontakte usw.), Rechte zur Nutzung bestimmter Funktionalitäten (Erstellen einer externen Identität, Aktivieren der Mail-Weiterleitung usw.) oder Administrationsrechte zur Delegation der Verwaltung bestimmter Teile (Benutzer, Domain usw.) handeln.


:::info

Delegation von Rechten
Ein Administrator kann nur Rechte delegieren, über die er selbst verfügt, mit Ausnahme des Zugriffs auf Anwendungen oder bestimmte Funktionalitäten: So kann ein Administrator, auch wenn er selbst nicht über ein Messaging-System verfügt, "Posteingang und Kontakte" für die von ihm verwalteten Benutzer aktivieren; ebenso kann er ihnen die Erstellung externer Identitäten oder die Übertragung von Nachrichten auch dann erlauben, wenn er selbst nicht darüber verfügt.
:::

Die folgenden Rollen können den Benutzern zugewiesen werden:

** **Verwaltung** **

- **Systemadministrator**: ermöglicht die Verwaltung der gesamten BlueMind-Installation und ihrer Konfiguration


:::info

Die Rolle des Systemadministrator eröffnet die gleichen Rechte wie die des admin0 in Bezug auf alle unten aufgeführten Punkte.
So hat der Systemadministrator vollen Zugriff auf Benutzerkonten, Einstellungen und Daten: Nachrichten, Kontakte, Terminplaner. Beim Zugriff auf ihren Terminplaner kann der Systemadministrator sogar Details ihrer privaten Termine sehen, auch wenn er ihren Terminplaner in seiner persönlichen Ansicht aufruft.

:::

    - **Monitoringkonsole**: Zugriff auf die Überwachungskonsole
    - **Systemkonfiguration verwalten**: ermöglicht die Verwaltung der Konfiguration der Parameter
    - **BlueMind-Abonnement verwalten**: ermöglicht die Installation und Aktualisierung [des Abonnements](/Guide_de_l_administrateur/La_souscription_BlueMind/)
    - **Domains verwalten**
        - **Domain-Administrator**
            - **Externe Benutzer verwalten**:  ermöglicht das Erstellen und Verwalten von [Externe Benutzer](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/Utilisateurs_externes/) 
            - **Geteilte Posteingänge verwalten**: ermöglicht das Erstellen, Ändern oder Löschen von geteilten Posteingängen
                - **Geteilte Posteingänge verwalten**: ermöglicht das Ändern der Freigabeberechtigungen für geteilte Posteingänge
            - **Domain-Kalender verwalten**: Ermöglicht das Erstellen, Ändern und Löschen von Domain-Kalendern
                - **Teilen von Domain-Kalendern verwalten**: Ermöglicht das Ändern der Freigabeberechtigungen von Domain-Kalendern
            - **Domain-Adressbücher verwalten**: Domain-Adressbücher erstellen, bearbeiten und löschen
                - **Freigabe des Domain-Adressbuchs verwalten**: Ermöglicht das Ändern der Freigabeberechtigung für Domain-Adressbücher
            - **Verwalten externer LDAP-Adressbücher**: Erstellen, Ändern oder Löschen von Domain-Adressbüchern, die mit einem externen LDAP synchronisiert sind
            - **Gruppen verwalten**: Erstellen, Ändern und Löschen von Gruppen
                - **Gruppenmitglieder verwalten**: Hinzufügen und Löschen von Mitgliedern in Gruppen
                - **Gruppenfreigaben verwalten**: Zuweisung, Änderung oder Entfernung von Freigaberechten für Gruppen-Posteingänge
            - **Ressourcen verwalten**: Erstellen, Ändern oder Löschen von Ressourcen
                - **Ressourcenfreigabe verwalten**: Ändern der Rechte für die Ressourcenfreigabe
            - **Ressourcentypen verwalten**: Erstellen, Ändern oder Löschen von Ressourcentypen
            - **Organisationseinheiten verwalten**: Ermöglicht das Erstellen und Löschen von Organisationseinheiten, die für die Delegation der Verwaltung verwendet werden
            - **Benutzer verwalten**: ermöglicht das Anlegen, Ändern und Löschen von Benutzern
                - **Externe Konten verwalten**: ermöglicht die Verwaltung externer Benutzerkonten, um das in BlueMind integrierte System zur Speicherung von Anhängen durch eine externes System zu ersetzen, falls ein solches installiert ist (siehe [Verbindung mit Nextcloud](/Guide_de_l_administrateur/Configuration/Détachement_des_pièces_jointes/Connecter_avec_Nextcloud/))
                - **Benutzerabonnements verwalten**: Ermöglicht die Änderung von Benutzerabonnements für geteilte Notizbücher und Kalender
                - **Benutzergeräte verwalten (ActiveSync)**: Ermöglicht das Zulassen oder Aufheben von EAS-Synchronisationsberechtigungen auf Fremdgeräten von Benutzern
                - **E-Mail-Identitäten der Benutzer verwalten**: ermöglicht das Hinzufügen, Ändern oder Löschen von Benutzeridentitäten
                - **Benutzerinformationen verwalten**: Ermöglicht die Änderung von Benutzerinformationen, die im Verzeichnis erscheinen sollen (Profilfoto, Name, Kontaktdaten usw.)
                - **Benutzerpasswörter verwalten**: Ermöglicht das Ändern von Benutzerpasswörtern
                - **Benutzereinstellungen verwalten**: Ermöglicht das Ändern der persönlichen Einstellungen von Benutzern
                - **Benutzerfreigaben verwalten**: Ermöglicht die Verwaltung der Freigaberechte für Posteingänge, Adressbücher und Kalender der Benutzer
            - **Manage domain dataprotect**: ermöglicht den Zugriff auf die Datenschutz-Schnittstelle, um Daten der gesamten Domain wiederherzustellen
    - **Server verwalten**: gibt Zugriff auf den Bereich "Anwendungsserver" der Administrationskonsole, ermöglicht das Hinzufügen und Entfernen von Servern sowie das Ändern ihrer Parameter und ihrer Rollen
    - **Verwalten der Domain-Maximalwerte**: Verwaltung der maximalen Anzahl der in der Domain zulässigen Benutzer
    - **Manage dataprotect**: Ermöglicht den Zugriff auf die dataprotect-Schnittstelle zur Wiederherstellung einzelner Benutzerdaten
    - **Sudo (Privilegienerweiterung)**: erlaubt es, sich anstelle von Benutzern mit BlueMind zu verbinden, ohne deren Passwort zu kennen


****Zugriff auf Anwendungen****

- **Messaging und Kontakte**: Ermöglicht die Nutzung des Messaging-Dienstes, von Webmailer, der Kontaktsynchronisation und der Web-Kontaktanwendung.
- **Terminplaner und Aufgaben**: Ermöglicht die Synchronisierung von Terminplanern und Aufgaben sowie die Verwendung zugehöriger Webanwendungen
- **Instant Messaging**: Ermöglicht die Nutzung der webbasierten Instant-Messaging-Anwendung und des XMPP-Dienstes mit Clients von Drittanbietern
- **Telefonie**: ermöglicht die Integration von Telefonie in Webanwendungen
- **Administrationskonsole**: Zugriff auf die Administrationskonsole - **erforderlich für alle Verwaltungsrollen**
- **Verwaltung von Firmenunterschriften**: Zugriff auf die Anwendung zur [Verwaltung von Unterschriften und des Disclaimers](/Guide_de_l_administrateur/Configuration/Signatures_d_entreprise/)
- **API Docs Integration**: ermöglicht den Zugriff auf die [API-Dokumentation](https://forge.bluemind.net/staging/doc/latest/web-resources/) in integrierter Form zu BlueMind: ein Link "API Docs" wird im oberen Banner von BlueMind neben den anderen Anwendungen hinzugefügt


** **Allgemein** **

- **Einstellungen ändern**: ermöglicht dem Benutzer die Änderung seiner BlueMind-Einstellungen
- **Passwort ändern**: ermöglicht es dem Benutzer, sein Passwort jederzeit zu ändern
- **Ändern der eigenen Informationen**: ermöglicht dem Benutzer, selbst die Informationen zu ändern, die in seiner Datei im Verzeichnis sichtbar sein werden Hinweis: derzeit ist keine Schnittstelle zur Verwaltung der BlueMind-Parameter des Benutzers verfügbar, diese Funktion ermöglicht Skriptaktionen unter Verwendung des  API-Schlüssels des Benutzers (siehe [Benutzerparameter - Kapitel 6 API-Schlüssel](/Guide_de_l_utilisateur/Paramètres_utilisateur/))
- **Verwaltung der eigenen Geräte (ActiveSync)**: Ermöglicht es dem Benutzer, die Zugänge seiner eigenen Geräte über EAS-Synchronisation (Exchange ActiveSync) zu verwaltenHinweis: derzeit ist keine Schnittstelle in der Verwaltung der BlueMind-Einstellungen des Benutzers verfügbar, diese Funktion ermöglicht Skript-Aktionen unter Verwendung des  Benutzer-API-Schlüssels (siehe [Benutzereinstellungen - Kapitel 6 API-Schlüssel](/Guide_de_l_utilisateur/Paramètres_utilisateur/))
- **Verwaltung der eigenen externen Konten**: Ermöglicht es Ihnen, ein Nextcloud-Konto zu verbinden, wenn es auf der Domain installiert ist, um den in BlueMind eingebauten Speicher für große Anhänge durch den Nextcloud-Speicher des Benutzers zu ersetzen. (siehe [Große Dateien und Abtrennung von Anlagen](/Guide_de_l_utilisateur/La_messagerie/Fichiers_volumineux_et_détachement_des_pièces_jointes/))


** **E-Mail-System** **

- **E-Mail-Filter verwalten**: Ermöglicht dem Benutzer, seine persönlichen E-Mail-Filter zu verwalten
- **E-Mail-Identitäten verwalten**: Ermöglicht dem Benutzer das Erstellen und Einrichten von E-Mail-Identitäten ab seiner Hauptadresse, einem Alias oder einem geteilten Posteingang
- **Externe Identität**: ermöglicht es dem Benutzer, Identitäten mit einer  Domain-externen Adresse als Absender zu erstellen
- **Nachrichtenweiterleitung**: Ermöglicht die automatische Weiterleitung aller empfangenen Nachrichten an eine andere E-Mail-Adresse, intern oder extern.Wenn diese Rolle deaktiviert ist, kann der Benutzer keine globale Weiterleitung seiner E-Mails (intern oder extern) aktivieren UND keinen E-Mail-Filter mit Weiterleitung an eine externe Adresse aktivieren.


**Cloud**

- **Drive**: Möglichkeit zum Abrufen und erneuten Senden von Anhängen, die zuvor vom Benutzer abgetrennt und auf dem Server gespeichert wurden
- **Anhänge**: Möglichkeit, [Anhänge](https://forge.bluemind.net/confluence/display/DA/.Fichiers+volumineux+et+detachement+des+pieces+jointes+vBM-3.5) von Nachrichten [abzutrennen](https://forge.bluemind.net/confluence/display/DA/.Fichiers+volumineux+et+detachement+des+pieces+jointes+vBM-3.5), um sie den Empfängern als Download-Link anzuzeigen


Weitere Informationen über die Verwaltung dieser Rechte finden Sie auf den Seiten zur [Benutzerverwaltung](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/) und zur [delegierten Administration](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/L_administration_déléguée/)

