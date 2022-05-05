---
title: "Benutzerdefinierte Nginx-Konfiguration"
confluence_id: 57771920
position: 50
---
# Benutzerdefinierte Nginx-Konfiguration


Nginx-Dateien für virtuelle Hosts (z.B. */etc/nginx/sites-enabled/bm-client-access*) werden von BlueMind verwaltet und **dürfen unter keinen Umständen geändert werden**.

Diese Dateien werden bei Systemaktualisierungsvorgängen ersetzt, wobei alle lokalen Änderungen verloren gehen.

Es ist jedoch möglich, Konfigurationsdateien in */etc/nginx/bm-local.d/* hinzuzufügen, um benutzerdefinierte Konfigurationen hinzuzufügen.

