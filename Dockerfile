FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install curl \
              git
              
WORKDIR /

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN curl -L https://get.spectralops.io/latest/x/sh\?dsn\=<your DSN>| sh
