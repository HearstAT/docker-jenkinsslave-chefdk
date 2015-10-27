#!/bin/bash

echo "Installing RVM"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

source ${JENKINS_HOME}/.rvm/scripts/rvm

echo "Installing ruby 1.9.3"
rvm install ruby-1.9.3

echo "Setting rvm to use 1.9.3"
rvm use 1.9.3

echo "Installing Gem List"
cd ${JENKINS_HOME} && bundle install
