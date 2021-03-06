#!/bin/bash

DIRECTORYLIST="/usr/lib/gems /usr/lib/ruby/gems/ ${JENKINS_HOME} /usr/lib/ruby /var/lib/gems"

for dir in ${DIRECTORYLIST}; do
    mkdir -p ${dir}
    chown -R jenkins:jenkins ${dir}
    chmod -R 775 ${dir}
done

BINLIST='/usr/bin /usr/local/bin /etc/ssh/sshd_config /etc/ssh'

for bin in ${BINLIST}; do
    chmod -R 777 ${bin}
done
