FROM centos:7

MAINTAINER Hearst Automation Team "atat@hearst.com"

# Environment Variables
ENV JENKINS_HOME /var/lib/jenkins

RUN yum install -y \
    java-1.7.0-openjdk \
    openssh-server \
    ruby \
    git \
    zip
    wget

# Install ChefDK
RUN yum install -y https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chefdk-0.9.0-1.el7.x86_64.rpm

# Setup SSH
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Add user and group jenkins to the image
RUN groupadd jenkins && \
    adduser -d $JENKINS_HOME -s /bin/bash -g jenkins jenkins

# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Setup directories and rights so Jenkins user can do things without sudo
COPY systemconfig.sh /tmp/systemconfig.sh
RUN bash -c /tmp/systemconfig.sh

RUN yum clean all && rm -rf /tmp/* /var/tmp/*

# Volumes
VOLUME /var/lib/jenkins

# Standard SSH port
EXPOSE 22

#Run ssh to connect
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
