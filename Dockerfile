FROM ubuntu:jammy
ARG TAGS
WORKDIR /usr/loca/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
  apt upgrade -y && \
  apt install -y sudo software-properties-common curl git build-essential && \
  apt-add-repository -y ppa:ansible/ansible && \
  apt update && \
  apt install -y ansible && \
  apt clean autoclean && \
  apt autoremove --yes
COPY . .
CMD [ "sh", "-c", "ansible-playbook $TAGS local.yml"
