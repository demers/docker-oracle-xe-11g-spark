FROM wnameless/oracle-xe-11g-r2
# Origine: https://github.com/wnameless/docker-oracle-xe-11g


MAINTAINER FND <fndemers@gmail.com>

ENV PROJECTNAME=ORACLESPARK

ENV TERM=xterm\
    TZ=America/Toronto\
    DEBIAN_FRONTEND=noninteractive

# Access SSH login
ENV USERNAME=ubuntu
ENV PASSWORD=ubuntu

ENV WORKDIRECTORY=/home/ubuntu

RUN apt-get update
RUN apt install -y apt-utils vim-nox vim-gtk curl git nano psmisc

# Install a basic SSH server
RUN apt install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd
RUN /usr/bin/ssh-keygen -A

# Add user to the image
RUN adduser --quiet --disabled-password --shell /bin/bash --home ${WORKDIRECTORY} --gecos "User" ${USERNAME}
# Set password for the jenkins user (you may want to alter this).
RUN echo "$USERNAME:$PASSWORD" | chpasswd

RUN apt-get clean && apt-get -y update && apt-get install -y locales && locale-gen fr_CA.UTF-8
ENV TZ=America/Toronto
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/$TZ /etc/localtime

RUN apt install -y fish

RUN echo "export PS1=\"\\e[0;31m $PROJECTNAME\\e[m \$PS1\"" >> ${WORKDIRECTORY}/.bash_profile

# Ajout des droits sudoers
RUN apt-get install -y sudo
RUN echo "%ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN echo "export DISPLAY=:0.0" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "export DISPLAY=:0.0" >> /root/.bash_profile

RUN echo "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe" >> ${WORKDIRECTORY}/.bash_profile

RUN echo "export PATH=\$ORACLE_HOME/bin:$PATH" >> ${WORKDIRECTORY}/.bash_profile

RUN echo "export ORACLE_SID=XE" >> ${WORKDIRECTORY}/.bash_profile

# https://stackoverflow.com/questions/49757830/connecting-eclipse-to-docker-container-for-remote-debugging
#RUN echo "export JAVA_TOOL_OPTIONS=\"-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n\"" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "export JAVA_TOOL_OPTIONS=\"-Xdebug -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n\"" >> ${WORKDIRECTORY}/.bash_profile


#RUN echo "alias spark='killall java; sleep 1; nohup java -cp /home/ubuntu/classpath/ojdbc6.jar -jar target/sparkprojets-jar-with-dependencies.jar &'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "alias spark='killall java; sleep 1; nohup mvn exec:java &'" >> ${WORKDIRECTORY}/.bash_profile


RUN echo "echo 'Attendre 60 secondes le démarrage du serveur Oracle... (une fois seulement)'; sleep 60; echo 'alter system disable restricted session;' | /u01/app/oracle/product/11.2.0/xe/bin/sqlplus -s SYSTEM/oracle" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'Attendez quelques secondes...'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'Création du compte PROJETS...'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "sleep 2 # ENLEVER" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "sqlplus SYSTEM/oracle @compte.sql" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'Création des tables et insertions dans la BD PROJETS...'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "sleep 2" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "sqlplus PROJETS/projets @MRD.sql" >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'mvn "dependency:resolve" # ENLEVER' >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'mvn "verify" # ENLEVER' >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'mvn "test" # ENLEVER' >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'mvn "package" # ENLEVER' >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'sleep 2' >> ${WORKDIRECTORY}/.bash_profile
#RUN echo 'nohup java -cp /home/ubuntu/classpath/ojdbc6.jar -jar target/sparkprojets-jar-with-dependencies.jar &' >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'nohup mvn exec:java & # ENLEVER' >> ${WORKDIRECTORY}/.bash_profile
RUN echo "mv -f ~/.bash_profile ~/.bash_profile.init; grep -v 'Attendre' ~/.bash_profile.init > ~/.bash_profile" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "mv -f ~/.bash_profile ~/.bash_profile.init; grep -v 'sqlplus' ~/.bash_profile.init > ~/.bash_profile" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "mv -f ~/.bash_profile ~/.bash_profile.init; grep -v 'Création' ~/.bash_profile.init > ~/.bash_profile" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "mv -f ~/.bash_profile ~/.bash_profile.init; grep -v 'ENLEVER' ~/.bash_profile.init > ~/.bash_profile" >> ${WORKDIRECTORY}/.bash_profile

# Permet de garder un historique de la commande SQLPlus.
RUN apt-get install -y rlwrap

# Raccourcis de la commande SQLPlus
RUN echo "alias sqlplus='rlwrap sqlplus'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "alias sp='rlwrap sqlplus PROJETS/projets'" >> ${WORKDIRECTORY}/.bash_profile

RUN echo "echo ''" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'Notez que la commande sqlplus permet de démarrer SQLPlus.'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'Les mots de passe de SYSTEM et SYS sont oracle'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'La commande sp permet de se connecter automatiquement à PROJETS/projets.'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'On peut utiliser la commande sqlplus pour se connecter au compte SYSTEM/oracle.'" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "echo 'La commande spark permet de démarrer le serveur Spark.'" >> ${WORKDIRECTORY}/.bash_profile

# Installation X11.
RUN apt install -y xauth

RUN apt-get update
RUN apt-get install -y build-essential cmake python3-dev

RUN apt install -y software-properties-common apt-transport-https wget

EXPOSE 22
EXPOSE 1521
EXPOSE 8080
EXPOSE 8000

# Installation du pilote Java Oracle
# https://www.codejava.net/java-se/jdbc/connect-to-oracle-database-via-jdbc
ADD o.j /
RUN mv -f /o.j /ojdbc6.jar
RUN mkdir ${WORKDIRECTORY}/classpath
RUN mv -f /ojdbc6.jar ${WORKDIRECTORY}/classpath/
RUN chown -R ubuntu:ubuntu ${WORKDIRECTORY}/classpath

ADD JdbcOracleConnection.java ${WORKDIRECTORY}
RUN chown -R ubuntu:ubuntu ${WORKDIRECTORY}/JdbcOracleConnection.java

ADD j.d.aa /
ADD j.d.ab /
ADD j.d.ac /
ADD j.d.ad /
RUN cat /j.d.aa /j.d.ab /j.d.ac /j.d.ad > /j.d
RUN rm -f /j.d.a*
#RUN mv -f /j.d /jdk1.8_1.8.0251-1_amd64.deb
#RUN apt install -y /jdk1.8_1.8.0251-1_amd64.deb
RUN mv -f /j.d /jdk-13.0.2_linux-x64_bin.deb
RUN apt install -y /jdk-13.0.2_linux-x64_bin.deb

#RUN echo "export JAVA_HOME=/usr/java/jdk1.8.0_251-amd64/" >> ${WORKDIRECTORY}/.bash_profile
#RUN echo "export CLASSPATH=.:/usr/java/jdk1.8.0_251-amd64/lib:/home/ubuntu/classpath" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "export JAVA_HOME=/usr/lib/jvm/jdk-13.0.2/" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "export CLASSPATH=.:/usr/lib/jvm/jdk-13.0.2/lib:/home/ubuntu/classpath" >> ${WORKDIRECTORY}/.bash_profile

RUN echo "export PATH=\$JAVA_HOME/bin:$PATH" >> ${WORKDIRECTORY}/.bash_profile

# Installation Python 3
RUN apt install -y git python3 python3-pip python3-mock python3-tk
# Mise à jour PIP
RUN pip3 install --upgrade pip
RUN pip3 install flake8
RUN pip3 install flake8-docstrings
RUN pip3 install pylint
ENV PYTHONIOENCODING=utf-8

RUN git clone https://github.com/pyenv/pyenv.git ${WORKDIRECTORY}/.pyenv
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ${WORKDIRECTORY}/.bash_profile
RUN echo 'eval "$(pyenv init -)"' >> ${WORKDIRECTORY}/.bash_profile

# Installation du pilote Oracle pour Python 3
RUN pip3 install cx_oracle

ADD oracleConnection.py ${WORKDIRECTORY}
RUN chown -R ubuntu:ubuntu ${WORKDIRECTORY}/oracleConnection.py

# Pour la librairie cx_oracle de Python 3
RUN echo "export LD_LIBRARY_PATH=/u01/app/oracle/product/11.2.0/xe/lib/" >> ${WORKDIRECTORY}/.bash_profile
RUN echo "export LD_LIBRARY_PATH=/u01/app/oracle/product/11.2.0/xe/lib/" >> /root/.bash_profile

RUN cd ${WORKDIRECTORY} \
    && mkdir work \
    && chown -R $USERNAME:$PASSWORD work .bash_profile .pyenv

# Accès au serveur Oracle
EXPOSE 27017

RUN apt-get update
RUN apt-get install -y maven

# Accès à Spark
EXPOSE 4567

WORKDIR ${WORKDIRECTORY}

ADD pom.xml ${WORKDIRECTORY}/pom.xml
RUN mkdir ${WORKDIRECTORY}/dbrepository
RUN cd ${WORKDIRECTORY}
RUN mvn deploy:deploy-file -Dfile=./classpath/ojdbc6.jar -DgroupId=ojdbc6 -DartifactId=ojdbc6 -Dversion=11.2.0.4.0 -Dpackaging=jar -Durl=file:./dbrepository/ -DrepositoryId=dbrepository -DupdateReleaseInfo=true
#RUN mvn install:install-file -Dfile=./classpath/ojdbc6.jar -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0.4.0 -Dpackaging=jar
RUN chown -R $USERNAME:$PASSWORD ${WORKDIRECTORY}/dbrepository

#RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]

#RUN ["mvn", "test"]
#RUN ["mvn", "package"]

EXPOSE 4567

ADD start.sh /
RUN chmod +x /start.sh

RUN chown ubuntu:ubuntu ${WORKDIRECTORY}/pom.xml
#RUN chown -R ubuntu:ubuntu ${WORKDIRECTORY}/target

ADD MRD.sql ${WORKDIRECTORY}
ADD compte.sql ${WORKDIRECTORY}
RUN chown ubuntu:ubuntu ${WORKDIRECTORY}/MRD.sql
RUN chown ubuntu:ubuntu ${WORKDIRECTORY}/compte.sql

CMD ["/start.sh"]
