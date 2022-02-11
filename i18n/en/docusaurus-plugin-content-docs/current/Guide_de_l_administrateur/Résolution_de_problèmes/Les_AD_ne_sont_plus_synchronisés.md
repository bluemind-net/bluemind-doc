---
title: "ADs no longer synchronized"
confluence_id: 79863418
position: 70
---
# ADs no longer synchronized


# Issue

AD directories are no longer synchronized.

When modifying an AD directory attribute (e.g. 2008r2), you get the message:

*The FSMO role ownership could not be verified because its directory partition has not replicated successfully with at least one replication partner**.*

# Solution

Force AD directory synchronization by running the windows command *Repadmin /syncall DC_name /APed *on a DC*.*

# See also

[http://blogs.technet.com/b/askds/archive/2009/07/01/getting-over-replmon.aspx](http://blogs.technet.com/b/askds/archive/2009/07/01/getting-over-replmon.aspx)

