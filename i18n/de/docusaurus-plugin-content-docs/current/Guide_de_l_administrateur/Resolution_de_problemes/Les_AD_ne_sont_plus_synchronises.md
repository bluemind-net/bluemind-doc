---
title: "AD werden nicht mehr synchronisiert"
confluence_id: 57771847
position: 70
---
# AD werden nicht mehr synchronisiert


## Problem

Die AD-Verzeichnisse werden nicht mehr synchronisiert.

Beim Ändern eines Attributs der AD-Verzeichnisse (insbesondere 2008r2) erhalten wir die Meldung:

*Die Eigentümerschaft der FSMO-Rolle konnte nicht überprüft werden, weil die Verzeichnispartition nicht korrekt mit mindestens einem Replikationspartner repliziert wurde.*

## Lösung

Erzwingen Sie die Neusynchronisation der AD-Verzeichnisse mit dem Windows-Befehl, der auf einem DC ausgeführt werden soll: *Repadmin /syncall DC_name /APed*

## Siehe auch

[http://blogs.technet.com/b/askds/archive/2009/07/01/getting-over-replmon.aspx](http://blogs.technet.com/b/askds/archive/2009/07/01/getting-over-replmon.aspx)

