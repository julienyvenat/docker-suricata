FROM centos:7
ENV container docker
RUN yum install -y epel-release 
RUN yum install -y gcc libpcap-devel pcre-devel libyaml-devel file-devel \
  zlib-devel jansson-devel nss-devel libcap-ng-devel libnet-devel \
  libnetfilter_queue-devel lua-devel wget tar make
RUN cd /tmp/ \
    && wget https://www.openinfosecfoundation.org/download/suricata-4.0.3.tar.gz \
    && tar -xvzf /tmp/suricata-4.0.3.tar.gz 
RUN cd /tmp/suricata-4.0.3/ \
    && ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-nfqueue --enable-lua 
RUN cd /tmp/suricata-4.0.3/ \
    && make \
    && make install-full \
    && ldconfig
RUN rm -f /tmp/suricata-4.0.3.tar.gz \
    && rm -Rf /tmp/suricata-4.0.3/
