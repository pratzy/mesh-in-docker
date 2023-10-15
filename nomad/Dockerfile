FROM ubuntu:jammy

RUN apt-get update && apt-get install wget gpg coreutils lsb-core curl -y
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN apt-get update && apt-get install nomad -y
RUN curl -L -o cni-plugins.tgz "https://github.com/containernetworking/plugins/releases/download/v1.0.0/cni-plugins-linux-$( [ $(uname -m) = aarch64 ] && echo arm64 || echo amd64)"-v1.0.0.tgz && \
  mkdir -p /opt/cni/bin && \
  tar -C /opt/cni/bin -xzf cni-plugins.tgz

# RUN echo 1 | tee /proc/sys/net/bridge/bridge-nf-call-arptables && \
#   echo 1 | tee /proc/sys/net/bridge/bridge-nf-call-ip6tables && \
#   echo 1 | tee /proc/sys/net/bridge/bridge-nf-call-iptables

# Add Docker's official GPG key:
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# RUN docker run --rm -d --name envoy -p 10000:10000 envoyproxy/envoy:v1.27-latest

ENTRYPOINT [ "/bin/bash" ]