---
title: "Setting up Instant Messaging Clients"
confluence_id: 57770743
position: 52
---
# Setting up Instant Messaging Clients


## Introduction

The XMPP protocol allows users to connect their dedicated software to BlueMind's instant messaging service and chat with other users, whether they too use BlueMind's integrated instant messaging application or any other dedicated software.


##  Thunderbird

1. In Thunderbird, go to ![](../../attachments/57770743/66094998.png) > Tools > Chat Status > Show accounts...

2. Chat account wizard:
    - If no account is set up, the wizard opens automatically.
    - If at least one account is set up, click "New account" in the bottom left corner of the account management window.
3. Select "XMPP" and click "Next".
![](../../attachments/57770743/66095005.png)

4. In the "Username" box, enter your full email address (including domain name).
![](../../attachments/57770743/66095006.png)

5. Enter your email password.
![](../../attachments/57770743/66095008.png)

6. Entering a local alias is optional and will only be visible by you.
![](../../attachments/57770743/66095009.png)
XMPP options:

    - Resource > optional
    - Priority > optional
    - Connection security > Require encryption
    - Server > same address as BlueMind
    - Port > 5222
7. Summary dialog > Uncheck "Connect this account now", otherwise the Thunderbird certificate acceptation prompt will not open when you first connect.![](../../attachments/57770743/66095010.png)


## Pidgin

1. Go to Accounts > "Manage accounts" and click "Add account".
2. In the "Basic" tab, fill in the connection information:![](../../attachments/57770743/66094992.png)
    - Protocol: XMPP
    - Username: full email address (including domain name)
    - Domain: BlueMind's server domain
    - Resource: optional
    - Password: user password
Note: "User options" are optional. Among others, they allow you to define an avatar and display name, which will not be visible by fellow chatters.3. In the "Advanced" tab, fill in the server information:![](../../attachments/57770743/66095011.png)
    - Connection security: "Require encryption"
    - Connection port: 5222
    - Connection server: full BlueMind server address, usually the same as the web application's address.


## Gajim

1. Opening the account creation wizard:
    - When you start Gajim, if no account is set up, the account creation window opens automatically.
    - Otherwise, go to Edit > Accounts > click "Add".
2. Select "I already have an account I want to use" and click "Forward".![](../../attachments/57770743/66095012.png)
3. Enter the user connection information and click "Forward":![](../../attachments/57770743/66095013.png)
    - Jabber username: first and then second part of the user's email address.
    - password: the same as the email password.
4. Once the account is created, click "Advanced":![](../../attachments/57770743/66095014.png)
5. Go to the "Connection" tab and check "Use custom hostname/port" to enter the server information:![](../../attachments/57770743/66095015.png)
    - Hostname: full BlueMind server address, usually the same as the web application's address.

    - Port: 5222.
6. Click "Close" to return to the Gajim homepage. 
7. When you first connect (to change your status to "Available" for instance), a warning message about the security certificate appears. Confirm that you want to add this certificate in order to be able to connect:![](../../attachments/57770743/66095016.png)


 

 

 

