FROM debian:bullseye

RUN	apt-get update && apt-get upgrade -y
RUN apt install wget -y

RUN wget https://github.com/portainer/portainer/releases/download/2.21.5/portainer-2.21.5-linux-amd64.tar.gz && \
    tar -xvf portainer-2.21.5-linux-amd64.tar.gz && rm portainer-2.21.5-linux-amd64.tar.gz
    
ENTRYPOINT ["/portainer/portainer", "-H", "unix:///var/run/docker.sock"]