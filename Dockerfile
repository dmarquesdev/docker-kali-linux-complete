FROM "kalilinux/kali-linux-docker"

RUN apt-get update \
&& apt-get  dist-upgrade -y \
&& apt-get install -y kali-linux-full \
&& apt-get install -y tor ftp rpcbind nfs-common \
&& apt-get autoremove \
&& apt-get clean

EXPOSE 80
EXPOSE 9050

COPY internal/docker-entrypoint.sh /opt/docker-entrypoint.sh
COPY internal/update.sh /opt/update.sh

RUN echo "alias update='/opt/update.sh'" >> ~/.bashrc

RUN cd /usr/share/wordlists && gzip -d rockyou.txt.gz

RUN echo "ServerName kali" >> /etc/apache2/apache2.conf

WORKDIR /root

VOLUME /root
VOLUME /var/lib/postgresql
VOLUME /opt/tools

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
