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

RUN ARACHNI_LINK=$(curl -s http://www.arachni-scanner.com/download/ | grep linux-x86_64.tar.gz\" | cut -d "\"" -f2) \
&& curl -sL $ARACHNI_LINK | tar xvz -C /opt \
&& ARACHNI_VERSION=$(echo $ARACHNI_LINK | cut -d "-" -f2,3) \
&& mv /opt/arachni-$ARACHNI_VERSION /opt/arachni

EXPOSE 9292

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
