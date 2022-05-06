---
title: "IMAP-Synchronisation unter Android"
confluence_id: 57771006
position: 70
---
# IMAP-Synchronisation unter Android


:::info

Diese Anleitung wurde mit einem LG Nexus 5 unter Android 5.0.1 erstellt

Für andere Telefone oder Android-Versionen ist die Bedienung gleich, auch wenn sich die Bildschirme erheblich unterscheiden können. Vor allem in früheren Android-Versionen wurden die E-Mails in der „E-Mail“-Anwendung eingesehen, nun können Sie mit der „Gmail“-Anwendung alle Ihre E-Mail-Konten gruppieren, unabhängig davon, ob sie von Google Mail bereitgestellt werden oder nicht.

:::


## Konfiguration des neuen E-Mail-Kontos

Öffnen Sie die Gmail-Anwendung:

![](../../../attachments/57771006/57771033.png)

*Hinweis: Die E-Mail-Anwendung ist weiterhin vorhanden, aber eine Warnmeldung leitet auf die Gmail-Anwendung um, wenn sie geöffnet wird*

Öffnen Sie das Menü:

![](../../../attachments/57771006/57771032.png)

Wählen Sie „Hinzufügen eines Kontos“:

![](../../../attachments/57771006/57771031.png)

Wählen Sie einen persönlichen Kontotyp:

![](../../../attachments/57771006/57771030.png)

Geben Sie die E-Mail-Adresse ein:

![](../../../attachments/57771006/57771029.png)

Wählen Sie die Konfiguration eines IMAP-Kontos:

![](../../../attachments/57771006/57771028.png)

Geben Sie das Passwort des Benutzers ein:

![](../../../attachments/57771006/57771027.png)

Geben Sie die Informationen des Eingangsservers ein (Server, der die Nachrichten empfangen/abfragen darf):

![](../../../attachments/57771006/57771026.png)

Außer in Sonderfällen:

- der Benutzername ist identisch mit Ihrer E-Mail-Adresse
- die Serveradresse (hier *mail.bluemind.loc*) ist identisch mit der Zugangsurl zu BlueMind ( https://wird entfernt).Wenn Sie z. B. auf BlueMind über Ihren Browser unter der Adresse [https://mail.bluemind.loc](https://mail.bluemind.loc) zugreifen, müssen Sie **mail.blumind.loc**eingeben
- der Sicherheitstyp muss **SSL/TLS sein (alle Zertifikate akzeptieren)** und nicht einfach SSL/TLS


Die Informationen des Postausgangsservers (Server, der das Senden von Nachrichten erlaubt) eingeben:

![](../../../attachments/57771006/57771025.png)

Außer in Sonderfällen sind die Informationen und insbesondere die Serveradresse die gleichen wie beim Eingangsserver.


:::info

Vergessen Sie nicht, das Kontrollkästchen „Anmeldung erforderlich“ zu aktivieren.
Aus Sicherheitsgründen erlaubt der Server nur seinen Benutzern, Nachrichten zu senden. Mit dieser Option wird die Anwendung angewiesen, den Server um Authentifizierung zu bitten, wenn sie Nachrichten sendet.

:::


:::info

Ports und Sicherheit

Bei den oben aufgeführten Optionen handelt es sich um Standardinformationen. Ports und Verbindungsmethoden können variieren, bei Problemen wenden Sie sich bitte an Ihren Administrator, der Ihnen die einzugebenden spezifischen Informationen übermittelt.

IMAP (Posteingangsserver):

- 143: TLS möglich
- 993: SSL


SMTP (Postausgangsserver):

- 25: TLS möglich, aber nicht zwingend erforderlich
    - ohne Authentifizierung: kann nur an eine der BlueMind-Domänen gesendet werden
    - mit Authentifizierung oder von einer IP, die in der Administratorschnittstelle unter Systemverwaltung > Systemkonfiguration > Registerkarte „Mailbox“ > Felder „Meine Netzwerke“ aufgeführt ist: kann an jeden Empfänger gesendet werden
- 465: SSL + Authentifizierung erforderlich - kann an jeden Empfänger gesendet werden
- 587: TLS + Authentifizierung erforderlich - kann an jeden Empfänger gesendet werden


:::

Nachdem die Verbindung ordnungsgemäß getestet und hergestellt wurde, bietet die Anwendung an, die wichtigsten Optionen des Kontos zu konfigurieren:

![](../../../attachments/57771006/57771024.png)

Markieren Sie die gewünschten Optionen und klicken Sie auf „Weiter“.

Geben Sie den Kontonamen und den Namen ein, der in gesendeten Nachrichten als Benutzername erscheinen soll:

![](../../../attachments/57771006/57771023.png)

Das E-Mail-Konto erscheint dann in der Kontoliste der Anwendung:

![](../../../attachments/57771006/57771022.png)

Die E-Mails werden abgerufen und angezeigt:

![](../../../attachments/57771006/57771021.png)


 

 

 

 

 

 

