FROM ubuntu:oracular-20240617
RUN apt update
RUN apt list --upgradable
RUN apt upgrade -y
RUN apt install sudo nano vim git inetutils-ping curl netcat-traditional net-tools telnet dnsutils wget dos2unix -y
RUN ln -sf /bin/bash /bin/sh
RUN useradd -p "$(openssl passwd -1 '')" -ms /bin/bash saov
RUN usermod -aG sudo saov
USER saov
WORKDIR /home/saov
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
RUN echo 'echo -e "\e[1;34mCluster Kubernetes: \e[1;36m$ClusterKubernetes\e[1;0m\n"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mNode Name: \e[1;36m$NodeName\e[1;0m\n"' >> ~/.bashrc
