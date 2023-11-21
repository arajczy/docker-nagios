# [arajczy/nagios](https://github.com/arajczy/docker-nagios)

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/arajczy/nagios/latest?logo=docker)
![Docker Pulls](https://img.shields.io/docker/pulls/arajczy/nagios?logo=docker)
[![GitHub License](https://img.shields.io/github/license/arajczy/docker-nagios?logo=github&color=750014)](https://github.com/arajczy/docker-nagios/blob/trunk/LICENCE)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/arajczy/docker-nagios/trunk?logo=github)](https://github.com/arajczy/docker-nagios/commits/trunk)
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/arajczy/docker-nagios/build-and-publish.yml?logo=github)](https://github.com/arajczy/docker-nagios/pkgs/container/nagios)
[![GitHub issues](https://img.shields.io/github/issues/arajczy/docker-nagios?logo=github)](https://github.com/arajczy/docker-nagios/issues/new/choose)

[Nagios Core](https://www.nagios.org/projects/nagios-core/) serves as the basic event scheduler, event processor, and alert manager for elements that are monitored. It features several APIs that are used to extend its capabilities to perform additional tasks, is implemented as a daemon written in C for performance reasons, and is designed to run natively on Linux/\*nix systems.

## Components

| Product / Latest | Installed |
| ---: | ---: |
| [![Nagios Core](https://img.shields.io/github/v/tag/NagiosEnterprises/nagioscore?logo=github&label=Nagios%20Core)](https://github.com/NagiosEnterprises/nagioscore) | 4.5.0 |
| [![Nagios Plugins](https://img.shields.io/github/v/tag/nagios-plugins/nagios-plugins?logo=github&label=Nagios%20Plugins)](https://github.com/nagios-plugins/nagios-plugins) | 2.4.6 |
| [![NCPA](https://img.shields.io/github/v/tag/NagiosEnterprises/ncpa?logo=github&label=NCPA)](https://github.com/NagiosEnterprises/ncpa) | 3.0.0 |
| [![NRPE](https://img.shields.io/github/v/tag/NagiosEnterprises/nrpe?logo=github&label=NRPE)](https://github.com/NagiosEnterprises/nrpe) | 4.1.0 |
| [![NSCA](https://img.shields.io/github/v/tag/NagiosEnterprises/nsca?logo=github&label=NSCA)](https://github.com/NagiosEnterprises/nsca) | 2.10.2 |
| [![MongoSH](https://img.shields.io/github/v/tag/mongodb-js/mongosh?logo=github&label=MongoSH)](https://github.com/mongodb-js/mongosh) | 2.1.0 |
| [![Check-MongoDB Plugins](https://img.shields.io/github/v/tag/m-erhardt/check-mongodb-plugins?logo=github&label=Check-MongoDB%20Plugins)](https://github.com/m-erhardt/check-mongodb-plugins) | 1.0.0 |
| [![NagiosTV](https://img.shields.io/github/v/tag/chriscareycode/nagiostv-react?logo=github&label=NagiosTV)](https://github.com/chriscareycode/nagiostv-react) | 0.8.7 |
| [![s6-overlay](https://img.shields.io/github/v/tag/just-containers/s6-overlay?logo=github&label=s6-overlay)](https://github.com/just-containers/s6-overlay) | 3.1.6.2 |

## Application Setup

-   Access the webui at `http://<your-ip>:8080`, for more information check out [Nagios Core](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/toc.html).
-   Access [NagiosTV](https://nagiostv.com/) webui at `http://<your-ip>:8080/nagiostv`.

[<img src="https://www.nagios.org/wp-content/uploads/2023/01/Nagios-Blue-N.svg" alt="Nagios" width="250" />](https://www.nagios.org/)

### Download image

```sh
docker pull ghcr.io/arajczy/nagios:latest
```

## Usage

### docker cli

```sh
docker run \
    -d \
    --name=nagios \
    --hostname= `#optional` \
    --cap-add=NET_RAW
    --env MAIL_ADDRESS= `#optional` \
    --env MAIL_PASS= `#optional` \
    --env MAIL_RELAY_HOST= `#optional` \
    --env NAGIOS_FQDN= `#optional` \
    --env NAGIOSADMIN_USER= `#optional` \
    --env NAGIOSADMIN_PASS= `#optional` \
    --env NAGIOS_THEME= `#optional` \
    --env NAGIOS_STARTPAGE= `#optional` \
    --env TZ=Etc/UTC
    --publish=8080:80 \
    --volume /path/to/config:/usr/local/nagios/etc \
    --volume /path/to/log:/usr/local/nagios/var \
    --volume /path/to/themes:/usr/local/nagios/themes \
    ghcr.io/arajczy/nagios:latest
```

### podman cli

```sh
podman run \
    -d \
    --replace \
    --name=nagios \
    --hostname= `#optional` \
    --cap-add=NET_RAW
    --env MAIL_ADDRESS= `#optional` \
    --env MAIL_RELAY_HOST= `#optional` \
    --env NAGIOS_FQDN= `#optional` \
    --env NAGIOSADMIN_USER= `#optional` \
    --env NAGIOS_THEME= `#optional` \
    --env NAGIOS_STARTPAGE= `#optional` \
    --tz=Etc/UTC \
    --publish=8080:80 \
    --secret mail-pass,type=env,target=MAIL_PASS \
    --secret nagiosadmin-pass,type=env,target=NAGIOSADMIN_PASS \
    --volume /path/to/config:/usr/local/nagios/etc \
    --volume /path/to/log:/usr/local/nagios/var \
    --volume /path/to/themes:/usr/local/nagios/themes \
    ghcr.io/arajczy/nagios:latest
```

### docker-compose

```yaml
    ---
    version: '3'
    services:
      nagios:
        image: arajczy/nagios:jammy
        hostname: nagios.example.com
        cap_add:
          - NET_RAW
        environment:
          MAIL_ADDRESS: #optional
          MAIL_PASS: #optional
          MAIL_RELAY_HOST: #optional
          NAGIOS_FQDN: #optional
          NAGIOSADMIN_USER: #optional
          NAGIOSADMIN_PASS: #optional
          NAGIOS_THEME: #optional
          NAGIOS_STARTPAGE: #optional
          TZ: Etc/UTC
        ports: 8080:80/tcp
        volumes:
        - nagios-etc:/opt/nagios/etc
        - nagios-themes:/opt/nagios/themes
        - nagios-var:/opt/nagios/var
    
    volumes:
        nagios-etc:
        nagios:themes:
        nagios-var:
```

### systemd container service

On Linux hosts with podman installed you can run this container as a systemd service, too.

```ini
[Unit]
Description=Nagios Core monitoring container
Wants=network-online.target
After=network-online.target

[Container]
AddCapability=NET_RAW
ContainerName=nagios
Environment=MAIL_ADDRESS= #optional
Environment=MAIL_RELAY_HOST= #optional
Environment=NAGIOS_FQDN= #optional
Environment=NAGIOSADMIN_USER= #optional
Environment=NAGIOS_THEME= #optional
Environment=NAGIOS_STARTPAGE= #optional
HostName= #optional
Image=ghcr.io/arajczy/nagios:fedora
Notify=common
PublishPort=8080:80/tcp
Secret=mail-pass,type=env,target=MAIL_PASS
Secret=nagiosadmin-pass,type=env,target=NAGIOSADMIN_PASS
Timezone=local
Volume=nagios-etc:/usr/local/nagios/etc
Volume=nagios-themes:/usr/local/nagios/themes
Volume=nagios-var:/usr/local/nagios/var

[Service]
Restart=on-failure
TimeoutStopSec=70

[Install]
WantedBy=default.target
```

#### steps to enable nagios container as a systemd service
1.  copy below content and paste it to `$HOME/.config/containers/systemd/nagios.container`
2.  perform a systemd daemon-reload with `systemctl --user daemon-reload`
3.  start service with `systemctl --user start nagios.service`.

#### steps to disable nagios container service
1.  enter commands: `systemctl --user stop nagios.service`
2.  remove container file: `$HOME/.config/containers/systemd/nagios.container`
3.  perform a systemd daemon-reload with `systemctl --user daemon-reload`

## Parameters

| Parameter | Function |
| :----: | --- |
| `-p 8080` | WebUI |
| `-e MAIL_ADDRESS=` | Specify your email address |
| `-e MAIL_PASS=` | Specify your email application password |
| `-e MAIL_RELAY_HOST=` | default: "[smtp.gmail.com]:587" |
| `-e NAGIOS_FQDN=` | Specify your server FQDN |
| `-e NAGIOSADMIN_USER=` | default: nagiosadmin |
| `-e NAGIOSADMIN_PASS=` | default: nagios |
| `-e NAGIOS_THEME=` | "default", "dark" |
| `-e NAGIOS_STARTPAGE=` | "default", "services", "hosts", "overview", "summary", "grid" |
| `-v /path/to/config` | Persistent volume for nagios config |
| `-v /path/to/log` | Persistent volume for nagios logs |
| `-v /path/to/themes` | Persistent volume for themes |

## Support Info

-   Shell access inside running container:
    ```sh
    docker exec -it nagios bash
    ```
-   monitor the logs of running container:
    ```sh
    docker logs -f nagios
    ```
