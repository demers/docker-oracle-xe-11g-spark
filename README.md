# Description du dépôt Git demers/docker-oracle-xe-11g-spark

Ce projet est basé sur https://github.com/wnameless/docker-oracle-xe-11g

Voici les caractéristiques du conteneur contruit ici:

- Ubuntu 18.04+
- Serveur SSH pour se connecter par SSH
- Accès SSH au conteneur, nom d'utilisateur `ubuntu` et mot de passe `ubuntu`
- Éditeur de programmation Vim et Nano installés
- Java 13
- Maven
- Hibernate
- Spark

# Oracle

- Oracle Express Edition 11g Release 2
- Le mot de passe administrateur `SYSTEM` et `SYS` est `oracle`
- Le mot de passe de la base de données déjà installé pour `PROJETS` est `projets`
- Console ligne de commande Bash et Fish
- Application SQLPlus installé
- Ports 49161 ouvert pour une connection `localhost` avec SQLPlus local ou par SQLDeveloper

# Java

- Java Oracle version 13 installé (commande `javac` pour compiler et `java` pour exécuter)
- Pilote `ojdbc6.jar` installé pour permettre un accès aux BD Oracle par un programme Java
- Maven
- Hibernate
- Spark

# Python

- Langage Python 3 installé
- Pilote Oracle pour Python 3 `cx_oracle`
- Un programme Python 3 test disponible à `/home/ubuntu/oracleConnection.py` (voir plus bas pour les exécuter)

# Préalables

Vous devez avoir sur votre système:

- Windows Pro et Education (si vous êtes sous Windows)
- (optionnel) Linux (meilleur choix que Windows pour Docker)
- Chocolatey (si vous êtes sous Windows 10)
- Docker 17+
- Docker compose 2+
- Au moins 3,5 Go d'espace disque
- Désactiver votre antivirus
- Désactiver votre parefeu.

# Comment installer Docker et Docker-compose sous Windows

ATTENTION: Vous devez avoir Windows PRO ou Education.  Sinon, faites le passage à PRO
par exemple, voir cette méthode https://www.lifewire.com/upgrade-windows-10-home-to-pro-4178259

Vous devez vous assurer que l'option de virtualisation dans votre BIOS est bien
activée.

Il faut d'abord activer Hyper-V.  Voir https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v ou https://www.poweronplatforms.com/enable-disable-hyper-v-windows-10-8/

Il suffit d'exécuter la commande Powershell suivante:

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

Il faut redémarrer l'ordinateur après.

On installe Docker en suivant les étapes de: https://runnable.com/docker/install-docker-on-windows-10

On installe Chocolatey par les étapes suivantes: https://chocolatey.org/install
(redémarrer votre console PS)

On installe Git par la commande suivante:

```
choco install git
```

On installe Docker-compose en suivant les étapes de: https://docs.docker.com/compose/install/#install-compose
(section Windows Server est le plus rapide)

On active la commande SSH en suivant les étapes décrites dans ce guide: https://www.howtogeek.com/336775/how-to-enable-and-use-windows-10s-built-in-ssh-commands/

# Comment installer ce projet Docker sur votre ordinateur

Vous devez ouvrir une console Bash (pour Linux) ou Powershell (pour Windows) et exécuter:

```
git clone https://github.com/demers/docker-oracle-xe-11g-spark.git

cd docker-oracle-xe-11g-spark

docker-compose up -d
```

Si vous êtes sous Linux, il se peut que vous aillez à modifier le fichier
docker-compose.yml pour décommenter la ligne suivante:

```
  # network_mode: "host"
```

Vous pouvez vous connecter au conteneur par SSH et utiliser
le nom du serveur localhost pour le port 2222 (pas 22).

```
ssh -p 2222 -l ubuntu localhost
```

Si vous êtes sous Linux, il se peut que vous aillez à changer le port de 2222
à 22.

Pour arrêter temporairement le conteneur (par exemple, à la fin de votre
travail), on tape:

```
docker-compose stop
```

On redémarre le conteneur arrêté (pour reprendre vos travaux) par:

```
docker-compose start
```

On détruit le conteneur par:

```
docker-compose down

docker rmi oracle11gspark
```

On peut faire une copie de sécurité du conteneur par la commande (3 Go au moins
du fichier généré):

```
docker export oracle11gspark -o oracle11gspark.tar
```

On importe ensuite une copie par la commande:

```
docker import oracle11gspark.tar
```

# Comment installer SQL Plus client sur votre ordinateur

## Windows

Voir les explications à https://www.oratable.com/sqlplus-instant-client-installation/

## Ubuntu

Voir les explications à https://webikon.com/cases/installing-oracle-sql-plus-client-on-ubuntu

# Comment se connecter à Oracle par SQLPlus de l'intérieur du conteneur

Quand vous êtes connecté au conteneur (par SSH ou par Putty), pour accéder à la console Oracle, on tape simplement:

```
sqlplus
```

On peut aussi ajouter le nom d'utilisateur et mot de passe:

```
sqlplus SYSTEM/oracle
```


Si on veut se connecter directement au compte PROJETS, on tape le raccourci
(alias):

```
sp
```

N.B.: Le programme `rlwrap` est utilisé pour obtenir un historique par la flèche vers
le haut.

# Comment se connecter à Oracle par SQLPlus de l'extérieur du conteneur

## Le conteneur s'exécute localement sur votre ordinateur

Si votre conteneur s'exécute localement sur votre ordinateur et que vous avez
installé SQLPlus ([voir](https://www.oratable.com/sqlplus-instant-client-installation/) pour Windows ou [voir](https://askubuntu.com/questions/159939/how-to-install-sqlplus) pour Ubuntu 18.04), faites la commande:

```
sqlplus SYSTEM/oracle@//localhost:49161/XE
```

ou

```
sqlplus PROJETS/projets@//localhost:49161/XE
```

Si vous êtes sous Linux, il se peut que vous aillez à changer le port 49161 pour
1521.

## Le conteneur s'exécute à l'extérieur sur un serveur à l'adresse 11.22.33.44

```
sqlplus SYSTEM/oracle@//11.22.33.44:49161/XE
```

# Comment installer SQL Developer

## Sous Windows 10

Téléchargez le choix avec JDK 8 inclus à https://www.oracle.com/tools/downloads/sqldev-downloads.html

Vous décompressez par exemple dans `C:\SQLDeveloper` et vous exécutez
l'exécutable dans le dossier.

Si vous avez des problèmes, consultez https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/sqldev-install-windows-1969674.html

## Ubuntu

Si vous l'installez sous Ubuntu 18.04 ou un équivalent, il vous faut
OpenJDK 8 et vous devez installer JavaFX par la commande:

```
sudo apt install openjdk-8-jdk openjdk-8-jre
```

Voir plus d'info à https://tecadmin.net/install-oracle-java-8-ubuntu-via-ppa/

Vous devez aussi suivre la [procédure suivante](https://github.com/JabRef/user-documentation/issues/204) pour installer JavaFX.

## Comment utiliser SQL Developer avec le conteneur

Après installation sans erreur de SQL Developer, créez une nouvelle connexion en utilisant le nom
d'utilisateur `SYSTEM` et mot de passe `oracle`.  Le nom de l'hôte est
`localhost` et le port est 49161.  Le SID est `xe`.  Il n'y a rien d'autre
à changer.

Si vous êtes sous Linux, il se peut que vous aillez à changer le port 49161 pour
1521.

# Tout ce qui concerne la programmation Java

## Comment partir les tests Java

Connectez-vous au conteneur par SSH comme suit:

```
ssh -p 2222 -l ubuntu localhost
```

Dans la console qui apparaît, vous tapez la commande:

```
mvn test
```

Il se peut qu'il faille l'exécuter en mode administrateur comme suit:

```
sudo mvn test
```

## Comment modifier le code Java

À l'extérieur du conteneur, il suffit de modifier les fichiers dans le dossier
"src".  Il n'est pas nécessaire d'arrêter le conteneur.

Après avoir modifier le code Java disponible dans le dossier `src` du projet
Spark, on se reconnecte par SSH au conteneur et on exécute les commandes:

```
mvn "package"
```

On redémarre le serveur Spark par la commande `spark`

## Comment démarrer le serveur API Web Spark

Le serveur Spark est accessible à l'adresse `http://localhost:4567` sur le Web.

Normalement, le serveur Spark est déjà en exécution.

On le redémarrage par la commande:

```
spark
```

Si cela ne fonctionne pas, on tape plutôt:

```
java -jar target/sparkprojets-jar-with-dependencies.jar &
```

Cela peut aider à voir l'erreur produite.  Il se peut que ce soit une erreur
de compilation.  Pour voir les messages d'erreur, on tape:

```
mvn "test"
```

