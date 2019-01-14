FROM centos:7
#ENV container docker
## Install Suricata as describe here https://redmine.openinfosecfoundation.org/projects/suricata/wiki/CentOS_Installation
RUN yum install -y epel-release \
    && yum update -y
RUN yum install -y gcc libpcap-devel pcre-devel libyaml-devel file-devel \
    zlib-devel jansson-devel nss-devel libcap-ng-devel libnet-devel \
    libnetfilter_queue-devel lua-devel wget tar make
RUN cd /tmp/ \
    && wget https://www.openinfosecfoundation.org/download/suricata-4.1.2.tar.gz \
    && tar -xvzf /tmp/suricata-4.1.2.tar.gz 
RUN cd /tmp/suricata-4.1.2/ \
    && ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-nfqueue --enable-lua 
RUN cd /tmp/suricata-4.1.2/ \
    && make \
    && make install-full\
    && ldconfig
# Install Suricata-update utility https://github.com/OISF/suricata-update
RUN yum install -y python-pip python-yaml
RUN pip install --pre --upgrade suricata-update
RUN yum install -y cronie
COPY suricata-update.sh /etc/suricata/suricata-update.sh
# COPY file needed for the Suricata efficiency
RUN yum install -y cronie
COPY suricata-update-cron /etc/cron.d/suricata-update-cron
RUN chmod +x /etc/cron.d/suricata-update-cron
COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
RUN chmod +x /tmp/docker-entrypoint.sh
COPY suricata.yaml /etc/suricata/suricata.yaml


