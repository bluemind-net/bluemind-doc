---
title: "Installation Prerequisites"
confluence_id: 57771186
position: 40
---
# Installation Prerequisites


## System

**Available Memory


**

BlueMind's default configuration requires at least **12Gb**.

**CPU**

**2 vCPU** min

**Locales**

The en_US.UTF-8 must be installed and generated (even if the system is configured to use another locale).

To check that it is installed correctly, use the following command line:


```
$ locale -a|grep en\_US
en\_US.utf8
```


**Linux distribution**


:::info

**BlueMind requires a blank, dedicated server or virtual machine.**

:::


:::info

BlueMind doesn't support LXC technology, you should user KVM.

:::

BlueMind requires a **64-bit** version of supported distributions (for Ubuntu, make sure you have the Server version):

- Ubuntu 16.04 LTS Server (Xenial Xerus)
- Ubuntu 18.04 LTS Server (Bionic Beaver)
- Ubuntu 20.04 LTS Server (Focal Fossa)*
- RedHat Entreprise Linux / CentOS 7
- RedHat Entreprise Linux / CentOS 8*
- Debian 8 Jessie
- Debian 9 Stretch
- Debian 10 Buster


** from BlueMind 4.3.0*


:::info

Repository signature

Repositories are now signed for all supported Ubuntu/Debian distribution – this is a requisite for Ubuntu 18.04 and Debian 9.

You may, if you need or want to, manually import the key on all our supported distributions using the following command:


```
curl https://pkg.bluemind.net/bluemind-deb.asc | apt-key add -
```


Otherwise, a warning may come up during earlier version updates. **Please note that this will not disrupt updates**.

:::


:::info

Ubuntu: universe repositories

For Ubuntu distributions, the installation of Bluemind requires **universe **repositories. These can be installed using the following commands:


```
add-apt-repository universe
apt update
```


:::


**System configuration**

To ensure that the installation script is able to run commands with elevated privileges (*sudo*), the `requiretty` directive must not be enabled in the `/etc/sudoers` configuration file. If it is present, you must remove it or keep it as a comment.

## Network & DNS

### IP address

The server must have a static IP, system-defined or supplied by a DHCP server.

### Hostname

The BlueMind server hostname must be configured correctly, and the server name must be resolvable by name from another machine.

Specifically, BlueMind expects the following results to the *hostname* command:


```
$ hostname -s
mail
```


![](../attachments/57769989/69896490.png) must return the short system name, e.g. here: mail


:::info

For versions **preceding 4.0.5,** the short name must be returned by the `hostname` command without any options:


```
$ hostname
mail
```


From 4.0.5, the result of this command is not relevant.

:::


```
$ hostname -f
mail.blue-mind.net
```


![](../attachments/57769989/69896490.png) must return the fully qualified system name (FQDN), e.g. here: mail.blue-mind.net

The hostname also has to be properly set in the server's `/etc/hosts` file:


```
IP\_SERVER mail.blue-mind.net mail
```


### Network cards

If your server has several network cards, the first one (eth0) must bear the BlueMind server's external IP address.

## Partitioning

The guidelines below are not required but recommended to make your server's maintenance more straightforward.

| mount point | description | type |
| --- | --- | --- |
| NFS | block device |
| / | root |  |  |
| /var/spool/cyrus | emails |  |  |
| /var/spool/bm-hsm | archived emails |  |  |
| /var/spool/bm-elasticsearch | search index |  |  |
| /var/spool/bm-mail | email sending via EAS/mapi | 


 | ~2Gb |  |  |
| /var/log | logs |  |  |
| /var/backups/bluemind | backups |  |  |

