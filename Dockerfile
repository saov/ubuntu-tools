#Base Image
FROM ubuntu:plucky-20241213
RUN apt-get update
RUN apt list --upgradable
RUN apt-get upgrade -y
#Install packages
RUN apt-get install sudo fastfetch nano vim git inetutils-ping curl netcat-traditional net-tools telnet dnsutils traceroute whois wget dos2unix apt-transport-https software-properties-common gnupg -y
#Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
#Install PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb
RUN sudo dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN sudo apt-get update
RUN sudo apt-get install powershell -y
#Install Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
RUN sudo apt-get update
RUN sudo apt-get install terraform -y
#Install dotnet
RUN sudo apt-get install dotnet-sdk-8.0 -y
#Clean apt
RUN sudo apt-get update
RUN sudo apt list --upgradable
RUN sudo apt-get upgrade -y
RUN sudo apt-get clean
#User
RUN ln -sf /bin/bash /bin/sh
RUN useradd -p "$(openssl passwd -1 '')" -ms /bin/bash saov
RUN usermod -aG sudo saov
USER saov
WORKDIR /home/saov
#Install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
#Configured fastfetch
RUN echo 'fastfetch -l ubuntu2_old --color-title green --logo-preserve-aspect-ratio true --color-keys blue --no-buffer true --percent-color-green yellow -s Title:Break:OS:Kernel:Host:Bios:Shell:Terminal:CPU:CPUUsage:Memory:Swap:Disk:LocalIp:PublicIp:Break:Colors' >> ~/.bashrc
#Info
RUN echo 'echo -e "\n\e[1;34mSAOV ubuntu-tools version\e[1;0m: \e[1;32m3.0\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mSudo password\e[1;0m: \e[1;33m<<\e[1;32mENTER\e[1;33m>>\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mCluster\e[1;0m: \e[1;36m$Cluster\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mNode\e[1;0m: \e[1;36m$Node\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mAzure-Cli\e[1;0m: \e[1;36m2.67.0\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mdotnet\e[1;0m: \e[1;36m8.0.11\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mPowershell\e[1;0m: \e[1;36m7.4.6\e[1;0m"' >> ~/.bashrc
RUN echo 'echo -e "\e[1;34mTerraform\e[1;0m: \e[1;36m1.10.3\e[1;0m\n"' >> ~/.bashrc
