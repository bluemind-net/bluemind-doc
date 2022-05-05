---
title: "Übertragen einer Mailbox-Baumstruktur von einem Konto zu einem anderen"
confluence_id: 57771958
position: 78
---
# Übertragen einer Mailbox-Baumstruktur von einem Konto zu einem anderen


## Ziel

Beispielsweise sollen nach Ausscheiden eines Benutzers oder Wiederaufnahme einer Aktivität die Nachrichten von einem Benutzer auf einen Mitarbeitenden übertragen werden. Nachrichten sollen mit demselben Ordnerbaum abgerufen werden, ohne ihn manuell neu erstellen zu müssen.

Aufgetretene Probleme:

- BlueMind-Webmailer lässt das Kopieren/Verschieben von Ordnern aus einer freigegebenen Mailbox oder eines anderen Benutzers nicht zu
- Fat Clients, selbst mit Import/Export-Erweiterungen, verwalten das Kopieren von Dateien von einem Konto zu einem anderen schlecht oder gar nicht


## Lösungen

### Benutzerwiederherstellung durchführen

BlueMind stellt Scripts zur Wiederherstellung einer Mailbox in einer anderen Mailbox  zur Verfügung: [Wiederherstellen des Inhalts eines Benutzer- oder geteilten Posteingangs](/Base_de_connaissance/Restauration_du_contenu_d_une_boîte_utilisateur_ou_partagée/)

Der komplette Benutzerbaum wird in einem Unterordner des Zielbenutzers neu erstellt, der anschließend Ordner und Nachrichten verschieben oder diejenigen löschen kann, die er nicht behalten möchte.
Aus Gründen der Vertraulichkeit kann der Administrator dies bei Bedarf selbst erledigen, sobald die Wiederherstellung abgeschlossen ist.

### Einen Import per imapsync durchführen

Der komplexere Import mittels [imapsync](https://github.com/imapsync/imapsync) erlaubt eine feinere Parametrierung, insbesondere durch den Ausschluss von Ordnern.

BlueMind stellt Ihnen eine Anleitung zur Verfügung, die Sie beim Importieren unterstützt: [doc-bluemind-imapsync.pdf](../attachments/57771958/57771959.pdf)

