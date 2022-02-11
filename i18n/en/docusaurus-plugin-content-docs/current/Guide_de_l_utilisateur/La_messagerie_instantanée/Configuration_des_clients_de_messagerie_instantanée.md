---
title: "Setting up Instant Messaging Clients"
confluence_id: 79862178
position: 50
---
# Setting up Instant Messaging Clients


# Introduction

The XMPP protocol allows users to connect their dedicated software to BlueMind's instant messaging service and chat with other users, whether they too use BlueMind's integrated instant messaging application or any other dedicated software.


#  Thunderbird

1 
In Thunderbird, go to ![](../../attachments/79862178/79862185.png) > Tools > Chat Status > Show accounts...

1 Chat account wizard:
  - If no account is set up, the wizard opens automatically.
  - If at least one account is set up, click "New account" in the bottom left corner of the account management window.
1 
Select "XMPP" and click "Next".
![](../../attachments/79862178/79862192.png)

1 
In the "Username" box, enter your full email address (including domain name).
![](../../attachments/79862178/79862193.png)

1 
Enter your email password.
![](../../attachments/79862178/79862195.png)

1 
Entering a local alias is optional and will only be visible by you.
![](../../attachments/79862178/79862196.png)
XMPP options:

  - Resource > optional
  - Priority > optional
  - Connection security > Require encryption
  - Server > same address as BlueMind
  - Port > 5222
1 Summary dialog > Uncheck "Connect this account now", otherwise the Thunderbird certificate acceptation prompt will not open when you first connect.![](../../attachments/79862178/79862197.png)


# Pidgin

1 Go to Accounts > "Manage accounts" and click "Add account".
1 In the "Basic" tab, fill in the connection information:![](../../attachments/79862178/79862179.png)
  - Protocol: XMPP
  - Username: full email address (including domain name)
  - Domain: BlueMind's server domain
  - Resource: optional
  - Password: user password
Note: "User options" are optional. Among others, they allow you to define an avatar and display name, which will not be visible by fellow chatters.1 In the "Advanced" tab, fill in the server information:![](../../attachments/79862178/79862198.png)
  - Connection security: "Require encryption"
  - Connection port: 5222
  - Connection server: full BlueMind server address, usually the same as the web application's address.


# Gajim

1 Opening the account creation wizard:
  - When you start Gajim, if no account is set up, the account creation window opens automatically.
  - Otherwise, go to Edit > Accounts > click "Add".
1 Select "I already have an account I want to use" and click "Forward".![](../../attachments/79862178/79862199.png)
1 Enter the user connection information and click "Forward":![](../../attachments/79862178/79862200.png)
  - Jabber username: first and then second part of the user's email address.
  - password: the same as the email password.
1 Once the account is created, click "Advanced":![](../../attachments/79862178/79862201.png)
1 Go to the "Connection" tab and check "Use custom hostname/port" to enter the server information:![](../../attachments/79862178/79862202.png)
  - Hostname: full BlueMind server address, usually the same as the web application's address.

  - Port: 5222.
1 Click "Close" to return to the Gajim homepage. 
1 When you first connect (to change your status to "Available" for instance), a warning message about the security certificate appears. Confirm that you want to add this certificate in order to be able to connect:![](../../attachments/79862178/79862203.png)


 

 

 

