FROM alpine
#ENV container docker
## Install Suricata as describe here https://redmine.openinfosecfoundation.org/projects/suricata/wiki/Distributions_Containing_Suricata Repository : https://pkgs.alpinelinux.org/package/edge/community/x86/suricata
RUN apk add suricata --no-cache
# Install Suricata-update utility https://github.com/OISF/suricata-update
RUN apk add python py-pip
RUN pip install suricata-update
COPY suricata-update.sh /etc/suricata/suricata-update.sh
# COPY file needed for the Suricata efficiency
COPY suricata-update-cron /etc/crontabs/suricata-update-cron
RUN chmod +x /etc/crontabs/suricata-update-cron
COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
RUN chmod +x /tmp/docker-entrypoint.sh
COPY suricata.yaml /etc/suricata/suricata.yaml
# Forwarding suricata application logs to stdout
RUN ln -sf /dev/stdout /var/log/suricata/suricata.log