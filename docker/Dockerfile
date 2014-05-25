FROM debian:latest

# Install base services: supervisor, sshd and some tools (vim, ps, ifconfig...)
RUN apt-get update
RUN apt-get install -y procps vim supervisor net-tools ssh wget unzip

RUN apt-get install -y mysql-client mysql-server
ADD supervisor_mysql.conf /etc/supervisor/conf.d/mysql.conf

# Configure SSH
RUN echo root:root | chpasswd
ADD supervisor_sshd.conf /etc/supervisor/conf.d/sshd.conf
RUN service ssh start
ADD root.profile /root/.profile
RUN chown root:root /root/.profile

RUN apt-get install -y php5 git php5-mysql

RUN cd /var/www && git clone https://github.com/42Zavattas/TechnoGarden-backend.git

RUN service mysql start && sleep 10 && mysql -u root -e "CREATE DATABASE technogarden" && cd /var/www/TechnoGarden-backend && mysql -u root technogarden < backup_db.sql

EXPOSE 80
EXPOSE 3306
EXPOSE 9000

ADD supervisor_technogarden_back.conf /etc/supervisor/conf.d/technogarden_back.conf

## FRONT 
RUN cd /var/www && git clone https://github.com/42Zavattas/TechnoGarden-prod.git

# Install Node.js
RUN cd /opt; \
wget --quiet http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz; \
tar -xzf node-v0.10.26-linux-x64.tar.gz; \
cd /usr/bin; \
ln -s /opt/node-v0.10.26-linux-x64/bin/node; \
ln -s /opt/node-v0.10.26-linux-x64/bin/npm

# ADD supervisor_technogarden_front.conf /etc/supervisor/conf.d/technogarden_front.conf


# RUN cd /var/www/TechnoGarden && npm install


# On container run, launch supervisor
CMD ["/usr/bin/supervisord", "--nodaemon"]
