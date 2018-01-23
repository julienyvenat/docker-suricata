# Docker Suricata

Run the version 4.0.3 of Suricata with Docker and Docker Compose.

Suricata is an Open Source IDS, IPS and NSM app.
For more information about it, follow this link --> [HERE!!](https://suricata-ids.org/)

This a ready-to-use version of Suricata.
The default configuration is set.
Any changement has been perform

## Requirements

### Host setup

1. Install [Docker](https://www.docker.com/community-edition#/download) version **17.12.0+**
2. Install [Docker Compose](https://docs.docker.com/compose/install/) version **1.6.0+**
3. Clone this repository


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

### Verify if it's working

From a client station, (your computer for the first scenario else on a computer from the LAN)

```console
curl -A "BlackSun" www.google.com
```

If Suricata instance is operating correctly, you should  see the following line end up in your "fast.log" in /var/log/suricata:

```console
[**] [1:2008983:6] ET USER_AGENTS Suspicious User Agent (BlackSun) [**] [Classification: A Network Trojan was detected] [Priority: 1] {TCP}
```

## Addons

You can modify the code as you wish. 
For Suricata question please refer to the official documentation --> [HERE!!](https://suricata-ids.org/docs/)

Thank you !!