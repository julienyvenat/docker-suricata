#!/bin/bash

# Update suricata rules
suricata-update

# Making an auto-update every 12 hours
(/usr/bin/crontab -l 2>/dev/null; echo "0 12 * * * /etc/suricata/suricata-update.sh") | /usr/bin/crontab -

# Started suricata
/usr/bin/suricata -c /etc/suricata/suricata.yaml -q 0

