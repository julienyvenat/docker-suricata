# Docker Suricata

Run the version 4.0.4 of Suricata with Docker and Docker Compose.

Suricata is an Open Source IDS, IPS and NSM engine.
For more information about it, follow this link --> [HERE!!](https://suricata-ids.org/)

This is a ready-to-use version of Suricata.

## Requirements

### Host setup

1. Install [Docker](https://www.docker.com/community-edition#/download) version **17.12.0+**
2. Install [Docker Compose](https://docs.docker.com/compose/install/) version **1.6.0+**


## Usage 

### Initial setup

First: Start Suricata using docker-compose : (you have to be inside the repository to perform)

```console
docker-compose up
```

If you want to run it in background :

```console
docker-compose up -d
```

Once Suricata is launch you have to redirect all your traffic to suricata.

You have to get root rights to modify iptables.

If Suricata is installed on a computer, add this lines:

```console
iptables -I INPUT -j NFQUEUE
iptables -I OUTPUT -j NFQUEUE
```

if Suricata is running on a gateway, add this line:

```console
iptables -I FORWARD -j NFQUEUE
```

**Warning:** if you have to stop Suricata. Delete this iptables rules before stopping Suricata: (replace the asterisk by the right word)

```console
iptables -D * -j NFQUEUE
```

### Verify if it's working

From a client station, (your computer for the first scenario else on a computer from the LAN)

```console
curl -A "BlackSun" www.google.com
```

If Suricata instance is operating correctly, you should  see the following line end up in your "fast.log" in /var/log/suricata:

```console
[**] [1:2008983:6] ET USER_AGENTS Suspicious User Agent (BlackSun) [**] [Classification: A Network Trojan was detected] [Priority: 1] {TCP}
```
## About

### Docker

This Docker is build from centos 7 official docker. 

The container shares the network of the host. 

### Suricata

1. Configuration:

 The basic configuration of suricata has been changed a little bit.

 Now the rules inside the container are inside the folder /var/lib/suricata/rules

 This rules will be update every 6 hours thanks to the new feature [suricata-update](http://suricata-update.readthedocs.io/en/latest/index.html)

 Moreover, the netfilter mode is set to **repeat**. This mode is used to reinject all packets inside iptables. This permit to not bypassing some other iptables rules.

2. Logs:

 Fast, drop and stats logs are enabled. They're inside the /var/log/suricata folder. 

 All other logs types are disabled.  

3. Rules:
 
 You can add your own rules in the "my.rules" file.

 To reload the suricata rules you can use the **reload.sh** script. Or you can launch a bach inside the docker and execute the appropriate command.

```console
docker exec -it suricata /bin/bash
suricatasc -c reload-rules
```

An example rule is set. The message "TEST ping google" will be log inside fast.log if you ping 8.8.8.8 (Google DNS).

## Addons

You can modify the code as you wish. 
For Suricata question please refer to the official documentation --> [HERE!!](https://suricata-ids.org/docs/)

Thank you !!
