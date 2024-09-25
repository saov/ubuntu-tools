# ubuntu-tools
Ubuntu 24.04 LTS With sudo, nano, vim, git, inetutils-ping, curl, netcat-traditional, net-tools, telnet, dnsutils, traceroute, whois, wget and dos2unix installed

Docker Image

https://hub.docker.com/r/saov/ubuntu-tools

Docker Set Variables
```
${hostname} = ${nodename} = hostname
```

Docker Run
```
docker run --rm -it --name ubuntu-tools -e Cluster=${hostname} -e Node=${nodename} -h ubuntu-tools saov/ubuntu-tools /bin/bash
```

Kubernetes Create Pod
```
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
 name: ubuntu-tools
 namespace: default
spec:
 containers:
  - name: ubuntu-tools
    image: saov/ubuntu-tools:latest
    env:
    - name: Cluster
      value: $(kubectl config get-contexts --no-headers | awk '{print $3}')
    - name: Node
      valueFrom:
       fieldRef:
        fieldPath: spec.nodeName
    command: ["/bin/sh", "-ec", "sleep infinity"]
    resources:
     limits:
      cpu: 100m
      memory: 100Mi
EOF
```

Kubernetes Exec Pod
```
kubectl exec --stdin --tty ubuntu-tools -- /bin/bash
```
