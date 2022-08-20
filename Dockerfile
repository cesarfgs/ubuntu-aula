FROM ubuntu

WORKDIR /pastalinux
RUN apt update
RUN apt upgrade -y
SHELL ["/bin/bash", "-c"]
RUN apt-get install openssh-server -y
RUN apt-get install vim -y
RUN sed -i '/PermitRootLogin prohibit-password/c\PermitRootLogin yes #prohibit-password' /etc/ssh/sshd_config
RUN service ssh status
RUN service ssh start
RUN service ssh status

EXPOSE 22 80 443
