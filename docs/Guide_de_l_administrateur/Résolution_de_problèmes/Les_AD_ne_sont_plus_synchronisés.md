---
title: "Les AD ne sont plus synchronisés"
confluence_id: 57771847
position: 70
---
# Les AD ne sont plus synchronisés


# Problème

Les annuaires AD ne sont plus synchronisés.

Lors de la modification d'un attribut des annuaires AD (2008r2 notamment), on a le message:

*L'appartenance du rôle FSMO n'a pas pu être vérifiée car la partition du répertoire n'a pas été répliquée correctement avec au moins un partenaire de réplication.*

# Solution

Forcer la resynchronisation des annuaires AD avec la commande windows à exécuter sur un DC: *Repadmin /syncall DC_name /APed*

# Voir aussi

[http://blogs.technet.com/b/askds/archive/2009/07/01/getting-over-replmon.aspx](http://blogs.technet.com/b/askds/archive/2009/07/01/getting-over-replmon.aspx)

