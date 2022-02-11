---
title: "Déploiement BlueMind 4 : points de vigilance"
confluence_id: 57771184
position: 38
---
# Déploiement BlueMind 4 : points de vigilance


# Introduction

La version 4 de BlueMind intègre des évolutions majeures en terme d'architecture avec d'une part le support d'Outlook nativement et d'autre part une réplication des données pour préparer les données de messagerie pour Outlook et d'autres usages (nouveau webmail, périphériques mobiles en particulier).

# La réplication

La réplication, une active par [shard de mail](/Guide_d_installation/Installation/Installation_avec_répartition_des_données_sur_plusieurs_serveurs/) (donc une par [rôle mailbox-role](/Guide_de_l_administrateur/Configuration/Gestion_des_serveurs/)), permet à  Cyrus de transmettre une copie des messages au service bm-core. Le service bm-core va utiliser cette réplication pour récupérer des "métadonnées" des messages nécessaires pour bm-eas, bm-mapi et la recherche ElasticSearch. Ces "métadonnées" sont stockées en base de données (comme le fait Exchange) et dans ElasticSearch.

Ainsi, il est possible d'avoir repris la totalité d'un spool de mail (coté Cyrus), les mails étant visibles dans le webmail et Thunderbird, alors que la réplication est en échec. Dans ces conditions, les messages ne sont pas disponibles (tout ou partie) :

- dans Outlook
- via EAS (smartphones)
- dans le moteur de recherche (webmail, smartphones)
- pour la création des filtres dans les paramètres utilisateurs ou la console d'administration (les dossiers n'apparaissent pas)


## Reprise de données et réplication

Au stade actuel de stabilisation du protocole MAPI entre BlueMind et Outlook, la reprise des données par chargement PST depuis Outlook est à proscrire. De façon générale, une reprise de données par processus cadré coté serveur est plus sûre et sera plus cohérente en terme de résultat de reprise.

Les solutions de reprise conseillées sont :

- l'outil de migration Exchange
- l'outil de reprise PST coté serveur
- les outils de synchronisation IMAP avec imapsync (voir préconisations ci-dessous)
- l'outil de reprise Domino


La réplication extrait et stocke des informations du spool de mail dans des objets BlueMind qui doivent exister au préalable. Ainsi, pour le bon fonctionnement de la réplication, seules des données connues de BlueMind doivent être alimentées dans cyrus : les domaines et mailbox doivent donc être créés préalablement dans la console d'administration (ou via API), ** **avant**** de remplir les boîtes mail.

Actuellement, en admin0 (super-administrateur BlueMind), il est possible de reprendre les données BlueMind sans tenir compte des objets et des règles de stockage des mails de BlueMind. En effet, avec les droits admin0, des données de messagerie peuvent être stockées sur le serveur Cyrus sans qu'aucune vérification de droit ou de cohérence ne soit faite. Pour cette raison, les données peuvent être vues comme incohérentes pour BlueMind et ainsi faire échouer la réplication. **Nous déconseillons donc l'import de données par imapsync avec l'utilisateur admin0**.

Pour éviter cela, si une reprise des données BlueMind par imapsync est prévue, **il est important que l'imapsync soit effectué avec le login de l'utilisateur lui-même**. En faisant les opérations en tant qu'utilisateur de la messagerie, on est assuré que le compte existe, que la partition est la bonne, etc...

Pour créer une clé API pour un utilisateur donné :

[https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples/generateUserToken.py](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/python-api-examples/generateUserToken.py)

Exemple de reprise de données à adapter selon le serveur source et les comptes / données à récupérer :

[https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/migration/4.0/kerio](https://forge.bluemind.net/stash/projects/BA/repos/bluemind-samples/browse/migration/4.0/kerio)

De manière générale et en particulier pour la 4, il est fortement recommandé de tester la reprise de données sur un serveur de test, qui sera ré-installé ou détruit ensuite. Le processus de reprise de données, une fois validé, doit être effectué sur un serveur (ou un domaine) vierge, sans trace des opérations effectuées en phase de test. La connexion LDAP / AD, les reprises de données par ImapSync ou reprise Exchange, une fois prototypées avec succès, peuvent être re-jouées sur le serveur de production.

# Refonte de l'archivage BlueMind

A partir de la version 4, l'archivage des messages (HSM) est géré nativement par Cyrus (voir la page dédiée : [Archivage](/Guide_de_l_administrateur/Configuration/Archivage/)).

Si votre installation utilisait déjà l'archivage en version 3.5, il est nécessaire de récupérer ces archives 3.5 pour les ré-intégrer dans Cyrus (qui le gérera ensuite de façon autonome et transparente selon la politique définie).

Cela a un impact significatif sur les espaces de stockage des mails et implique des opérations de reprise généralement longues, à organiser de façon cohérente avec les étapes de mise à jour en 4.

Une procédure détaillée de mise à jour en 4 décrit les opérations nécessaires pour la reprise des archives. Elle est disponible sur l'espace Partenaire : [Procédure de mise à jour depuis BlueMind 3.5 vers BlueMind 4](https://forge.bluemind.net/confluence/pages/viewpage.action?pageId=58598516). Il est très important de la lire attentivement.

# Dimensionnement

Plusieurs réorganisation d'architecture et modifications du fonctionnement de BlueMind impacte le dimensionnement des espaces de stockage des serveurs BlueMind. Il faut être particulièrement vigilant pour éviter des "full disks" qui vont perturber, bloquer ou faire échouer la mise à jour en version 4. Voici les évolutions de stockage qui peuvent impacter votre installation de BlueMind :

- 
*/var/spool/bm-replication *: prévoir une augmentation significative de l'espace occupé. Il est nécessaire d'avoir un espace disponible correspondant à 25% de */var/spool/cyrus/data*

- */var/spool/bm-elasticsearch* : 20 à 25% de la volumétrie des mails des deux dossiers */var/spool/cyrus/data* et */var/spool/bm-hsm*
- */var/lib/postgresql *: la base de données doit pouvoir croitre de 10% du volume des mails* *(*/var/spool/cyrus/data* et */var/spool/bm-hsm*)
- */var/log/bm/replication.log *peut grossir de façon très importante. La partition correspondante doit avoir au moins 1Go d'espace disque disponible.


En terme de ressources mémoire, pour permettre au service ElasticSearch de fonctionner pendant la phase de mise à jour, il est nécessaire de lui allouer 1,5Go supplémentaire.

Ces besoins en espace disque supplémentaire sont expliqués dans la procédure de mise à jour vers la version 4 : [Procédure de mise à jour depuis BlueMind 3.5 vers BlueMind 4](https://forge.bluemind.net/confluence/pages/viewpage.action?pageId=58598516).

# BlueMind sans MAPI

Ce mode de fonctionnement a ses limites que BlueMind n'est pas en mesure d'outrepasser. C'est la raison pour laquelle BlueMind a développé la connexion native avec Outlook, solution qui permet une meilleure prise en compte des fonctionnalités d'Outlook.

Si vos utilisateurs sont habitués et satisfaits du connecteur Outlook, ce fonctionnement peut être maintenu. Sinon, il est recommandé de basculer progressivement sur Outlook via MAPI.

#### Outlook

Sans le service MAPI, Outlook continue de fonctionner avec connecteur [de la même façon qu'en version 3.5](https://forge.bluemind.net/confluence/display/BM35/Synchronisation+avec+Outlook). Les administrateurs doivent effectuer la même procédure de [Provisioning Users to the Outlook Connector](https://forge.bluemind.net/confluence/display/BM35/Mise+a+disposition+du+connecteur+Outlook) pour que les utilisateurs puissent le télécharger et l'installer sur leurs postes.

Le **mapping des dossiers** n'est pas compris ni traduit par outlook. Les dossiers par défaut tels que Boite de réception, Message envoyés, etc. apparaissent en anglais, car consultés via le protocole IMAP, sans traduction à la volée. Cela ne gêne pas la bonne synchronisation d'un point de vue technique, mais peut être gênant pour les utilisateurs. À titre d'information, avec MAPI, le mapping est correctement géré.

#### Cyrus

À partir de la version 4.1, une vérification de l'arborescence Cyrus est réalisée au démarrage de BlueMind et alerte (au moyen d'un warning dans les logs) si l'arborescence n'est pas cohérente.

# BlueMind avec MAPI

#### Autodiscover

À partir de la version 4.1, une vérification de l'autodiscover est réalisée sur tous les domaines et alias de l'installation : si aucun autodiscover ne fonctionne alors le service MAPI ne démarre pas, si au moins un autodiscover est bon alors le service démarre afin de servir les domaines accessibles.

Ainsi pour chaque domaine et alias, le serveur mapi tente une requête vers `domain.loc/autodiscover` et `autodiscover.domain.loc/autodiscover` et vérifie qu'il reçoit bien lui-même la requête.

Une vérification est aussi effectuée sur le serveur DNS pour vérifier l'enregistrement `_autodiscover.\_tcp.domain.loc` et `_autodiscover.&lt;tous les alias>`.
:::important

Pour s'assurer que le serveur est correctement configuré et joignable sur ces urls, on pourra utiliser l'outil de diagnostic en ligne de Microsoft : [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/)

:::

#### Cyrus

À partir de la version 4.1, une vérification de l'arborescence Cyrus est réalisée au démarrage de BlueMind et alerte (au moyen d'un warning dans les logs) si l'arborescence n'est pas cohérente.

## Outlook

### Recommandations et bonnes pratiques

Pour fonctionner dans sa version actuelle, Outlook ne doit pas être pollué par des "objets" qui ne viennent pas de BlueMind. C'est pourquoi il est indispensable de créer un profil Outlook vierge et de ne pas configurer un compte Exchange / Office365 sur le même profil.

Par ailleurs, des clés de registres sont à appliquer, entre autres pour éviter des conflits de configuration avec des informations disponibles sur le réseau (DNS, ActiveDirectory). Ces clés de registres sont indiquées dans la documentation suivante : XXXXXXXXX


### Création d'un profil Outlook vierge

Afin de correctement connecter les Outlook sans connecteur, il convient dans un premier temps de bien suivre la documentation de mise en œuvre côté serveur :

[Mise œuvre de MAPI pour Outlook](/Guide_de_l_administrateur/La_souscription_BlueMind/Mise_en_œuvre_de_MAPI_pour_Outlook/)

**Nous attirons tout particulièrement votre attention sur le chapitre concernant les prérequis de communication avec le serveur : l'autodiscover doit fonctionner correctement pour qu'Outlook puisse communiquer avec BlueMind.**

Ensuite, pour chaque poste, suivre la documentation de création d'un profil pour Outlook :

[Synchronisation avec Outlook](/Guide_de_l_utilisateur/Configuration_des_clients_lourds/Synchronisation_avec_Outlook/)

Là aussi, attention à bien **valider au préalable l'accessibilité des urls depuis le poste**.

### Limitations Outlook liées au fonctionnement de BlueMind

Les limitations connues concernant le fonctionnement d'Outlook sont répertoriées dans notre page dédiée à la [compatibilité de BlueMind avec les logiciels clients et appareils](/FAQ_Foire_aux_questions_/Compatibilité/#Compatibilite-compat-outlook)

# En cas de problèmes :

## Version 4.0, 4.1, 4.2, 4.3 et 4.4

De très nombreuses améliorations ont été apportées dans les versions successives de BlueMind depuis la version 4.0. Toutes les versions antérieures à BlueMind 4.5 doivent être impérativement mises à jour rapidement pour bénéficier de toutes les améliorations développées.

## Vérification du bon fonctionnement de la réplication


:::important

Note

La réplication est maintenant largement stabilisée. Les problèmes de réplication sont rares. Ces instructions de vérification ne sont donc plus nécessaire dans le cas général

:::


Dans la [console de supervision bm-tick](/Guide_de_l_administrateur/Supervision/Monitoring_Bm_Tick/) vous pouvez surveiller le tableau (*dashboard*) "Mailspool & Replication". Deux graphiques en particulier sont importants :

 **Nombre de messages répliqués par heure**  :  

 ![](https://forge.bluemind.net/jira/secure/attachment/27530/27530_image-2019-07-09-18-26-52-783.png) 

 **Nombre de réplications actives**  :

 ![](https://forge.bluemind.net/jira/secure/attachment/27531/27531_image-2019-07-09-18-27-16-720.png) 

Ce nombre doit être de 1 par serveur ayant le rôle mailbox et donc le service bm-cyrus-imapd, si ce nombre chute c'est que la réplication ne se fait pas/plus.

A contrario, si ce nombre dépasse le nombre de backend IMAP, c'est dans la plupart des cas que le rôle a été attribué à un (ou plusieurs) [serveur de stockage séparé](/Guide_d_installation/Installation/Installation_avec_répartition_des_données_sur_plusieurs_serveurs/) mais que le service tourne toujours sur le serveur principal. Il convient alors de forcer la désactivation en créant les fichiers suivants sur le bm-core puis en stoppant les services :


```
touch /etc/bm/bm-cyrus-imapd.disabled
touch /etc/bm/bm-lmtpd.disabled
systemctl stop bm-cyrus-imapd ; systemctl stop bm-lmtpd
```


A chaque instant, pour voir si la réplication est fonctionnelle, vous pouvez faire une opération sur un mail (par exemple le passer en non lu) et vérifier grâce à une commande `tail` si, au même instant, une ligne de ce type s'ajoute dans le fichier de log `/var/log/bm/replication.log` :


```
{{APPLY MAILBOX (.... loginUtilisateur ) }}
```


## Avancement du process de réplication

Des améliorations tick vont permettre dans les versions futures d'avoir une meilleure vision de l'avancement de la réplication.

En attendant, il est possible de comparer le nombre de mails des spools de mails et d'archives avec le nombre d'entrées dans la table stockant les messages. La correspondance n'est pas exacte, mais donne une bonne vision de l'avancement.

Ainsi, pour connaître le nombre de mail à synchroniser :


```
# Nombre de mails du spool :
find /var/spool/cyrus/data/ -type f|wc -l

# Nombre de mails des archives :
find /var/spool/bm-hsm/cyrus-archives -type f|wc -l
```


La somme des deux doit être proche du résultat de la requête sur la base bj-data :


```
select count(*) from t\_message\_body;
```


A noter que le flux standard de réplication ne surveille que les boites aux lettres "vivantes". Cela signifie que si le delta de réplication reste significatif alors que la réplication est presque arrêtée, tous les utilisateurs actifs ont bien été répliqués et ont accès aux fonctionnalités associées (recherche webmail, EAS, etc.).
À noter aussi que le comptage est approximatif: si un mail est envoyé à N utilisateurs, il sera compté une fois dans t_message_body mais sera présent N fois dans le spool.

Pour lancer la réplication sur les boites passives (non utilisées), il faut positionner l'ensemble des boites dans la file de réplication avec la commande suivante, après avoir nettoyé certains logs de Cyrus :


```
#nettoyage cyrus
service bm-cyrus-imapd stop
rm /var/lib/cyrus/sync/core/log*
service bm-cyrus-imapd start
#lancement de la réplication
bm-cli maintenance repair --ops replication.parentUid $DOMAIN\_UID$
```


où `$DOMAIN_UID$` est le nom du domaine, par exemple : [bluemind.net](http://bluemind.net)

# Limitations connues

Vous pouvez consulter les limitations connues référencées dans la [documentation de compatibilité de BlueMind](/FAQ_Foire_aux_questions_/Compatibilité/).

## Mise à jour de BlueMind 4.0 vers 4.x

### Dossiers sous la boîte de réception

Dans les versions 4.0.x de BlueMind, les dossiers créés sous la boîte de réception par Outlook ne sont pas des dossiers de messagerie mais des dossiers virtuels.

**BlueMind 4.1 apporte le support des sous-dossiers de la boîte de réception (inbox)**.
:::important

Mise à jour 4.0.x vers 4.x

****Attention :**** dans le cadre d'une mise à jour de BlueMind 4.0.x vers 4.1 ou supérieure, **les dossiers virtuels ne seront pas migrés et seront supprimés.**

Pour se prémunir de cela, il est possible de déplacer ces dossiers virtuels en dehors de la boîte de réception **avant la mise à jour** de façon à les conserver, ils pourront ensuite y être remis et seront recréés en tant que dossiers de messagerie.

:::


