---
title: "Changing a BlueMind Server's IP Address"
confluence_id: 79863493
position: 42
---
# Changing a BlueMind Server's IP Address


This page describes how to change a BlueMind server's IP address.
:::important

Warning

This description is deliberately minimal as it is reserved to experienced administrators who are familiar with the sensitive operations performed.

:::

# Instructions

- 
stop BlueMind using the command: 


```
bmctl stop
```


- 
Start postgresql :


```
systemctl start postgresql
```


- Update the server's network configuration with the new IP address
- Edit the file `/etc/bm/bm.ini` , replacing the address of the "`host`" and "`hz-member-address`" parameters with the new IP address
- Modify the `/etc/cyrus-replication` file and replace the "`core_sync_host`" parameter address with the new IP address
- 
Update the database information with the following command line:


```
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update t\_server set ip = '<new\_ip>' where ip= '<old\_ip>';"
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update rc\_users set mail\_host = '<new\_ip>' where mail\_host= '<old\_ip>';"
sudo -u postgres -i psql -h localhost -U bj -d bj -W -c "update t\_systemconf set configuration = configuration || hstore('host', '<new\_ip>' || hstore('hz-member-address', '<new\_ip>');"
```


Where :

  - 
&lt;old_ip>is the previous IP

  - 
&lt;new_ip> is the new IP

*If prompted for a password, type "bj"*- Edit the `/var/backups/bluemind` folder structure, renaming the folder `/var/backups/bluemind/dp_spool/rsync/&lt;old_ip>` with the new IP address
- 
Restart BlueMind and the node using the following commands:


```
bmctl start
systemctl restart bm-node
```


- Connect to the administration panel superadministrator admin0
- Go to Security > Manage firewall and click "Save" to force re-generate BlueMind's firewall rules
- Go to System Management > Manage Messaging System, click "Execute" to regenerate the postfix mail routing table
- Go to System Management > System Configuration and replace the old IP address in the field "My networks" by the new address of the address range you want to keep as open relay. Click "Save". 
- 
Reconfigure tick using the following command:


```
bm-cli tick reconfigure
```


