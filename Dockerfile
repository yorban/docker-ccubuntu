#
# Ubuntu with RabbitMQ and MongoDB Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:latest
MAINTAINER mathias.sb@gmail.com

# Install.
RUN apt-get update && apt-get install -y mongodb rabbitmq-server supervisor
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /data/db/
  
# Add files.
ADD ./configs/supervisord.conf /etc/supervisord.conf

# Define default command.
EXPOSE 27017 5672
CMD ["supervisord"]
