# Pull the base image
FROM ubuntu:22.04

MAINTAINER Mahmoud Elwazeer <elwazeermahmoud48@gmail.com>

RUN apt-get update && apt-get install -y cowsay fortune

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
