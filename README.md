# ubuntu-tools
Ubuntu 24.04 LTS With nano, vim, git, inetutils-ping, curl, netcat-traditional, net-tools, telnet, dnsutils and wget installed

Docker Image

https://hub.docker.com/r/saov/ubuntu-tools

Docker Run
```
docker run --rm -it --name ubuntu-tools -h ubuntu-tools saov/ubuntu-tools /bin/bash
```

Kubernetes Pod
```
kubectl run ubuntu-tools --rm -i --tty --restart=Never --image=saov/ubuntu-tools:latest -- /bin/bash
```
