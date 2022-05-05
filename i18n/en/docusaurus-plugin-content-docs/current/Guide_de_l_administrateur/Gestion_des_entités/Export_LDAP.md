---
title: "LDAP Exports"
confluence_id: 57771632
position: 66
---
# LDAP Exports


## Introduction

BlueMind allows you to export your directory in LDAP format so that it can be viewed and queried by other applications such as an LDAP directory.


## Procedure

1. Install the packages required on the BlueMind host server:


**
Ubuntu/Debian


**
RedHat/CentOS


**Ubuntu/Debian**

```
aptitude update
aptitude install bm-plugin-admin-console-ldap-export bm-plugin-core-ldap-export
```


**RedHat/CentOS**

```
yum update
yum install bm-plugin-admin-console-ldap-export bm-plugin-core-ldap-export
```


2. Restart BlueMind:


```
bmctl restart
```


3. Install the package* **bm-ldap-role* on the server on which you want the LDAP directory to run (which may be the BlueMind server or another separate server)


**
Ubuntu/Debian


**
RedHat/CentOS


**Ubuntu/Debian**

```
aptitude update
aptitude install bm-ldap-role
```


**RedHat/CentOS**

```
yum update
yum install bm-ldap-role
```


4. Assign the role to the server. To do this:
    - while logged in as admin0, go to the admin console > Application Servers
    - if your are using a separate server that does not exist yet, add it using the button New > Host ![](../../attachments/57771632/57771633.png)
    - select the server and go to the "Server roles" tab
    - in the "LDAP Directory" section, check "LDAP master directory created by BlueMind":![](../../attachments/57771632/57771634.png)
5. Click "Save" to confirm
6. Next, link this server to the domains as desired.To do this, go to the section Domain Management > Manage Domains and:
    - select the domain you want to export in LDAP format
    - go to the "BM Services" tab
    - select the server for the service with the same name "LDAP master directory created by BlueMind":![](../../attachments/57771632/57771635.png)
    - Click "Save" to confirm
Repeat this process for each domain as required.


Enregistrer

Enregistrer

Enregistrer

