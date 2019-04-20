#!/bin/sh

# Update suricata rules
suricata-update

# Start cron
crond

# Add cronjob
crontab /etc/crontabs/suricata-update-cron

# Started suricata
/usr/bin/suricata -c /etc/suricata/suricata.yaml -q 0

