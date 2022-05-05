---
title: "Installation und Zugang"
confluence_id: 57771690
position: 60
---
# Installation und Zugang


## Präsentation

Die bm-tick Monitoring Suite wird in BlueMind 4 automatisch und standardmäßig installiert.


## Installation

Die Softwarepakete sind mit der BlueMind-Installation auf dem Server vorinstalliert, erfordern aber eine Konfigurationsphase:

1. Melden Sie sich an der Administrationskonsole als Superuser admin0 (oder delegierter Administrator mit den erforderlichen Rechten) an und gehen Sie zu Systemadministration > Anwendungsserver > wählen Sie die Registerkarte Server > Server-Rollen
2. Aktivieren Sie die Rolle "Metrics Base (influxdb)":![](../../../attachments/57771690/57771692.png)
3. ****Speichern****
4. Installieren Sie die letzten Pakete, die für den Zugriff auf die Konsole benötigt werden, und starten Sie BlueMind neu:


```
aptitude install bm-plugin-admin-console-monitoring bm-plugin-node-monitoring
bmctl restart
```


5. Starten Sie eine erste Generierung der Standardwarnungen und -Dashboards der Anwendung. Führen Sie dazu – immer noch als root mit dem Rechner verbunden – den folgenden Befehl aus:


```
bm-cli tick reconfigure
```


6. Laden Sie den Nginx-Dienst neu:


```
systemctl reload bm-nginx
```

Hinweis: Dieser Befehl wirkt sich nicht auf die Benutzer aus, er kann ohne Risiko einer Unterbrechung ausgeführt werden


## Zugriff auf die Anwendung

Sie können auf die Anwendung zugreifen durch Verbindung mit der Url **https://&lt;ihr bluemind>.tld/tick**


:::tip

Geben Sie als Benutzername und Passwort die des Installationsassistenten ein, die Ihnen bei der Installation von Bluemind mitgeteilt wurden und die in der BlueMind Administration konfigurierbar sind.

Wenn Sie diese verloren haben, beziehen Sie sich auf die FAQ zu diesem Thema: [Ich habe das Passwort für den Installationsassistenten verloren](/FAQ_Foire_aux_questions_/#FAQ-swpassword)

:::

Der Zugriff auf die Anwendung **ist **vereinfacht und [rollenabhängig](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/Les_rôles_droits_d_accès_et_d_administration/):

- Weisen Sie die Rolle "**Monitoringkonsole**" den gewünschten Personen zu (über die Verwaltung jedes Benutzers oder über eine Gruppe)
- Die Personen haben dann (ggf. nach einer erneuten Verbindung) einen "Supervision"-Link im Banner, über den sie auf die Konsole zugreifen können:![](../../../attachments/57771690/57771694.png)


