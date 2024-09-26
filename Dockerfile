FROM ubuntu:oracular-20240913
RUN apt update
RUN apt list --upgradable
RUN apt upgrade -y
RUN apt install sudo fastfetch nano vim git inetutils-ping curl netcat-traditional net-tools telnet dnsutils traceroute whois wget dos2unix -y
RUN apt clean
RUN ln -sf /bin/bash /bin/sh
RUN useradd -p "$(openssl passwd -1 '')" -ms /bin/bash saov
RUN usermod -aG sudo saov
USER saov
WORKDIR /home/saov
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
RUN echo 'fastfetch -l ubuntu2_old --color-title green --logo-preserve-aspect-ratio true --color-keys blue --no-buffer true --percent-color-green yellow -s Title:Break:OS:Kernel:Host:Bios:Shell:Terminal:CPU:CPUUsage:Memory:Swap:Disk:LocalIp:PublicIp:Break:Colors' >> ~/.bashrc
RUN echo 'echo -e "\n\e[1;34mSAOV ubuntu-tools version\e[1;0m: \e[1;32m1.0\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mSudo password\e[1;0m: \e[1;33m<<\e[1;32mENTER\e[1;33m>>\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mCluster\e[1;0m: \e[1;36m$Cluster\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mNode\e[1;0m: \e[1;36m$Node\e[1;0m\n"' >> ~/.bashrc
