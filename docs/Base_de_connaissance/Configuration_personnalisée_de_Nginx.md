---
title: "Configuration personnalisée de Nginx"
confluence_id: 57771920
position: 50
---
# Configuration personnalisée de Nginx


Les fichiers d'hôte virtuel Nginx (comme par exemple */etc/nginx/sites-enabled/bm-client-access*) sont gérés par BlueMind et **ne doivent en aucun cas être modifiés**.

Ces fichiers sont remplacés durant les opérations de mise à jour du système, perdant ainsi toute modification locale.

Cependant, il est possible d'ajouter des fichiers de configuration dans */etc/nginx/bm-local.d/* pour ajouter des configurations personnalisées.

