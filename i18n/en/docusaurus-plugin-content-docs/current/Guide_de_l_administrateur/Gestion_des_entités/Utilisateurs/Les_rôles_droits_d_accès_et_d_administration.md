---
title: "Roles: Access and Administration Rights"
confluence_id: 79863034
position: 56
---
# Roles: Access and Administration Rights


The roles that can be assigned to users include the right of access to applications (webmail, contacts, etc.), the right to use specific features (creating external identities, enabling email auto-forward, etc.) or administration rights to delegate certain management responsibilities (users, domain, etc.).
:::important

Delegating rights

Administrators are only able to delegate a right they themselves have, except for access to applications or features: e.g. even if they don't have a mail account an admin can enable "Mail and Contacts" to users they administrate, or allow them to create external identities or mail forwarding, even if they don't have those rights themselves.

:::

Users can be assigned the following roles:

** **Administration** **

- 
**System manager**: Allows users to manage all aspects of the BlueMind installation
:::important

The domain manager role includes the same rights as the admin0 on the items below.

This means that the manager will have full access to user accounts, settings and data: messages, contacts, calendar. When they access user calendars, managers will be able to see all the details of users' private events, including when the calendar is displayed in their own view.

:::

  - **Monitoring console**: Gives users access to the monitoring console which is used to check services and server statuses
  - **Manage system configuration**: Allows users to modify the system configuration
  - **Manage BlueMind subscription**: Allows users to install and update [the BlueMind subscription](/Guide_de_l_administrateur/La_souscription_BlueMind/)
  - **Manage domains**: Allows users to manage domain configurations and entities
    - **Manage external users**: Allows users to create and administer [External users](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/Utilisateurs_externes/)
    - **Domain administrator**: Allows users to manage system information
      - **Manage mailshares**: Allows users to create, modify and delete mailshares and how they are shared
        - **Manage mailshare sharings**: Allows users to modify mailshare sharing
      - **Manage domain calendars**: Allows users to create, modify and delete domain calendars
        - **Manage domain calendar sharings**: Allows users to modify domain calendar sharing
      - **Manage domain address books**: Allows users to create, modify, delete domain address books and how they are shared 
        - **Manage domain address books sharings**: Allows users to modify domain address books sharing
      - **Manage domain external LDAP address books**: Allows users to create, modify and delete domain address books synchronized with external LDAP directories
      - **Manage groups**: Allows users to create, update or delete groups and manage their members
        - **Manage group members**: Allows users to add and remove group members
        - **Manage group sharings**: Allows users to add, modify or delete sharings in a group mailbox
      - **Manage resources**: Allows users to create, modify and delete resources and how they are shared
        - **Manage resource sharings**: Allows users to modify resource sharing
      - **Manage resource types**: Allows users to create and delete resource types
      - **Manage organizational units**: Allows users to create and delete organizational units
      - **Manage users**: Allows users to create, update and delete users
        - **Manage external accounts**: Allows users to manage external user accounts so that they can store attachments in an external system connected to BlueMind (see [Connecting with Nextcloud](/Guide_de_l_administrateur/Configuration/Détachement_des_pièces_jointes/Connecter_avec_Nextcloud/))
        - **Manage user subscriptions**: Allows users to modify users subscriptions
        - **Manage own devices (ActiveSync)**: Allows users to manage access authorizations for their own devices (ActiveSync)
        - **Manage user mail identities**: Allows users to create, modify or delete user mail identities
        - **Manage user information**: Allows users to manage user information intended to appear in the directory and in VCard exports
        - **Manage user passwords**: Allows users to modify user passwords
        - **Manage user settings**: Allows users to modify personal user settings
        - **Manage user sharings**: Allows user to modify user sharing settings
      - **Manage domain dataprotect:** Allows users to access the dataprotect UI to restore domain data
  - **Manage servers**: Gives access to "Application servers" in the administration console which is used to add or remove servers and modify server settings and roles
  - **Manage domain max values**: Allows users to set and modify max domain values
  - **Manage dataprotect**: Allows users to access the dataprotect UI to restore user-specific data 
  - **Sudo (privilege elevation)**: Allows users to log into BlueMind in another user's place via the administration console without having to know the user's password


****Access to Applications****

- **Webmail and Contacts**: Allows users to use the mail service, the webmail application, contact synchronization and the contact web application
- **Calendar and Tasks**: Allows users to use tasks and calendar synchronization and web applications 
- **Instant messaging**: Allows users to use the instant messaging web application and the XMPP service with external clients
- **Telephony**: Allows users to use telephony integration in all web applications
- **Admin console**: Allows users to use administration console's web application - **required for all management roles**
- **Manage Corporate Signatures**: Allows users to [manage corporate signatures and disclaimer](/Guide_de_l_administrateur/Configuration/Signatures_d_entreprise/)
- **API docs integration**: Allows users to have the [api docs](https://forge.bluemind.net/staging/doc/latest/web-resources/) application integrated in their BlueMind application: an "API Docs" link is added to BlueMind's top toolbar next to the other applications


** ** General ** **

- **Change own settings**: Allows users to change their personal settings
- **Change own password**: Allows users to change their personal passwords
- **Change own information**: Allows users to modify their personal information for the directory or VCard exportsNB: to date, there is no UI in users' BlueMind settings this feature allows script-based actions using users' API key (see [User settings - chapter 6 API keys](/Guide_de_l_utilisateur/Paramètres_utilisateur/))
- **Manage own devices (ActiveSync)**: Allows users to manage access to their personal devices (ActiveSync)NB: to date, there is no UI in users' BlueMind settings. This feature allows script-based actions using users' API key (see [User settings - chapter 6 API keys](/Guide_de_l_utilisateur/Paramètres_utilisateur/))
- **Manage external accounts**: Allows users to connect a Nextcloud account – provided it is installed on the domain – in order to store large file attachments in the user's Nextcloud account storage connected to BlueMind. (see [Large files and linked attachments](/Guide_de_l_utilisateur/La_messagerie/Fichiers_volumineux_et_détachement_des_pièces_jointes/))


** **Mail** **

- **Change own mail filters**: Allows users to manage their personal incoming mail filters
- **Change own mail identities**: Allows users to create, modify and delete their personal mail identities
- **External identity**: Allows users to create identities with external mail addresses
- **Mail forwarding**: Allows users to forward incoming emails to internal or external email addresses automaticallyWhen role is disabled, user cannot activate global mail forwarding (internal or external) AND cannot set a filter with forwarding to an external email address neither.


**Cloud**

- **Linked attachments**: Allows users to use the [linked attachments service](/Guide_de_l_utilisateur/La_messagerie/Fichiers_volumineux_et_détachement_des_pièces_jointes/) so that email attachments are shown to recipients as download links
- **Drive**: Gives access to the filechooser to find and resend linked attachments previously sent and stored on the server.


To find out more about managing these rights, go to the pages about [Users](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/) and [Delegated Administration](/Guide_de_l_administrateur/Gestion_des_entités/Utilisateurs/L_administration_déléguée/)

