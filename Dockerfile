FROM ubuntu:oracular-20240617
RUN apt update
RUN apt list --upgradable
RUN apt upgrade -y
RUN apt install nano vim git inetutils-ping curl netcat-traditional net-tools telnet dnsutils wget -y
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
RUN ln -sf /bin/bash /bin/sh
