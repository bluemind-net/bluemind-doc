---
title: "Multi-domain Messaging"
confluence_id: 57771242
position: 30
---
# Multi-domain Messaging

BlueMind can host several, fully-partitioned, mail services on a single infrastructure (one or several servers, physical or virtual). This principle, called **multi-domain** or multi-tenant, can be used in cloud infrastructures or simply to have several mail services coexist.

Although, technically, this **multi-domain infrastructure** is the same as a single installation, functionally, each domain in this infrastructure must be viewed as a distinct mail service, i.e. independent and isolated from other domains.


## Domains and domain aliases

A **domain** is identified by its **main domain name** (e.g. [mail.bluemind.net](http://mail.bluemind.net)).

Each domain can have several aliases: these are other domain or sub-domain names (e.g. [webmail.bluemind.net](http://webmail.bluemind.net) or [mail.bluemind.fr](http://mail.bluemind.fr)) that are hosted on the same domain. In this case, mail services are not partitioned.
These domains can:

- serve as aliases, each user can exist in one or several domain alias(es) (meaning users can receive messages through one or several of these domains in which their address has been defined)
- serve as distinct mail services, but that aren't completely partitioned. This means, for example, that two companies with the same director can have a single mail service and the director has an account in both domains. That way he has a single calendar which he can share with users in either domain. In this configuration, all users have an email in the main domain.

### Selection criteria in multi-domain architectures

Within a single mail domain, data isn't partitioned.
Individual rights can be used to hide or partition user data through the rights set by administrators and users themselves.

Within the partitioned domains of a multi-domain infrastructure, data is completely partitioned.
The mail services are sealed off, and data cannot be exchanged (see below for examples of possible sharing).

### Sharing information between mail services

Collaborative mail functionalities typically allow you to access data and information coming from other systems. BlueMind has this capability, as its sharing mechanisms can be implemented within other mail services and, obviously, within other BlueMind mail domains.


:::tip

Clarification

In the following examples, calendars and address books can be made visible to all or some users.

:::

#### Sharing individual calendars

External calendar sharing functionalities allow users to access BlueMind calendars from other BlueMind domains (see [Sharing Calendars](../../Guide_de_l_utilisateur/L_agenda/Partager_un_calendrier.md)).

Example of use: the director of two organisations on separate domains can view his calendar from the first domain on the second one by sharing its url (public or private). He can also share it with employees from either organisation.

#### Sharing domain calendars

Domain calendars (created by an administrator) can be shared to another BlueMind domain using the same method.

Example of use: a marketing calendar shared by two subsidiaries is viewed on two separate domains. It is fed by users of either one of these domains. It can be published and viewed in the other domain by creating a new external calendar associated to a sharing url.

#### Sharing address books

Using APIs, you can an export address book from one BlueMind domain and insert it, still using APIs, as an address book from another BlueMind domain.

Example of use: the address book of local government officials is maintained from the city's mail domain and can be accessed through the metropolitan government's mail domain.

## Domain administration

The domain administration section gives you access to technical domain settings (server addresses, domain aliases, etc.) as well as default user settings (address books, message filters, storage quotas, archiving, etc.).

To learn more, please go to [Managing Domains](../../Guide_de_l_administrateur/Configuration/Gestion_des_domaines/index.md)


