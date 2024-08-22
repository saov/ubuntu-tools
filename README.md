# ubuntu-tools
Ubuntu 24.04 LTS With sudo, nano, vim, git, inetutils-ping, curl, netcat-traditional, net-tools, telnet, dnsutils and wget installed

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
    - name: ClusterKubernetes
      value: $(kubectl config get-contexts --no-headers | awk '{print $3}')
    - name: NodeName
      valueFrom:
       fieldRef:
        fieldPath: spec.nodeName
    command: ["/bin/sh", "-ec", "sleep infinity"]
    resources:
     limits:
      cpu: 100m
      memory: 100Mi
EOF
