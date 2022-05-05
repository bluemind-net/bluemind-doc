---
title: "Ändern der IP-Adresse eines BlueMind-Servers"
confluence_id: 58593019
position: 42
---
# Ändern der IP-Adresse eines BlueMind-Servers


In diesem Dokument wird beschrieben, wie Sie die IP-Adresse eines BlueMind-Servers ändern können.


:::info

Bitte beachten

Dieses Verfahren ist erfahrenen Administratoren vorbehalten, die mit den durchgeführten sensiblen Vorgängen vertraut sind, und wird aus diesem Grund nicht im Detail beschrieben.

:::

## Verfahren

- Beenden Sie BlueMind mit dem Befehl


```
bmctl stop
```


- Starten Sie postgresql:


```
systemctl start postgresql
```


- Aktualisieren Sie die Netzwerkkonfiguration des Servers mit der neuen IP-Adresse
- Ändern Sie die Datei `/etc/bm/bm.ini` und ersetzen Sie die Adresse der Parameter "`host`" und "`hz-member-address`" durch die neue IP-Adresse
- Aktualisieren Sie die Datenbankinformationen mit der folgenden Kommandozeile:


```
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update t\_server set ip = '<new\_ip>' where ip = '<old\_ip>';"
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update rc\_users set mail\_host = '<new\_ip>' where mail\_host = '<old\_ip>';"
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update t\_systemconf set configuration = configuration || hstore('host','<new\_ip>') || hstore('hz-member-address', '<new\_ip>');"
```

wo:

    - &lt;old_ip die alte IP-Adresse ist, und

    - &lt;new_ip> die neue

*Hinweis: Wenn Sie nach einem Passwort gefragt werden, geben Sie "bj" ein*- Ändern Sie die Baumstruktur von `/var/backups/bluemind` und bennenen Sie den Ordner `/var/backups/bluemind/dp_spool/rsync/<old_ip> mit der` neuen IP-Adresse um
- Starten Sie BlueMind und den *Node* mit den folgenden Befehlen neu:


```
bmctl start
systemctl restart bm-node
```


- Melden Sie sich im Admin-Bereich als Superadministrator admin0 an
- Gehen Sie in den Bereich Sicherheit > Firewall-Verwaltung und klicken Sie sofort auf die Schaltfläche "Speichern", um die Neu-Generierung der BlueMind-Firewall-Regeln zu erzwingen
- Gehen Sie zu System-Management > Mail-Wartung, klicken Sie auf die Schaltfläche "Ausführen", um die Postfix-Mail-Routing-Tabellen neu zu generieren
- Gehen Sie in den Beriech Systemverwaltung > Systemkonfiguration und ersetzen Sie die alte IP-Adresse im Feld "Meine Netzwerke" durch die neue Adresse oder den Adressbereich, für den Sie ein offenes Relais haben möchten, bevor Sie auf die Schaltfläche "Speichern" klicken


