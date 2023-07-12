# base image
FROM ubuntu:latest

# Set up Tools in Docker image
RUN apt-get update && apt-get install -y \
    openssh-server

# Run SSH Server in Docker image
RUN mkdir /var/run/sshd
RUN echo 'root:1111' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Expose SSH port
EXPOSE 22

# Run SSHD
CMD ["/usr/sbin/sshd", "-D"]
