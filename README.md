hearstat/jenkins-slave-chefdk
================

Container to be utilized with the Jenkins Docker Plugin

This container is to be configured support chef cookbooks and ruby based building/testing.

## Build Info
* Base Image: centos:7
* ChefDK Version: 0.9.0
* Gems
    * rubocop

## Usage


## Building

To build the image, do the following:

```
% docker build github.com/hearstat/docker-jenkinsslave-chefdk
```

A prebuilt container is available in the docker index.

```
% docker pull hearstat/jenkins-slave-chefdk
```
