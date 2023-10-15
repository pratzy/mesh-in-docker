FROM mcr.microsoft.com/devcontainers/base:jammy
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install git
COPY post-install.sh .
RUN chmod +x ./post-install.sh && ./post-install.sh
