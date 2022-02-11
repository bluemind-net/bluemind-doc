---
title: "CLI Admin Client"
confluence_id: 79863366
position: 64
---
# CLI Admin Client


# Introduction

The CLI (Command Line Interface) client is used to perform BlueMind administration tasks in command line without having to create scripts.

When coupled with the bm-tick monitoring system, it can be used, among others, to manage it.

# Installation

The bm-cli client is installed by default with BlueMind 4.

There is an additional component for Outlook MAPI which is optional and can be installed using the corresponding package:


```
$ aptitude install bm-plugin-cli-mapi
```

:::important

No restart is required, the commands can be used immediately.

:::


# Using the client

## Commands

Commands are passed using a terminal straight onto the server, connected via ssh for instance.

For example, the command below can help you find a user's address books:


```
root@mail:~# bm-cli contact list jdoe@bluemind.loc
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:Contacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"My contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"Collected contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"408C741B-3FDC-44B6-B1FD-19E79404BFCF","name":"Perso"}
```


## Getting help
:::important

Commands are improved with every version of BlueMind. You may have more (or fewer) commands depending on your installation version.

**Make sure you use "bm-cli help" to find out which commands are available**.

For example:


```
# bm-cli help
usage: bm-cli <command> [<args>]

The most commonly used bm-cli commands are:
    calendar      calendar task(s)
    contact       contact task(s)
    help          Display help information
    maintenance   maintenance task(s)
    tick          tick task(s)
    user          user task(s)

See 'bm-cli help <command>' for more information on a specific command.
```


In this installation – version 3.5.11 – you have calendar, contact and user commands which didn't exist in previous versions.

:::

You can get help on a command, sub-command, how to use it and its options using "help" at any time.

E.g. "help maintenance" shows the maintenance command and the actions it can be used to perform:


```
# bm-cli help maintenance
NAME
        bm-cli maintenance - maintenance task(s)

SYNOPSIS
        bm-cli maintenance
        bm-cli maintenance consolidateIndex [--workers <workers>]
        bm-cli maintenance list [--workers <workers>]
        bm-cli maintenance repair [--dry] [--workers <workers>]

COMMANDS
        With no arguments, List directory entries

        list
            List directory entries
...
```


For more details about a sub-command, type it to get help, e.g. about index consolidation:


```
# bm-cli help maintenance consolidateIndex
NAME
        bm-cli maintenance consolidateIndex - Consolidate a mailbox index

SYNOPSIS
        bm-cli maintenance consolidateIndex [--workers <workers>] [--] <target>

OPTIONS
        --workers <workers>
            run with X workers
...
```

:::important

BlueMind 4.4 supports the `--help` option – you can now get help by adding this option after a command:


```
~# bm-cli maintenance --help
Usage: bm-cli maintenance [-hV] [COMMAND]
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
Commands:
  help                 Displays help information about the specified command
  generate-completion  Generate bash/zsh completion script for bm-cli
  consolidateIndex     Consolidate a mailbox index
  hsm-to-cyrus         Converts HSM snappy spool to a cyrus maildir folder
  list                 List directory entries
  repair               Run repair maintenance operation
  ops                  List available maintenance operations
Exit Codes:
   0   Successful program execution.
   1   Internal software error: an exception occurred when invoking the
         business logic of this command.
  51   Usage error: user input for the command was incorrect, e.g., the wrong
         number of arguments, a bad flag, a bad syntax in a parameter, etc.


```


:::


## Practical examples

### Administration & Maintenance

#### Performing a domain-wide *check&repair* 

The following command is used to perform a "check and repair" operation on all domain users using 4 threads:


```
bm-cli maintenance repair domain.net --workers 4
```


#### Changing the admin0 password

For multiple reasons – technical or practical, e.g. in case it is lost -- you may need to change the admin0 user's password without logging into BlueMind.

The following command allows you to do this without knowing the old password:


```
bm-cli user update admin0@global.virt --password "NewPassword"
```


#### Updating Tick configuration

When [the Bm-Tick](/Guide_de_l_administrateur/Supervision/Monitoring_Bm_Tick/) monitoring tool is installed, you can use it to perform administration tasks. E.g. you can roll out its configuration on all domain servers again using the following command:


```
# bm-cli tick reconfigure
```

:::important

Add `--dry` to test the command: the operation is merely simulated.


```
# bm-cli tick reconfigure --dry
```


:::

#### Updating BlueMind

From BlueMind 4.1, if your subscription includes it, BlueMind can be updated in command line, without running the browser-based wizard:


**
Debian/Ubuntu


**
Redhat/CentOS


```
aptitude update
aptitude upgrade && bm-cli setup upgrade
```


```
yum update
yum upgrade && bm-cli setup upgrade
```


### Operations on users

#### Deleting archived (suspended) domain users

Commands can be coupled to perform several operations at once. 

E.g. the command below is used to look for the email addresses of suspended users:


```
bm-cli user get domain.net --archived --display "email"
```


You can then couple this command with a "delete" command to remove all the users it returns:


```
bm-cli user get local.lan --display "email" | jq -r '.[].email' > /tmp/archived.txt
while read account; do bm-cli user delete --dry $account ;done < /tmp/archived.txt
```


### Operations on calendars

#### Sharing all user calendars with one user

It may be useful for one user to have access privileges on all user calendars without being given an administrator role (e.g. a secretary might be able to view/create events for all other employees). To avoid having to go through each user's page to enable sharing, this can be done in command line.

This cannot be done with a single command, but you can create a loop which picks up all domain users and enables sharing for each of them:


```
bm-cli users get domain.net > /tmp/allUser.domain.net
while read account; do bm-cli calendar share $account « default » toto@domain.net r;done < /tmp/allUser.domain.net
```


### Operations on contacts

The procedure below can be used to clean a user's collected address book and transfer their contacts to their personal address book (and testing the import process beforehand):


```
root@mail:~# bm-cli contact list jdoe@bluemind.loc
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:Contacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"My contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18","name":"Collected contacts"}
{"owner":"05E25C2C-3643-4ED2-997C-4A4F39933D18","uid":"408C741B-3FDC-44B6-B1FD-19E79404BFCF","name":"Perso"}
root@mail:~# bm-cli contact deduplicate jdoe@bluemind.loc --addressbook-uid book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18
2 were removed out of 35
root@mail:~# bm-cli contact export jdoe@bluemind.loc --vcf-file-path /tmp/jdoe-collected.vcf --addressbook-uid book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18
addressbook book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18 of jdoe@bluemind.loc was exported
root@mail:~# bm-cli contact import jdoe@bluemind.loc --vcf-file-path /tmp/jdoe-collected.vcf --addressbook-uid 408C741B-3FDC-44B6-B1FD-19E79404BFCF --dry
DRY : AddressBook 408C741B-3FDC-44B6-B1FD-19E79404BFCF of jdoe@bluemind.loc was imported
root@mail:~# bm-cli contact import jdoe@bluemind.loc --vcf-file-path /tmp/jdoe-collected.vcf --addressbook-uid 408C741B-3FDC-44B6-B1FD-19E79404BFCF
AddressBook 408C741B-3FDC-44B6-B1FD-19E79404BFCF of jdoe@bluemind.loc was imported
root@mail:~# bm-cli contact reset jdoe@bluemind.loc --addressbook-uid book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18
Addressbook book:CollectedContacts\_05E25C2C-3643-4ED2-997C-4A4F39933D18 of jdoe@bluemind.loc was reset
```


