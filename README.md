# open-vm-tools

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/rustic/open-vm-tools/tree/master.svg?style=shield)](https://dl.circleci.com/status-badge/redirect/gh/rustic/open-vm-tools/tree/master)
[![Image Size](https://img.shields.io/docker/image-size/rustic/open-vm-tools/latest)](https://hub.docker.com/repository/docker/rustic/open-vm-tools)
[![License](https://img.shields.io/github/license/rustic/open-vm-tools)](https://hub.docker.com/repository/docker/rustic/open-vm-tools)

Systemd Compatible Version of Open VM Tools

```docker
docker run -d --rm -v /run/systemd:/run/systemd:ro --net=host --pid=host rustic/open-vm-tools
```

For systems like Fedora CoreOS, this can be started via Systemd: /etc/systemd/system/open-vm-tools.service

```shell
[Unit]
Description=Open VM Tools
After=network-online.target
Wants=network-online.target
ConditionVirtualization=vmware

[Service]
TimeoutStartSec=0
ExecStartPre=-/bin/docker kill open-vm-tools
ExecStartPre=-/bin/docker rm open-vm-tools
ExecStartPre=/bin/docker pull rustic/open-vm-tools:latest
ExecStart=/bin/docker run \
  --detach \
  -v /run/systemd:/run/systemd:ro \
  --pid=host \
  --net=host \
  --name open-vm-tools rustic/open-vm-tools:latest
KillMode=none
Type=forking
[Install]
WantedBy=multi-user.target
```

Or added to the FCCT file so it is launched on VM creation.

```shell
systemd:
  units:
    - name: open-vm-tools.service
      enabled: true
      contents: |
        [Unit]
        Description=Open VM Tools
        After=network-online.target
        Wants=network-online.target
        ConditionVirtualization=vmware

        [Service]
        TimeoutStartSec=0
        ExecStartPre=-/bin/docker kill open-vm-tools
        ExecStartPre=-/bin/docker rm open-vm-tools
        ExecStartPre=/bin/docker pull rustic/open-vm-tools:latest
        ExecStart=/bin/docker run \
          --detach \
          -v /run/systemd:/run/systemd:ro \
          --pid=host \
          --net=host \
          --name open-vm-tools rustic/open-vm-tools:latest
        KillMode=none
        Type=forking
        [Install]
        WantedBy=multi-user.target
```
